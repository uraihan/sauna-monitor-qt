import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import SaunaSysControl


Item {
    id: homeScreen
    Text {
        id: temperature
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 150
        text: saunaController.currentTemp
        MouseArea {
            anchors.fill: parent
            onClicked: stackView.push("qrc:/UI/TemperatureSetting.qml")
        }
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
            onClicked: {
                stackView.push("qrc:/UI/TurningOff.qml")
                mainWindowToolbar.visible = false
            }
        }
    }

    ColorOverlay {
        anchors.fill: powerIcon
        source: powerIcon
        color: "white"
    }

    Image {
        id: calendarIcon
        anchors {
            verticalCenter: parent.verticalCenter
            right: temperature.left
            rightMargin: 100
        }
        height: 70
        width: 70
        source: "qrc:/asset/calendar-icon.svg"

        MouseArea {
            anchors.fill: parent
            onClicked: stackView.push("qrc:/UI/SaunaSchedule.qml")
        }
    }
    ColorOverlay {
        anchors.fill: calendarIcon
        source: calendarIcon
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
