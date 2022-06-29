import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


// TODO: Add functionality to book slots of 1-hour interval
Item {
    id: saunaSchedule
    Rectangle {
        anchors.fill: parent
        color: "grey"
    }

    readonly property date currentDate: new Date()

    MonthGrid {
        id: calendar
        locale: Qt.locale("en_US")
        anchors.centerIn: parent
    }

    Text {
        id: calendarText
        text: saunaSchedule.currentDate.toLocaleString(locale, "MMMM yyyy")
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: calendar.top
            bottomMargin: 10
        }
    }
}
