from PySide6.QtCore import QObject, Signal, Slot, Property
from pathlib import Path


class ScreenLoader(QObject):
    """
    Backend service to manage screen navigation for QML Loader.

    Exposes a `source` property (string) that QML `Loader` can bind to.
    Call `loadScreen(name)` to change the screen by logical name.
    """

    sourceChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        # map logical screen names to qml file paths (relative to the project root)
        self._map = {
            "home": "Screens/HomeScreen.qml",
            "stockSelector": "Screens/StockSelector.qml",
            "chart": "Screens/ChartScreen.qml",
            "analysis": "Screens/AnalysisScreen.qml",
        }
        # default to home screen if present (use absolute file URL)
        default_rel = self._map.get("home", "")
        if default_rel:
            p = Path(__file__).parent.parent / default_rel
            self._source = "file:///" + str(p.resolve().as_posix())
        else:
            self._source = ""

    @Property(str, notify=sourceChanged)
    def source(self):
        return self._source

    @source.setter
    def source(self, value: str):
        if value != getattr(self, "_source", None):
            self._source = value
            self.sourceChanged.emit()

    @Slot(str)
    def loadScreen(self, name: str):
        """Set the `source` for the QML Loader using a logical screen name."""
        qml_path = self._map.get(name)
        if not qml_path:
            # if no mapping, clear source
            self.source = ""
            return

        # make the path absolute and convert to file URL for QML Loader
        p = Path(__file__).parent.parent / qml_path
        self.source = "file:///" + str(p.resolve().as_posix())
