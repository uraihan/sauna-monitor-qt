import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Imagine
import SaunaSysControl

ApplicationWindow {
    id: mainWindow
    height: 480
    width: 640
    visible: true
    title: "Sauna Temperature Monitor"

    Controls {
        id: saunaController
    }

//    Action {
//        id: backAction
//        icon.color: "transparent"
//        text: stackView.depth > 2 ? "Back" : " "
//        onTriggered: {
//            if (stackView.depth > 2) {
//                stackView.pop()
//            }
//        }
//    }

    header: ToolBar {
        id: mainWindowToolbar
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#6affcd"
            Label {
                id: appName
                text: "SAUNAMASTERRR"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 15
            }

            Label {
                id: backButton
                text: "Back"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                visible: stackView.depth > 3 ? true : false
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (stackView.depth > 2) {
                            stackView.pop()
                        }
                    }
                }
            }

        }

//        anchors {
//            right: parent.right
//            left: parent.left
//        }
    }

    background: Rectangle {
        color: "grey"
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "./UI/Greeter.qml"
    }

//    Loader {
//        id: mainLoader
//        anchors.fill: parent
//        source: "./UI/Greeter.qml"
//    }
}
