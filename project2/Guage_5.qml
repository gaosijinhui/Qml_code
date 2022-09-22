import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Rectangle{
    width: 220
    height: 220
    gradient: Gradient {
        GradientStop { position: 0.0; color: "black" }
//            GradientStop { position: 0.9; color: "blue" }
        GradientStop { position: 1.0; color: "#0019FF" }
    }

    Text {
        id:text
        z:100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        font.pointSize: 15
        color: "white"
        text: qsTr("歧管压力: ")+biao5.value.toFixed(1)+qsTr("in.Hg")
    }

    Rectangle{
        id:rec
        width:180
        height: 180
        anchors.centerIn: parent
        color: "transparent"
        CircularGauge {
            id:biao5
            minimumValue: 10
            maximumValue: 50
            anchors.fill: parent
//            property bool accelerating: false
//            value: accelerating ? maximumValue : minimumValue

//            Keys.onSpacePressed: accelerating = true
//            Keys.onReleased: {
//                if (event.key === Qt.Key_Space) {
//                    accelerating = false;
//                    event.accepted = true;
//                }
//            }
//            Component.onCompleted: forceActiveFocus()

//            Behavior on value {
//                NumberAnimation {
//                    duration: 1000
//                }
//            }
            style: CircularGaugeStyle{
                tickmarkLabel:  Text {
                    font.pixelSize: 15
                    color: "white"
                    text: styleData.value
                    antialiasing: true
                }

                needle: Rectangle {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: "#e5e5e5"
                }
//                foreground: Item {
//                    Rectangle {
//                        width: outerRadius * 0.2
//                        height: width
//                        radius: width / 2
//                        color: "#e5e5e5"
//                        anchors.centerIn: parent
//                    }
//                }

            }

        }
    }
}

