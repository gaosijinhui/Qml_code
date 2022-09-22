import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick 2.15

Rectangle {
    width: 220
    height: 220

    property real biao6_value: biao.value

    gradient: Gradient {
        GradientStop { position: 0.0; color: "black" }
        GradientStop { position: 1.0; color: "#0019FF" }
    }
        Text {
            id:text
            z:100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:parent.bottom
            font.pointSize: 15
            color: "white"
            text: qsTr("剩余油量: ")+biao.value.toFixed(1)+qsTr(" L")
        }
        Rectangle{
            width: 180
            height: 180
            anchors.centerIn: parent
            color: "transparent"

            CircularGauge {
                id: biao
                anchors.fill: parent
                anchors.centerIn: parent
                maximumValue:55

                property bool accelerating: false
                value: accelerating ? maximumValue : -40
                Keys.onSpacePressed: accelerating = true
                Keys.onReleased: {
                    if (event.key === Qt.Key_Space) {
                        accelerating = false;
                        event.accepted = true;
                    }
                }
                Component.onCompleted: forceActiveFocus()

                Behavior on value {
                    NumberAnimation {
                        duration: 1000
                    }
                }

                style: CircularGaugeStyle {
                    id: style
                    labelStepSize: 5
                    tickmarkStepSize: 5
                    function degreesToRadians(degrees) {
                        return degrees * (Math.PI / 180);
                    }

                    background: Canvas {
                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.reset();

                            ctx.beginPath();
                            ctx.strokeStyle = "#00ff00";
                            ctx.lineWidth = 4;

                            ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                                degreesToRadians(valueToAngle(15) - 90), degreesToRadians(valueToAngle(55) - 90));
                            ctx.stroke();

                            ctx.beginPath();
                            ctx.strokeStyle = "yellow";
                            ctx.lineWidth = 4;

                            ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                                degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(15) - 90));
                            ctx.stroke();
                        }
                    }

                    tickmark: Rectangle {
//                        visible: styleData.value < 80 || styleData.value % 10 == 0
                        implicitWidth: outerRadius * 0.02
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color: styleData.value >= 15 ? "#00ff00" : "yellow"
                    }

                    minorTickmark: Rectangle {
//                        visible: styleData.value < 80
                        implicitWidth: outerRadius * 0.01
                        antialiasing: true
                        implicitHeight: outerRadius * 0.08
                        color: styleData.value >= 15 ? "#00ff00" : "yellow"
                    }

                    tickmarkLabel:  Text {
                        font.pixelSize: Math.max(15, outerRadius * 0.1)
                        text: styleData.value
                        color: "white"
                        font.bold: true
                        antialiasing: true
                    }

                    needle: Rectangle {
                        y: outerRadius * 0.15
                        implicitWidth: outerRadius * 0.03
                        implicitHeight: outerRadius * 0.9
                        antialiasing: true
                        color: "#e5e5e5"
                    }

                    foreground: Item {
                        Rectangle {
                            width: outerRadius * 0.2
                            height: width
                            radius: width / 2
                            color: "#e5e5e5"
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
}




