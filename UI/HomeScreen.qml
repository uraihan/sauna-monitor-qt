import QtQuick
import Qt5Compat.GraphicalEffects
import SaunaSysControl

Item {
    id: homeScreen

    Rectangle {
        id: mainBackground
        anchors.fill: parent
        color: "grey"
    }

    Text {
        id: temperature
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 150
        text: saunaController.currentTemp
    }

    Text {
        id: heatingStatus
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: temperature.bottom
        }
        text: saunaController.statusMessage
        color: "white"
        font.pixelSize: 30
    }

    Image {
        id: powerIcon
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: temperature.top
            bottomMargin: 40
        }
        height: 70
        width: 70
        source: "qrc:/asset/power-button.svg"
        MouseArea {
            anchors.fill: parent
            onClicked: mainLoader.source = "qrc:/UI/TurningOff.qml"
        }
    }
    ColorOverlay {
        anchors.fill: powerIcon
        source: powerIcon
        color: "white"
    }

    Image {
        id: settingsIcon
        anchors {
            verticalCenter: parent.verticalCenter
            right: temperature.left
            rightMargin: 100
        }
        height: 70
        width: 70
        source: "qrc:/asset/gear-icon.svg"

        MouseArea {
            anchors.fill: parent
            onClicked: mainLoader.source = "qrc:/UI/SettingsDialog.qml"
        }
    }
    ColorOverlay {
        anchors.fill: settingsIcon
        source: settingsIcon
        color: "white"
    }

    ControlSlider {
        id: tempSlider
        value: saunaController.targetTemp
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: temperature.right
            leftMargin: 112
            topMargin: 80
            bottomMargin: 80
        }
    }
}
