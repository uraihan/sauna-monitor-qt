import QtQuick
import QtQml.Models
import Qt5Compat.GraphicalEffects

Rectangle {
    id: mainSettings
    anchors.fill: parent
    color: "grey"

    property var about: null

    function createAboutDialog() {
        if (about === null) {
            var component = Qt.createComponent("AboutPage.qml")
            about = component.createObject(mainSettings, {"x": 0, "y": 0})
            if (about) {
                about.anchors.fill = mainSettings
                about.destroyAbout.connect(destroyAboutDialog)
            }
        }
    }

    function destroyAboutDialog() {
        if (about !== null) {
            about.destroy()
            about = null
        }
    }

    Image {
        id: backButton
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 30
        }
        source: "qrc:/asset/back-icon.svg"
        height: 50
        width: 50
        MouseArea {
            anchors.fill: parent
            onClicked: mainLoader.source = "qrc:/UI/HomeScreen.qml"
        }
    }

    ListModel {
        id: settingsOptions
        ListElement {
            pos: 0
            settingsText: "Temperature Unit" }
        ListElement {
            pos: 1
            settingsText: "Sauna Schedule" }
        ListElement {
            pos: 2
            settingsText: "About" }
    }

    Rectangle {
        id: settingsRectangle
        width: parent.width / 2
        height: parent.height * 0.6
        anchors.centerIn: parent
        color: "grey"
        border.color: "white"
        border.width: 4
    }

    ListView {
        id: settingsListView
        anchors.fill: settingsRectangle
        model: settingsOptions
        interactive: false
        delegate: Rectangle {
            id: settingButtons
            width: settingsRectangle.width
            height: settingsRectangle.height / 3
            color: "grey"
            border.color: "white"
            border.width: 2

            Text {
                id: settingButtonText
                anchors.centerIn: parent
                color: "black"
                font.pixelSize: 30
                text: settingsText
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (pos === 2) {
                        createAboutDialog()
                    }
                }
            }
        }
    }
}
