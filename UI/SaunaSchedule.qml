import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


// TODO: Add functionality to book slots of 1-hour interval on the calendar (WIP)
Item {
    id: saunaSchedule
    Rectangle {
        anchors.fill: parent
        color: "grey"
    }

    property var date: new Date()

    ListView {
        id: calendar
        anchors.centerIn: parent
        height: 400
        width: 500
        snapMode: ListView.SnapOneItem
        orientation: ListView.Vertical
        highlightRangeMode: ListView.StrictlyEnforceRange

        model: CalendarModel {
            from: new Date(date.getFullYear(), date.getMonth(), 1)
            to: new Date(date.getFullYear(), date.getMonth(), 28 || 29 || 30 || 31)
        }

        delegate: MonthGrid {
            id: monthGrid
            width: calendar.width
            height: calendar.height
            month: model.month
            year: model.year
            spacing: 0
            locale: Qt.locale("en_US")
            // could use delegate here to highlight
            delegate: Rectangle {
                id: selectedDate
                property bool highlighted: false
                color: highlighted ? "green" : "grey"
                radius: width * 0.5
                scale: 0.8
                enabled: model.month === monthGrid.month

                Text {
                    text: model.day
                    scale: 1.2
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    visible: parent.enabled
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: highlighted = true
                }
            }
        }
//            clicked: Rectangle {
//                id: confirmationDialog
//                color: "brown"
//                Layout.preferredHeight: 100
//                Layout.preferredWidth: 100
//                Layout.alignment: Qt.AlignCenter
//                Label {
//                    text: "you clicked a date!"
//                }
//            }
    }
}
