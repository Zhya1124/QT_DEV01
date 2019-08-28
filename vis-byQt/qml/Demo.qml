import QtQuick 2.0

Rectangle {
    id: vDemo;

    //color: "transparent";
    //color: "black";

    Text {
        id: text00;

        /*x: 12;
        y: 12;
        width: 200;
        height: 200;*/

        //锚定位
        anchors.top: vDemo.top;//相对vDemo上边位置
        anchors.topMargin: 20;
        anchors.left: vDemo.left;
        anchors.leftMargin: 50;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.horizontalCenter;
        width: 50;
        height: 300;

        color: "black";
        font.pixelSize: 45;
        font.family: "微软雅黑";
        text: "textextextextextextextextext";

        wrapMode: Text.WordWrap;
        font.letterSpacing: 1.2;
        font.wordSpacing: 1.5;
        font.bold: true;
        horizontalAlignment: Text.AlignHCenter;//水平居中
        verticalAlignment: Text.AlignHCenter;//垂直居中

    }

    Image {
        id: vImage;
        x: 300;
        y: 300;
        width: 120;
        height: 120;
        fillMode: Image.PreserveAspectCrop;

        source: "../image/v2-43126f5d8305fcbfac32a88fd89eefc1_r.jpg";
    }

}
