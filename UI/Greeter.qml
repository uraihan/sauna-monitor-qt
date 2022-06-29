import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Controls


Item {
    id: greeterScreen
//    property var about: null

//    function createAboutDialog() {
//        if (about === null) {
//            var component = Qt.createComponent("AboutPage.qml")
//            about = component.createObject(greeterScreen, {"x": 0, "y": 0})
//            if (about) {
//                about.anchors.fill = greeterScreen
//                about.destroyAbout.connect(destroyAboutDialog)
//            }
//        }
//    }

//    function destroyAboutDialog() {
//        if (about !== null) {
//            about.destroy()
//            about = null
//        }
//    }

    Text {
        id: greeterText
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 30
        }
        text: "SAUNAMASTER 1.0"
        color: "black"
        font.pixelSize: 50

    }

    Image {
        id: saunaIcon
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: greeterText.bottom
            topMargin: 10
        }

        height: 200
        width: 200
        source:"qrc:/asset/sauna-icon.svg"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                stackView.push("qrc:/UI/HomeScreen.qml")
                mainWindowToolbar.visible = true
            }
        }
    }
    ColorOverlay {
        anchors.fill: saunaIcon
        source: saunaIcon
        color: "white"
    }

    Text {
        id: greeterDirection
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: saunaIcon.bottom
            topMargin: -30
        }
        text: "Tap here to start"
        color: "white"
        font.pixelSize: 30
        MouseArea {
            anchors.fill: parent
            onClicked: {
                stackView.push("qrc:/UI/HomeScreen.qml")
                mainWindowToolbar.visible = true
            }
        }
    }

    RoundButton {
        id: infoIcon
        height: 50
        width: 50
        text: "i"
        font.family: "Verdana"
        font.pointSize: 15
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: greeterDirection.bottom
            topMargin: 24
        }
        MouseArea {
            anchors.fill: parent
            onClicked: stackView.push("qrc:/UI/AboutPage.qml")
        }
    }
}
//    Image {
//        id: infoIcon
//        anchors {
//            horizontalCenter: parent.horizontalCenter
//            top: greeterDirection.bottom
//            topMargin: 50
//        }
//        height: 50
//        width: 50
//        source: "qrc:/asset/info-icon.svg"
//        MouseArea {
//            anchors.fill: parent
//            onClicked: createAboutDialog()
//        }
//    }
