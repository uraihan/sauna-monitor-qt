import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("App Example")

    Loader {
        id: mainLoader
        anchors.fill: parent
        source: "./UI/HomeScreen.qml"
    }
}
