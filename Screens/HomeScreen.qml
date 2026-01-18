import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    id: homeScreen
    
    // navigation handled via `screenLoader.loadScreen(name)`
    
    // Content container
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 60
        
        // Title section
        Item {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: titleColumn.width
            Layout.preferredHeight: titleColumn.height
            
            ColumnLayout {
                id: titleColumn
                spacing: 10
                
                Item {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: titleText.width
                    Layout.preferredHeight: titleText.height
                    
                    Text {
                        id: titleText
                        text: "StocBot"
                        font.pixelSize: 72
                        font.bold: true
                        font.family: "Segoe UI"
                        color: "#ffffff"
                    }
                    
                    DropShadow {
                        anchors.fill: titleText
                        source: titleText
                        horizontalOffset: 0
                        verticalOffset: 4
                        radius: 16
                        samples: 33
                        color: "#80000000"
                    }
                }
                
                Text {
                    text: "AI-Powered Stock Market Prediction"
                    font.pixelSize: 20
                    font.family: "Segoe UI"
                    color: "#b0b0b0"
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
        
        // Icon buttons grid
        GridLayout {
            Layout.alignment: Qt.AlignHCenter
            columns: 3
            rowSpacing: 40
            columnSpacing: 40
            
            // Stock Selector Button
            ModernIconButton {
                icon: "📊"
                label: "Stock Selector"
                gradientColor1: "#667eea"
                gradientColor2: "#764ba2"
                onClicked: screenLoader.loadScreen("stockSelector")
            }
            
            // Chart Button
            ModernIconButton {
                icon: "📈"
                label: "Chart View"
                gradientColor1: "#f093fb"
                gradientColor2: "#f5576c"
                onClicked: screenLoader.loadScreen("chart")
            }
            
            // Analysis Button
            ModernIconButton {
                icon: "🔍"
                label: "Analysis"
                gradientColor1: "#4facfe"
                gradientColor2: "#00f2fe"
                onClicked: screenLoader.loadScreen("analysis")
            }
        }
        
        // Footer info
        Text {
            text: "Select an option to get started"
            font.pixelSize: 16
            font.family: "Segoe UI"
            color: "#808080"
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 20
        }
    }
}
