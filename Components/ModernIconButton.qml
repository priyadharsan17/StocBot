import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    id: iconButton
    
    property string icon: "●"
    property string label: "Button"
    property color gradientColor1: "#667eea"
    property color gradientColor2: "#764ba2"
    
    signal clicked()
    
    width: 180
    height: 180
    
    DropShadow {
        anchors.fill: buttonBackground
        source: buttonBackground
        horizontalOffset: 0
        verticalOffset: 10
        radius: 20
        samples: 41
        color: Qt.rgba(0, 0, 0, 0.3)
        cached: true
    }
    
    Rectangle {
        id: buttonBackground
        anchors.fill: parent
        radius: 20
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: iconButton.gradientColor1 }
            GradientStop { position: 1.0; color: iconButton.gradientColor2 }
        }
        
        // Hover and click scale animation
        scale: mouseArea.containsMouse ? 1.05 : 1.0
        
        Behavior on scale {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
        
        SequentialAnimation {
            id: clickAnimation
            NumberAnimation { 
                target: buttonBackground
                property: "scale"
                to: 0.95
                duration: 100
                easing.type: Easing.OutCubic 
            }
            NumberAnimation { 
                target: buttonBackground
                property: "scale"
                to: mouseArea.containsMouse ? 1.05 : 1.0
                duration: 100
                easing.type: Easing.OutCubic 
            }
        }
        
        // Content
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 15
            
            // Icon
            Text {
                text: iconButton.icon
                font.pixelSize: 64
                Layout.alignment: Qt.AlignHCenter
                color: "#ffffff"
            }
            
            // Label
            Text {
                text: iconButton.label
                font.pixelSize: 18
                font.bold: true
                font.family: "Segoe UI"
                color: "#ffffff"
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        
        onClicked: {
            clickAnimation.start()
            iconButton.clicked()
        }
    }
}
