import sys
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QUrl

from Backend.app_controller import AppController


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    
    # Create and register backend controller
    controller = AppController()
    engine.rootContext().setContextProperty("appController", controller)
    
    # Load main QML file
    qml_file = Path(__file__).parent / "main.qml"
    engine.load(QUrl.fromLocalFile(str(qml_file)))
    
    if not engine.rootObjects():
        sys.exit(-1)
    
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
