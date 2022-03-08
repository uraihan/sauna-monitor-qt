import QtQuick 2.15
import QtQuick.Window 2.15
import SaunaSysControl 1.0

Window {
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
        source: "./UI/HomeScreen.qml"
    }
}
