import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../Components"

Item {
    id: stockSelector
    anchors.fill: parent

    // background matching main.qml gradient
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0f0c29" }
            GradientStop { position: 0.5; color: "#302b63" }
            GradientStop { position: 1.0; color: "#24243e" }
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        // Title
        Text {
            text: "Stock Selector"
            font.pixelSize: 36
            font.bold: true
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: "Select stocks to analyze (placeholder)"
            font.pixelSize: 16
            color: "#b0b0b0"
            horizontalAlignment: Text.AlignHCenter
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 12

            ModernIconButton {
                icon: "⬅"
                label: "Back"
                gradientColor1: "#667eea"
                gradientColor2: "#764ba2"
                onClicked: screenLoader.loadScreen("home")
            }
        }
    }
}
