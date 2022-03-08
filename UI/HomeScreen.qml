import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
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
