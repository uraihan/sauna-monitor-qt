import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Imagine
import SaunaSysControl 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Sauna Temperature Monitor")

    Controls {
        id: saunaController
    }

    Loader {
        id: mainLoader
        anchors.fill: parent
        source: "./UI/Greeter.qml"
    }
}
