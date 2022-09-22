import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
Rectangle{
        id:rec1
        width: 220
        height: 220
        border.color: "black"
        color: "black"
//        gradient: Gradient {
//            GradientStop { position: 0.0; color: "black" }
//            GradientStop { position: 1.0; color: "blue" }
//        }

        Text {
            z:100
            id:text
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom:parent.bottom
            font.pointSize: 17
            color: "white"
            text: qsTr("滑油温度: ")+biao2.value.toFixed(1)+"℃"
        }
        Canvas{
            anchors.fill: rec1
            onPaint: {
                var ctx=getContext("2d")
                ctx.moveTo(rec1.width/2,rec1.height/2)
                ctx.arc(rec1.width/2,rec1.height/2,95,5*Math.PI/3-Math.PI/5,Math.PI/3)
                ctx.closePath()
                ctx.fillStyle= 'rgb(0,255,0)'
                ctx.stroke()
                ctx.fill()
           }
        }
        Canvas{
            anchors.fill: rec1
            onPaint: {
                var ctx=getContext("2d")
                ctx.moveTo(rec1.width/2,rec1.height/2)
                ctx.arc(rec1.width/2,rec1.height/2,95,3*Math.PI/2,5*Math.PI/3+Math.PI/5)
                ctx.closePath()
                ctx.fillStyle= 'rgb(255,255,0)'
                ctx.stroke()
                ctx.fill()
           }
        }
        Canvas{
            anchors.fill: rec1
            onPaint: {
                var ctx=getContext("2d")
                ctx.moveTo(rec1.width/2,rec1.height/2)
                ctx.arc(rec1.width/2,rec1.height/2,95,2*Math.PI/3,3*Math.PI/2)
                ctx.closePath()
                ctx.fillStyle= 'rgb(255,0,0)'
                ctx.stroke()
                ctx.fill()
           }
        }
        Canvas{
            anchors.fill: rec1
            onPaint: {
                var ctx=getContext("2d")
                ctx.moveTo(rec1.width/2,rec1.height/2)
                ctx.arc(rec1.width/2,rec1.height/2,95,Math.PI/5,Math.PI/3)
                ctx.closePath()
                ctx.fillStyle= 'rgb(255,255,0)'
                ctx.stroke()
                ctx.fill()
            }
        }

        Canvas{
            id:canvas
             anchors.fill: parent
             onPaint: {
                 var ctx=getContext("2d")
                 ctx.moveTo(rec1.width/2,rec1.height/2)
                 ctx.arc(rec1.width/2,rec1.height/2,95,Math.PI/3,2*Math.PI/3)
                 ctx.closePath()
                 ctx.fillStyle= 'rgb(0,0,0)'
                 ctx.stroke()
                 ctx.fill()
            }
            Rectangle{
                id:rec
                width:180
                height: 180
                radius: width
                anchors.centerIn: parent
                color: "black"
                CircularGauge {
                    id:biao2
                    maximumValue: 125
                    anchors.fill: parent
//                    property bool accelerating: false
//                    value: accelerating ? maximumValue : 0
//                    Keys.onSpacePressed: accelerating = true
//                    Keys.onReleased: {
//                        if (event.key === Qt.Key_Space) {
//                            accelerating = false;
//                            event.accepted = true;
//                        }
//                    }
//                    Component.onCompleted: forceActiveFocus()

//                    Behavior on value {
//                        NumberAnimation {
//                            duration: 1000
//                        }
//                    }
                    style: CircularGaugeStyle{

                        labelStepSize: 25
                        tickmarkStepSize: 25
                        tickmarkLabel:  Text {
                            font.pixelSize: 15
                            color: "white"
                            text: styleData.value
                            antialiasing: true
                        }
                    }
                }

            }
        }
}
