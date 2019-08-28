import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: cirImg;

    property url cuted_img;
    property int img_width;
    property int img_height;
    property int arcWidth;
    property color arcColor;
    property color arcBackgroundColor;
    property real  progress: 0;

    //anchors.centerIn: parent;
    color: "transparent";
    width: img_width;
    height: img_height;
    radius: width/2;

    Image{
        id: cir_Img;
        smooth: true;
        visible: false;
        anchors.fill: parent;
        source: cuted_img;
        sourceSize: Qt.size(parent.size, parent.size)
        antialiasing: true
    }

    Rectangle {
        id: cir_mask
        color: "black"
        anchors.fill: parent
        radius: width/2
        visible: false
        antialiasing: true
        smooth: true
    }

    OpacityMask {
        id: mask_image
        anchors.fill: cir_Img
        source:cir_Img
        maskSource: cir_mask
        visible: true
        antialiasing: true
    }

    Canvas{
        id: canvas
        anchors.centerIn: mask_image
        width: 2*img_width + arcWidth
        height: 2*img_height + arcWidth
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
