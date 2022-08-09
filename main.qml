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

    header: ToolBar {
        id: mainWindowToolbar
        visible: false

        Rectangle {
            anchors.fill: parent
            color: "#6affcd"
            Label {
                id: appName
                text: "SAUNAMASTERRR"
                anchors.centerIn: parent
                font.pointSize: 15
            }

            Label {
                id: aboutButton
                text: "About"
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    margins: 15
                }
                font.pixelSize: 13
                MouseArea {
                    anchors.fill: parent
                    onClicked: stackView.push("qrc:/UI/AboutPage.qml")
                }
            }

            Label {
                id: backButton
                text: "Back"
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    margins: 15
                }
                font.pixelSize: 13
                visible: stackView.depth > 2 ? true : false
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
    }

    background: Rectangle {
        color: "grey"
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "./UI/Greeter.qml"
    }
}
