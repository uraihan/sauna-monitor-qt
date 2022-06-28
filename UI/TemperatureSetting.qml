import QtQuick

Rectangle {
    id: temperatureSetting
    anchors.fill: parent
    color: "grey"

    property var tempSetting: null

    function createTempSettingDialog() {
        if (tempSetting === null) {
            var component = Qt.createComponent("TemperatureSetting.qml")
            about = component.createObject(temperatureSetting, {"x": 0, "y": 0})
            if (tempSetting) {
                about.anchors.fill = temperatureSetting
                about.destroyAbout.connect(destroyTempSettingDialog)
            }
        }
    }

    function destroyTempSettingDialog() {
        if (tempSetting !== null) {
            tempSetting.destroy()
            tempSetting = null
        }
    }

    ListModel {
        id: tempOptions
        ListElement {
            pos: 0
            settingsText: "Celsius (C)" }
        ListElement {
            pos: 1
            settingsText: "Fahrenheit (F)" }
        ListElement {
            pos: 2
            settingsText: "Cancel" }
    }

}
