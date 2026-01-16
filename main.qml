import QtQuick
import QtQuick.Controls
import QtQuick.Window
import "Screens"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1280
    height: 800
    title: "StocBot - Stock Market Prediction"
    
    // Modern background gradient
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0f0c29" }
            GradientStop { position: 0.5; color: "#302b63" }
            GradientStop { position: 1.0; color: "#24243e" }
        }
    }
    
    // Main content loader
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homeScreenComponent
    }
    
    Component {
        id: homeScreenComponent
        HomeScreen {
            onNavigateToStockSelector: {
                console.log("Navigate to Stock Selector")
                // stackView.push(stockSelectorComponent)
            }
            onNavigateToChart: {
                console.log("Navigate to Chart")
                // stackView.push(chartComponent)
            }
            onNavigateToAnalysis: {
                console.log("Navigate to Analysis")
                // stackView.push(analysisComponent)
            }
        }
    }
}
