import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.15
import Qt.labs.qmlmodels 1.0

Rectangle{
    id:rec
    width: 480
    height: 130
    border.color: "black"
    Column{
        id:col
        leftPadding: 5
        topPadding: 35
        spacing: 15
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("排气温度（℃）")
        }
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("汽缸温度（℃）")
        }
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("燃油压力（bar）")
        }
    }

    Row{
        id:row
        topPadding: 7
        leftPadding: col.width+40
        spacing: 70
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("1")
        }
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("2")
        }
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("3")
        }
        Text {
            font.bold: true
            font.pointSize: 12
            text: qsTr("4")
        }
    }

    Rectangle{
        width: 320
        height: 90
        anchors.top: row.bottom
        anchors.topMargin: 5
        anchors.left: col.right
        anchors.rightMargin: 8

        TableView{
            id:table
            anchors.fill: parent
            clip: true
            model: TableModel {
                TableModelColumn { display: "1" }
                TableModelColumn { display: "2" }
                TableModelColumn { display: "3" }
                TableModelColumn { display: "4" }
                rows: [
                    {
                        "1": 123,
                        "2": "black",
                        "3": "cat",
                        "4": "black"
                    },
                    {
                        "1": "dog",
                        "2": "brown",
                        "3": "cat",
                        "4": "black"
                    },
                    {
                        "1": "bird",
                        "2": "white",
                        "3": "cat",
                        "4": "black"
                    }
                ]
            }

            delegate: Rectangle {
                implicitWidth: 80
                implicitHeight: 30
//                    border.width: 1
//                    border.color: "grey"
                Text {
                    font.pointSize: 12
                    text: display
                    anchors.centerIn: parent
                }
            }
        }
    }


}
