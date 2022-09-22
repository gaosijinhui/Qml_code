import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick 2.15


Rectangle {
    id:rec1
    width: height*3/2
    height: 340
    gradient: Gradient {
        GradientStop { position: 0.0; color: "black" }
        GradientStop { position: 1.0; color: "#0019FF" }
    }
    Rectangle{
        width: rec1.width/3
        height: rec1.height
//        x:rec1.x
//        y:rec1.y
        anchors.left: parent.left
        anchors.top: parent.top
        color: "white"
    }
    Text {
        id: tex
        x:rec1.width*2/3-tex.width/2
        anchors.top: rec1.top
        anchors.topMargin: 15
        font.pointSize: 15
        color: "white"
        text: (biao.value/biao1.value).toFixed(1)  //转速比
    }
    Text {
        id: tex1
        x:rec1.width*2/3-tex.width/2
        anchors.bottom: rec1.bottom
        anchors.bottomMargin: 15
        font.pointSize: 15
        color: "white"
        text: (biao.value/biao1.value).toFixed(1)  //油门位置
    }
    Text {
        x:rec1.width/3
        anchors.bottom: parent.bottom
        text: qsTr("发动机转速")
        color: "white"
        font.bold: true
        font.pointSize: 12
    }
    Text {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        text: qsTr("主旋翼转速")
        color: "white"
        font.bold: true
        font.pointSize: 12
    }

        CircularGauge {
            id: biao
            width: height
            height: rec1.height

//                anchors.fill: parent
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            maximumValue:7000

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

            style: CircularGaugeStyle {
                id: style
                labelStepSize: 1000
                tickmarkStepSize: 1000
                minimumValueAngle:145
                maximumValueAngle: 29
                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                background: Canvas {
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();

                        ctx.beginPath();
                        ctx.strokeStyle = 'rgb(255,255,0)';
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(5800) - 90), degreesToRadians(valueToAngle(6000) - 90),true);
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = 'rgb(255,255,0)';
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(5000) - 90), degreesToRadians(valueToAngle(5200) - 90),true);
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = 'rgb(0,255,0)';
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(5200) - 90), degreesToRadians(valueToAngle(5800) - 90),true);
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = "red";
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(5000) - 90),true);
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = "red";
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(6000) - 90), degreesToRadians(valueToAngle(7000) - 90),true);
                        ctx.stroke();
                    }
                }

                tickmark: Rectangle {
//                        visible: styleData.value < 120 || styleData.value % 10 == 0
                    implicitWidth: outerRadius * 0.02
                    antialiasing: true
                    implicitHeight: outerRadius * 0.1
                    color: styleData.value<5000||styleData.value>=6000 ? "red" : styleData.value>=5200&&styleData.value<=5800 ? "#00ff00" : "yellow"
//                        color: styleData.value >= 60 && styleData.value<=110 ? "#00ff00" : "yellow"
                }

                minorTickmark: Rectangle {
//                        visible: styleData.value < 120
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.08
                    color: styleData.value<=5000||styleData.value>=6000 ? "red" : styleData.value>=5200&&styleData.value<=5800 ? "#00ff00" : "yellow"
//                        color: styleData.value >= 60 && styleData.value<=110 ? "#00ff00" : "yellow"
                }

                tickmarkLabel:  Text {
                    font.pixelSize: Math.max(15, outerRadius * 0.1)
                    text: styleData.value
                    color: "white"
                    antialiasing: true
                }

                needle: Rectangle {
                    y: outerRadius * 0.1
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: "#e5e5e5"
                }

                foreground: Item {
                    Rectangle {
                        width: outerRadius * 0.7
                        height: width
                        radius: width / 2
                        color: "white"
                        anchors.centerIn: parent
                        Text {
                            font.pointSize: 15
                            anchors.centerIn: parent
                            text: biao.value.toFixed(1)+"\nRPM"
                        }
                    }
                }
            }
        }
        CircularGauge {
            id: biao1
            width: height
            height: rec1.height
//                anchors.fill: parent
            anchors.left: biao.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            maximumValue:700

//                property bool accelerating: false
//                value: accelerating ? maximumValue : minimumValue
//                Keys.onSpacePressed: accelerating = true
//                Keys.onReleased: {
//                    if (event.key === Qt.Key_Space) {
//                        accelerating = false;
//                        event.accepted = true;
//                    }
//                }
//                Component.onCompleted: forceActiveFocus()

//                Behavior on value {
//                    NumberAnimation {
//                        duration: 1000
//                    }
//                }

//            PropertyAnimation on value{
//                from: 0
//                to:700
//                duration: 7000
//            }

            style: CircularGaugeStyle {
                id: style2
                labelStepSize: 100
                tickmarkStepSize: 100
                minimumValueAngle:-145
                maximumValueAngle:-29
                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                background: Canvas {
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();

                        ctx.beginPath();
                        ctx.strokeStyle = 'rgb(255,255,0)';
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(580) - 90), degreesToRadians(valueToAngle(600) - 90));
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = 'rgb(255,255,0)';
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(500) - 90), degreesToRadians(valueToAngle(520) - 90));
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = 'rgb(0,255,0)';
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(520) - 90), degreesToRadians(valueToAngle(580) - 90));
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = "red";
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(600) - 90), degreesToRadians(valueToAngle(700) - 90));
                        ctx.stroke();

                        ctx.beginPath();
                        ctx.strokeStyle = "red";
                        ctx.lineWidth = 4;
                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(500) - 90));
                        ctx.stroke();
                    }
                }

                tickmark: Rectangle {
//                        visible: styleData.value < 120 || styleData.value % 10 == 0
                    implicitWidth: outerRadius * 0.02
                    antialiasing: true
                    implicitHeight: outerRadius * 0.1
                    color: styleData.value<500||styleData.value>=600 ? "red" : styleData.value>=520&&styleData.value<=580 ? "#00ff00" : "yellow"
//                        color: styleData.value >= 60 && styleData.value<=110 ? "#00ff00" : "yellow"
                }

                minorTickmark: Rectangle {
//                        visible: styleData.value < 120
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.08
                    color: styleData.value<=500||styleData.value>=600 ? "red" : styleData.value>=520&&styleData.value<=580 ? "#00ff00" : "yellow"
//                        color: styleData.value >= 60 && styleData.value<=110 ? "#00ff00" : "yellow"
                }

                tickmarkLabel:  Text {
                    font.pixelSize: Math.max(15, outerRadius * 0.1)
                    text: styleData.value
                    color: "white"
                    antialiasing: true
                }

                needle: Rectangle {
                    y: outerRadius * 0.1
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: "#e5e5e5"
                }

                foreground: Item {
                    Rectangle {
                        width: outerRadius * 0.7
                        height: width
                        radius: width / 2
                        color: "white"
                        anchors.centerIn: parent
                    }
                    Text {
                        font.pointSize: 15
                        anchors.centerIn: parent
                        text: biao1.value.toFixed(1)+"\nRPM"
                    }
                }
            }
        }

    }


