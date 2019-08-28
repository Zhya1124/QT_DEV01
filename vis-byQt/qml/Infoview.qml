import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//信息窗口
Rectangle {
    id: vInfoview;

    property string info_name;
    property url info_img;

    width: 582;
    //背景
    Image {
        id: info_img01;

        anchors.top: vInfoview.top;
        anchors.left: vInfoview.left;
        //z:-2;
        width: 582;
        height: 893;

        source: "../image/info/图像信息栏@2x.png"
    }

    //加载图片
    Rectangle
    {
        id:info_img02_border;
        color: "transparent";
        //z:-1;
        width: 456;
        height: 339;//建议宽度小一些
        anchors.top: vInfoview.top;
        anchors.topMargin: 48;
        anchors.left: vInfoview.left;
        anchors.leftMargin: 65;
        Image {
            id: info_img02;

//            width: 456;
//            height: 339;//建议宽度小一些
//            anchors.top: vInfoview.top;
//            anchors.topMargin: 48;
//            anchors.left: vInfoview.left;
//            anchors.leftMargin: 65;
            //source: info_img;
            source: "../image/guixie.png";
            x:100;
            y:100;
            fillMode: Image.PreserveAspectCrop;
            clip: true;
            smooth: true;
            MouseArea
            {
                anchors.fill: info_img02;
                drag.target: info_img02;
                drag.axis: Drag.XAndYAxis;//设置拖拽的方式
                drag.minimumX: 0;
                drag.maximumX: info_img02.width;
                drag.minimumY: 0;
                drag.maximumY: info_img02.height;
            }
        }
    }

    Button1{
        id: infoBtn1;
        normalPic: "../image/info/放大icon-未选中@2x.png";
        pressedPic: "../image/info/放大icon@2x.png";
        hoverPic: "../image/info/放大icon-移至icon@2x.png";

        width: 28;
        height: 28;

        anchors.top: info_img02_border.top;
        anchors.topMargin: 15;
        anchors.left: info_img02_border.left;
        anchors.leftMargin: 353;
        onClicked: {
            console.log("放大")//*************************************************************************************************
            if(info_img02.scale<1.6)
            info_img02.scale += 0.05;
        }

    }
    Button1{
        id: infoBtn2;
        normalPic: "../image/info/缩小icon-未选中@2x.png";
        pressedPic: "../image/info/缩小icon@2x.png";
        hoverPic: "../image/info/缩小icon-移至icon@2x.png";
        width: 28;
        height: 28;

        anchors.top: info_img02_border.top;
        anchors.topMargin: 15;
        anchors.left: infoBtn1.right;
        anchors.leftMargin: 18;
        onClicked: {
            console.log("缩小")//*************************************************************************************************
            if(info_img02.scale>0.05)
            info_img02.scale -= 0.05;
        }
    }

    //图片名称
    Text{
        id: info_text01;

        anchors.top: info_img02_border.bottom;
        anchors.topMargin: 16;
        anchors.horizontalCenter: vInfoview.horizontalCenter;

        color: "#ffffff";
        font.pointSize: 25;
        font.family: "simplex";
        text: info_name;
        //text: "图片名称";
    }

    //属性栏
    Image {
        id: info_img03;

        width: 456;
        height: 60;
        anchors.top: info_text01.bottom;
        anchors.topMargin: 13;
        anchors.left: vInfoview.left;
        anchors.leftMargin: 65;
        source: "../image/info/属性@2x.png"
    }
    Text {
        id: info_text02;

        anchors.top: info_img03.top;
        anchors.topMargin: 13;
        anchors.left: info_img03.left;
        anchors.leftMargin: 17;

        color: "#ffffff";
        font.pointSize: 25;
        font.family: "simplex";
        text: "属性";
    }
    Image {
        id: info_img04;

        width: 16;
        height: 11;
        anchors.top: info_img03.top;
        anchors.topMargin: 26;
        anchors.left: info_text02.right;
        anchors.leftMargin: 11;
        source:  "../image/info/下拉按钮@2x.png";
    }
    Image {
        id: info_img05;

        width: 456;
        height: 359;
        anchors.top: info_img03.bottom;
        anchors.left: vInfoview.left;
        anchors.leftMargin: 65;
        source: "../image/info/属性显示框@2x.png"
    }
}
