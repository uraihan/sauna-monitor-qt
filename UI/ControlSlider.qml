import QtQuick
import QtQuick.Controls


Slider {
    id: controlSlider
    from: 10
    to: 100
    stepSize: 1
    orientation: Qt.Vertical
    onValueChanged: saunaController.setTargetTemp(value)

    handle: Rectangle {
        y: controlSlider.visualPosition * (controlSlider.availableHeight - height)
        color: "red"
        border.color: "white"
        border.width: 3
        anchors.horizontalCenter: parent.horizontalCenter
        width: 70
        height: 70
        radius: width / 2

        Text {
            anchors.centerIn: parent
            id: targetTemp
            text: controlSlider.value
            color: "white"
            font.pixelSize: 30
        }
    }
}
