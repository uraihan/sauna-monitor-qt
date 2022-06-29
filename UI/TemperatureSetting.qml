import QtQuick
import QtQml.Models


Item {
    id: tempSetting

    Rectangle {
        id: tempBackground
        anchors.fill: parent
        color: "grey"
    }

    ListModel {
        id: tempOptions
        ListElement {
            pos: 0
            settingsText: "Celsius (C)" }
        ListElement {
            pos: 1
            settingsText: "Fahrenheit (F)" }
        ListElement {
            pos: 2
            settingsText: "Cancel" }
    }

    Rectangle {
        id: temperatureRectangle
        width: parent.width / 2
        height: parent.height * 0.6
        anchors.centerIn: parent
        color: "grey"
        border.color: "white"
        border.width: 4
    }

    ListView {
        id: temperatureListView
        anchors.fill: temperatureRectangle
        model: tempOptions
        interactive: false
        delegate: Rectangle {
            id: tempButton
            width: temperatureRectangle.width
            height: temperatureRectangle.height / 3
            color: "grey"
            border.color: "white"
            border.width: 2

            Text {
                id: tempButtonText
                anchors.centerIn: parent
                color: "black"
                font.pixelSize: 30
                text: settingsText
            }

            MouseArea {
                anchors.fill: parent
                onClicked: stackView.pop()
            }
        }
    }
}
