import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Imagine
import SaunaSysControl

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
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

    // TODO: Find a way to display the main label consistently on the middle of the layout
    header: ToolBar {
        id: mainWindowToolbar
        visible: false
        background: Rectangle {
            anchors.fill: parent
            color: "#6affcd"
        }

        anchors {
            right: parent.right
            left: parent.left
        }

        RowLayout {
            anchors.fill: parent

//            ToolButton {
//                action: backAction
//            }

            Label {
                id: backButton
                text: stackView.depth > 3 ? "Back" : " "
                Layout.alignment: Qt.AlignLeft
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (stackView.depth > 2) {
                            stackView.pop()
                        }
                    }
                }
            }

            Label {
                id: appName
                text: "SAUNAMASTERRR"
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 15
            }
        }
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
