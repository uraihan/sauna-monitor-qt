import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: turnOffBackground
    color: "grey"

    BusyIndicator {
        id: turnOffLoading
        running: image.status === Image.Loading
        anchors.centerIn: parent
        width: 100
        height: 100
    }

    Timer {
        id: turnOffTimer
        interval: 2000
        onTriggered: mainLoader.source = "qrc:/UI/Greeter.qml"
    }

    Text {
        id: farewell
        text: "Thank you, come again!"
        font.pixelSize: 30
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: turnOffLoading.bottom
            topMargin: 10
        }
    }

    Component.onCompleted: {
        turnOffTimer.start()
    }
}
