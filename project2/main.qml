import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQml 2.15
import Qt.labs.qmlmodels 1.0
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import Myobj 1.0

ApplicationWindow {
    id:win
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    title: qsTr("Hello World")

        property real pwm1_value
        property real pwm2_value
        property real pwm3_value
        property real pwm4_value

//    signal qmlsig(int i)


//    function qmlslot(i){
////        guage1.biao1_value=i
//        pwm1_value=i
//        console.log(i)
//        qmlsig(i)
////        PropertyAnimation on guage1.biao1_value{
////            to:i
////        }
//    }
//    Component.onCompleted: {
//        qmlsig.connect(guage1.slots)
//    }

//从上往下数即rec2为第二行的第一个
    Rectangle{
        id:rec1
        x:30
        anchors.top: menu.bottom
        anchors.topMargin: 20
        width: 120
        height: 30
        color:"green"
        Text {
            id:text1
            text: "充电正常"
            font.bold: true
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id:rec2
        x:30
        anchors.top: rec1.bottom
        anchors.topMargin: 10
        width: 120
        height: 30
        color: "#6CACAD"
    }
    Rectangle{
        id:rec3
        y:rec1.y
        anchors.left: rec1.right
        anchors.leftMargin: 10
        width: 120
        height: 30
        color:/*guage6.biao6_value>=15? "green":*/"red"
        Text {
            text: /*guage6.biao6_value>=15? "油量正常":*/"低油量"
            font.bold: true
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id:rec4
        y:rec2.y
        anchors.left: rec2.right
        anchors.leftMargin: 10
        width: 120
        height: 30
        color: "green"
    }
    Rectangle{
        id:rec5
        y:rec1.y
        anchors.left: rec3.right
        anchors.leftMargin: 10
        width: 120
        height: 30
        color: "green"
    }
    Rectangle{
        id:rec6
        y:rec2.y
        anchors.left: rec4.right
        anchors.leftMargin: 10
        width: 120
        height: 30
        color: "green"
    }
    Rectangle{
        id:rec7
        y:rec1.y
        anchors.left: rec5.right
        anchors.leftMargin: 10
        width: 120
        height: 30
        color: "green"
    }
    Rectangle{
        id:rec8
        y:rec2.y
        anchors.left: rec6.right
        anchors.leftMargin: 10
        width: 120
        height: 30
        color: "green"
    }

    Label{
        id:lab1
        y:rec1.y
        anchors.left: rec8.right
        anchors.leftMargin: 20
        text: "PWM1: "
        font.bold: true
        font.pointSize: 15
    }
    Label{
        id:lab2
        y:rec1.y
        anchors.left: lab1.right
        anchors.leftMargin: 100
        text: "PWM2: "
        font.bold: true
        font.pointSize: 15
    }
    Label{
        id:lab3
        x:lab1.x
        anchors.top: lab1.bottom
        anchors.topMargin: 20
        text: "PWM3: "
        font.bold: true
        font.pointSize: 15
    }
    Label{
        id:lab4
        y:lab3.y
        anchors.left: lab3.right
        anchors.leftMargin: 100
        text: "PWM4: "
        font.bold: true
        font.pointSize: 15
    }

//四个PWM显示，显示的值即为定义的pwm_value
    Label{
        id:lab11
        y:lab1.y
        anchors.left: lab1.right
        text: pwm1_value
        font.bold: true
        font.pointSize: 15
    }
    Label{
        id:lab22
        y:lab2.y
        anchors.left: lab2.right
        text: pwm2_value
        font.bold: true
        font.pointSize: 15
    }
    Label{
        id:lab33
        y:lab3.y
        anchors.left: lab3.right
        text: pwm3_value
        font.bold: true
        font.pointSize: 15
    }
    Label{
        id:lab44
        y:lab3.y
        anchors.left: lab4.right
        text: pwm4_value
        font.bold: true
        font.pointSize: 15
    }


//菜单栏（暂时无功能）
    menuBar:MenuBar {
        id:menu
        Menu {
            title: qsTr("File")

            font.pointSize: 10
            Action { text: qsTr("New...") }
            Action { text: qsTr("Open...") }
            Action { text: qsTr("Save") }
            Action { text: qsTr("Save As...") }
            MenuSeparator { }
            Action { text: qsTr("Quit")
                onTriggered: close()
            }

        }

        Menu {
            title: qsTr("Edit")
            Action { text: qsTr("Cut") }
            Action { text: qsTr("Copy") }
            Action { text: qsTr("Paste") }
        }
        Menu {
            title: qsTr("Help")
            Action {
                text: qsTr("About")
//                onTriggered:{
//                    Myobject.fun()
//                }
            }
        }
//        delegate: MenuBarItem{
//            id:menubaritem
//            contentItem:Text{
//                text: menubaritem.text
//                font: menubaritem.font
//                horizontalAlignment: Text.AlignLeft
//                verticalAlignment: Text.AlignVCenter

//            }
//        }
    }


    TextArea{
        id:texarea
        width: myview.width
        anchors.top: menu.bottom
        anchors.right: parent.right
        anchors.rightMargin: 20
        text: "序号      时间         发动机转速  主旋翼转速  剩余油量  器官压力  电源1电压  冷却液温度  主减温度  滑油压力  滑油温度  空气温度   "
        font.bold: true
        font.pixelSize: 12
    }

    Myview{
        id:myview
//        anchors.fill: parent
        anchors.top: texarea.bottom
        anchors.right: parent.right
        anchors.rightMargin: 30
    }

    Label{
        id:lab
        x:myview.x
        anchors.top: myview.bottom
        anchors.topMargin: 15
        font.bold: true
        font.pixelSize: 13
        text: "TCU警告信息"
    }

    TextArea{
        id:massage
        width: myview.width
        height: Screen.height*0.6/3
        anchors.top: lab.bottom
        anchors.right: parent.right
        anchors.rightMargin: 30
        background: Rectangle{
            border.color: "black"
        }
    }


    Mytable{
        x:massage.x
        y:column1.y
    }

    ColumnLayout{
        id:column1
        anchors.right: column2.left
        anchors.rightMargin: 5
        y:column2.y
        spacing: 30
        layoutDirection: Qt.RightToLeft
        Label{
            font.bold: true
            font.pointSize: 10
            text: "转速:"
        }
        Label{
            font.bold: true
            font.pointSize: 10
            text: "环境气压:"
        }
        Label{
            font.bold: true
            font.pointSize: 10
            text: "设定点空气盒压力:"
        }
        Label{
            font.bold: true
            font.pointSize: 10
            text: "空气盒温度:"
        }
    }

    Column{
        id:column2
        anchors.top: massage.bottom
        anchors.topMargin: 50
        anchors.right: column3.left
        anchors.rightMargin: 20
        spacing: 25
        TextField{
            width: 80
            height: 20
            readOnly: true
        }
        TextField{
            width: 80
            height: 20
            readOnly: true
        }
        TextField{
            width: 80
            height: 20
            readOnly: true
        }
        TextField{
            width: 80
            height: 20
            readOnly: true
        }

    }

    ColumnLayout{
        id:column3
        anchors.right: column4.left
        anchors.rightMargin: 5
        y:column4.y
        spacing: 30
        layoutDirection: Qt.RightToLeft
        Label{
            font.bold: true
            font.pointSize: 10
            text: "油门位置:"
        }
        Label{
            font.bold: true
            font.pointSize: 10
            text: "空气盒压力:"
        }
        Label{
            font.bold: true
            font.pointSize: 10
            text: "伺服电机位置:"
        }
        Label{
            font.bold: true
            font.pointSize: 10
            text: "保留位:"
        }
    }

    Column{
        id:column4
        anchors.top: massage.bottom
        anchors.topMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 20
        spacing: 25
        TextField{
            width: 80
            height: 20
            readOnly: true
        }
        TextField{
            width: 80
            height: 20
            readOnly: true
        }
        TextField{
            width: 80
            height: 20
            readOnly: true
        }
        TextField{
            width: 80
            height: 20
            readOnly: true
        }

    }

//表盘
    Grid{
        id:grid
        topPadding: 120
        leftPadding: 40
        columns: 4
        spacing: 15
        Guage_1{   id:guage1     }
        Guage_2{   id:guage2     }
        Guage_3{   id:guage3     }
        Guage_4{   id:guage4     }

    }
    Column{
        id:grid1
        leftPadding: 40
        anchors.top: grid.bottom
        anchors.topMargin: 15
        spacing: 15
        Guage_5{  id:guage5      }    //歧管压力表
        Guage_7{  id:guage7      }    //电源表1
//        Guage_8{  id:guage8      }   //电源表2
    }
    Column{
        y:grid1.y
        leftPadding: 745
        spacing: 15
        Guage_9{  id:guage9      }    //滑油压力表
        Guage_6{  id:guage6      }    //剩余油量表
    }

//双针转速表
    Guage_11{
        id:guage11
        z:grid1.z-1
        x:360+50-220-15-15
        y:grid1.y+50-15
//        anchors.left: grid1.right
//        anchors.leftMargin: 15
//        x:grid1.x+690-117.5
//        anchors.top: grid.bottom
//        anchors.topMargin: 235
    }


//端口列表
    Label{
        id:duankou
        anchors.top: grid1.bottom
        anchors.topMargin: 35
        leftPadding: 130
        font.bold: true
        font.pointSize: 10
        text: "端口:  "
    }

    ComboBox{
        id:combobox1
        width: 100
        height: 30
        anchors.left:duankou.right
        anchors.top: grid1.bottom
        anchors.topMargin: 30
//        y:duankou.y
    }

    ComboBox{
        id:combobox2
        width: 100
        height: 30
        anchors.left: combobox1.right
        anchors.leftMargin: 20
        y:combobox1.y
    }

//波特率列表
    Label{
        anchors.right: combobox3.left
        y:combobox3.y+10
        font.bold: true
        font.pointSize: 10
        text: "波特率:  "
    }

    ComboBox{
        id:combobox3
        width: 100
        height: 30
        x:combobox1.x
        anchors.top: combobox1.bottom
        anchors.topMargin: 20

    }

    ComboBox{
        id:combobox4
        width: 100
        height: 30
        x:combobox2.x
        anchors.top: combobox2.bottom
        anchors.topMargin: 20
    }


//三个端口button，当点击关闭按钮使刷新按钮不可用，打开与关闭按钮有排他性
    Button{
        id:but1
        width: 100
        height: 30
        anchors.left: combobox2.right
        anchors.leftMargin: 70
        y:combobox2.y
        font.bold: true
        text: "刷新端口列表"
        layer.enabled: true
        layer.effect: DropShadow{
             horizontalOffset: 3
             anchors.fill: but1
             verticalOffset: 3
             radius: 8.0
             samples: 17
             color: "#60000000"
             source: but1
        }
    }

    Button{
        id:but2
        width: 100
        height: 30
        anchors.left: but1.right
        anchors.leftMargin: 40
        y:but1.y
        font.bold: true
        text: "打开端口"
        checkable: true
        autoExclusive: true
        layer.enabled: checked? false:true
        layer.effect: DropShadow{
             horizontalOffset: 3
             anchors.fill: but2
             verticalOffset: 3
             radius: 8.0
             samples: 17
             color: "#60000000"
             source: but2
        }
        background: Rectangle {
                anchors.fill: but2
//                 opacity: enabled ? 1 : 0.3
                 color: but2.down ? "#d0d0d0" : "#e0e0e0"
        }
        onClicked: {
            but1.enabled=true
//            qmlsig(23,"gahsh")   //qml信号发送
//            Myobject.fun()   //调用函数使信号发送
        }
    }


    Button{
        id:but3
        width: 100
        height: 30
        anchors.top: but2.bottom
        anchors.topMargin: 20
        x:but2.x
        font.bold: true
        text: "关闭端口"
        checkable: true
        autoExclusive: true
        layer.enabled: checked? false:true
        layer.effect: DropShadow{
             horizontalOffset: 3
             anchors.fill: but3
             verticalOffset: 3
             radius: 8.0
             samples: 17
             color: "#60000000"
             source: but3
        }
        background: Rectangle {
                anchors.fill: but3
//                 opacity: enabled ? 1 : 0.3
                 color: but3.down ? "#d0d0d0" : "#e0e0e0"
        }
        onClicked: {
            but1.enabled=false
        }
    }


////风扇开关，value值或position显示滑动的位置
//    Label{
//        id:wind
//        anchors.left: but3.right
//        anchors.leftMargin: 70
//        y:but2.y+30
//        font.bold: true
//        font.pointSize: 10
//        text: "风扇"
//    }

//    Slider{
//        id:control
//        anchors.left: wind.right
//        anchors.leftMargin: 20
//        y:wind.y-height/3
//        background: Rectangle {
//                x: control.leftPadding
//                y: control.topPadding + control.availableHeight / 2 - height / 2
//                implicitWidth: 200
//                implicitHeight: 4
//                width: control.availableWidth
//                height: implicitHeight
//                radius: 2
//                color: "#bdbebf"

//                Rectangle {
//                    width: control.visualPosition * parent.width
//                    height: parent.height
//                    color: "#3282F6"
//                    radius: 2
//                }
//            }
//        handle: Rectangle{
//            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
//                     y: control.topPadding + control.availableHeight / 2 - height / 2
//                     implicitWidth: 10
//                     implicitHeight: 20

//                     color: control.pressed ? "#0023f5" : "#3282F6"
//        }
//    }

}

