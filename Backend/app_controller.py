from PySide6.QtCore import QObject, Signal, Slot


class AppController(QObject):
    """
    Main application controller that bridges Python backend with QML frontend.
    """
    
    # Signals for communication with QML
    dataUpdated = Signal()
    
    def __init__(self, parent=None):
        super().__init__(parent)
        self._stocks = []
    
    @Slot(str)
    def selectStock(self, symbol):
        """Handle stock selection from QML"""
        print(f"Stock selected: {symbol}")
        # Add stock selection logic here
    
    @Slot()
    def refreshData(self):
        """Refresh stock data"""
        print("Refreshing data...")
        # Add data refresh logic here
        self.dataUpdated.emit()
    
    @Slot(str, result=str)
    def getStockInfo(self, symbol):
        """Get stock information"""
        # Add stock info retrieval logic here
        return f"Info for {symbol}"
