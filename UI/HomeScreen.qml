import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    Rectangle {
        id: mainBackground
        anchors.fill: parent
        color: "black"
    }

    Text {
        id: temperature
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 150
        text: "70"
    }

    Text {
        id: heatingStatus
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: temperature.bottom
            topMargin: 2
        }
        text: "Heating..."
        color: "white"
        font.pixelSize: 30
    }

    Image {
        id: saunaIcon
        anchors {
            top: temperature.top
            right: temperature.left
            rightMargin: 106
            leftMargin: 70
        }
        height: 70
        width: 70
        source: "qrc:/asset/sauna-icon.svg"
    }
    ColorOverlay {
        anchors.fill: saunaIcon
        source: saunaIcon
        color: "white"
    }

    Image {
        id: settingsIcon
        anchors {
            top: temperature.bottom
            right: temperature.left
            rightMargin: 106
            leftMargin: 70
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
}
