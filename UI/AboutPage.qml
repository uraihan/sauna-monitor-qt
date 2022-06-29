import QtQuick
import QtQuick.Controls


Item {
    id: aboutPage
//    anchors.fill: parent
//    signal destroyAbout()

    Rectangle {
        id: aboutBackground
        width: parent.width / 2
        height: parent.height * 0.7
        anchors.centerIn: parent
        color: "transparent"
    }

    Text {
        id: aboutText
        text: "Made by Umair Raihan using Qt/QML<br>MIT License"
        color: "black"
        font.pixelSize: 20
        anchors.centerIn: aboutBackground
    }

    RoundButton {
        id: backIcon
        height: 50
        width: 50
        text: "\u276E"
        font.pointSize: 15

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: aboutBackground.bottom
            bottomMargin: 30
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                mainWindowToolbar.visible = stackView.depth > 3 ? true : false
                stackView.pop()
            }
        }
    }
}
//    Image {
//        id: backButton
//        anchors {
//            horizontalCenter: parent.horizontalCenter
//            bottom: aboutBackground.bottom
//            bottomMargin: 30
//        }
//        source: "qrc:/asset/back-icon.svg"
//        height: 50
//        width: 50
//        MouseArea {
//            anchors.fill: parent
//            onClicked: aboutPage.destroyAbout()
//        }
//    }

