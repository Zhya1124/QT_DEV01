import QtQuick              2.7
import QtQuick.Controls     2.0
import QtQuick.Layouts      1.3
import QtGraphicalEffects   1.0

import QuickQanava          2.0 as Qan
import "qrc:/QuickQanava"   as Qan

Qan.NodeItem {
    id: cirVisNodeItem

    property int img_width;
    property int img_height;
    property int radius;
    property real progress: 300
    property color arcColor: "#50616d"
    property color arcBackgroundColor: "#50616d"
    property int arcWidth: 2
    Layout.preferredWidth: 100
    Layout.preferredHeight: 100
    width: Layout.preferredWidth
    height: Layout.preferredHeight

    img_width: 100
    img_height: 100

    Image {
        id: image
        //z: 1
        visible: false
        anchors.fill: parent
        smooth: true
        source: cirVisNodeItem.node.image
        antialiasing: true
        /*onSourceSizeChanged: {
            if ( sourceSize.width > 0 &&
                 sourceSize.height > 0 ) {
                cirVisNodeItem.ratio = sourceSize.width / sourceSize.height;
                // FIXME: generate a clean initial size here
            } else
                cirVisNodeItem.ratio = -1.;
        }*/
    }
    Rectangle {
        //z:3
        id: cir_mask
        color: "black"
        anchors.fill: parent
        radius: width/2
        visible: false
        antialiasing: true
        smooth: true
    }
    OpacityMask {
        //z:3
        id: mask_image
        anchors.fill: image
        source: image
        maskSource: cir_mask
        visible: true
        antialiasing: true
    }
    Canvas{
        //z:3
        id: canvas
        anchors.centerIn: mask_image
        width: img_width + arcWidth
        height: img_height + arcWidth
        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0,0,canvas.width,canvas.height)
            ctx.beginPath()
            ctx.strokeStyle = arcBackgroundColor
            ctx.lineWidth = arcWidth
            ctx.arc(canvas.width/2,canvas.height/2,img_width/2,0,Math.PI*2,false)
            ctx.stroke()

            var r = progress*Math.PI/180
            ctx.beginPath()
            ctx.strokeStyle = arcColor
            ctx.lineWidth = arcWidth

            ctx.arc(canvas.width/2,canvas.height/2,img_width/2,0-90*Math.PI/180,r-90*Math.PI/180,false)
            ctx.stroke()
        }
    }
}
