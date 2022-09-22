import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQml 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

ScrollView {

    id:view
    width: Screen.width*2.25/5
    height: Screen.height*1.1/3
    clip: true

    layer.enabled: true
    layer.effect: DropShadow{
         horizontalOffset: 3
         anchors.fill: view
         verticalOffset: 3
         radius: 8.0
         samples: 17
         color: "#80000000"
         source: view
    }

//    ScrollBar.vertical: ScrollBar {
//            parent: view
//            x: view.mirrored ? 0 : view.width - width
//            y: view.topPadding
//            height: view.availableHeight
//            active: view.ScrollBar.vertical.active
//        }
    background: Rectangle{
        border.color: "black"

    }

    ListView {
            model: 50
            delegate: ItemDelegate {
                text: "Item " + index
            }
        }

}
