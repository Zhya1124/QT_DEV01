import QtQuick 2.0
//import ALPaintedItem 1.0
//import DrawLine 1.0

//可视化窗口
Rectangle {
    id: vFDview;

    //property alias painter: painter;

    //标签栏背景
    Image {
        id: vis_img01;

        anchors.top: vFDview.top;
        anchors.left: vFDview.left;

        width: 1283;
        height: 60;
        source: "../image/vis/logicBar@2x.png"
    }

    //标签栏文字
    Text{
        id: vis_text01;

        anchors.top: vFDview.top;
        anchors.topMargin: 15;
        anchors.left: vFDview.left;
        anchors.leftMargin: 27;

        color: "#ffffff";
        font.pointSize: 25;
        font.family: "simplex";
        text: "逻辑";
    }

    //可视化视图栏背景
    Image {
        id: vis_img02;

        anchors.top: vFDview.top;
        anchors.left: vFDview.left;

        width: 1283;
        height: 893;
        source: "../image/vis/visBar@2x.png"
    }

    //可视化显示框背景
    Image {
        id: vis_img03;

        anchors.top: vFDview.top;
        anchors.topMargin: 92;
        anchors.left: vFDview.left;
        anchors.leftMargin: 30;

        width: 1216;
        height: 709;
        source: "../image/vis/logicShow@2x.png"
    }

    ForceDirected2{
        id: vFDshow;

        anchors.top: vis_img03.top;
        anchors.left: vis_img03.left;

        width: 1216;
        height: 709;
    }

    /*Component.onCompleted: {
        painter.penWidth = initHeight/647.0*3;
        painter.penColor = "red";
        painter.init();
    }

    ALPaintedItem{
        id: painter;

        anchors.top: vis_img03.top;
        anchors.left: vis_img03.left;
        width: vis_img03.width;
        height: vis_img03.height;
        onWidthChanged: {
            painter.init();
        }
        onHeightChanged: {
            painter.init();
        }
    }*/
    /*DrawLine{
        id: line;
    }*/
}
