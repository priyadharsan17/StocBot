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
    
    // Main content loader (uses backend `screenLoader` to control `Loader` source)
    Loader {
        id: mainLoader
        anchors.fill: parent
        source: screenLoader.source
    }
    
    // Home screen is loaded via `screenLoader.source` by default.
}
