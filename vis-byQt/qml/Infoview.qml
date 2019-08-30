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
        width: 582;
        height: 893;

        source: "../image/info/imageInfo@2x.png"
    }

    //加载图片
    Rectangle
    {
        id:info_img02_border;
        color: "transparent";
        width: 456;
        height: 339;
        anchors.top: vInfoview.top;
        anchors.topMargin: 48;
        anchors.left: vInfoview.left;
        anchors.leftMargin: 65;
        //border.width: 2;//测试用
        //border.color: "black";
        clip: true;//可以对图片裁剪
        //图片加载指示器
        BusyIndicator
        {
            id:busy;
            running:false;
            anchors.centerIn: parent;
            z:2;
        }
        //用于显示图片读取失败的信息
        Text
        {
            id:stateLable;
            visible: true;
            anchors.left: parent.left;
            anchors.leftMargin: 5;
            anchors.top:parent.top;
            anchors.topMargin: 5;
            font.family: "微软雅黑";
            font.pixelSize: 24;
            text: "";
            color: "black";
            z:3;
        }
        Image {
            id: info_img02;
            //source: info_img;//这个要载入的图片的地址参数
            source: "../image/guixie.png";
            //source: "../image/tiffPic/chrome.bmp";//测试读bmp
            //source: "file:///D:/Picture/Clothes/978-7-5180-1663-1-100.tif";//本地读取tiff
            //source: "../image/tiffPic/978-7-5180-1663-1-65.tif";//相对路径读tiff***失败
            //使图片居中，注意这里要实现拖动的话就不能用锚定位。
            x:info_img02_border.width/2 - info_img02.width/2;
            y:info_img02_border.height/2 - info_img02.height/2;
            fillMode: Image.PreserveAspectFit;
            asynchronous: true;//因为可能需要加载大图片须开启异步模式
            smooth: true;


            onStatusChanged: {
                    if(info_img02.status === Image.Ready)
                    {
                        busy.running = false;
                    }
                    else if(info_img02.status === Image.Loading)
                    {
                        busy.running = true;
                    }
                    else if(info_img02.status === Image.Error)
                    {
                        busy.running = false;
                        stateLable.visible = true;
                        stateLable.text = "图片读取出错！";
                    }
            }
        }
        MouseArea//拖拽区域
        {
            id:info_img02_dragArea;
            anchors.fill: info_img02;
            drag.target: info_img02;
            drag.axis: Drag.XAndYAxis;//设置拖拽的方式
            drag.minimumX: (info_img02.width > info_img02_border.width)?(info_img02_border.width - info_img02.width):0;
            drag.maximumX: (info_img02.width > info_img02_border.width)?0:(info_img02_border.width - info_img02.width);
            drag.minimumY: (info_img02.height > info_img02_border.height)?(info_img02_border.height - info_img02.height):0;
            drag.maximumY: (info_img02.height > info_img02_border.height)?0:(info_img02_border.height - info_img02.height);
            //滚动也可以进行缩放
            onWheel:
            {
                var delta = wheel.angleDelta.y / 120;
                if(delta > 0)//放大
                {
                    if(info_img02.scale<1.6)
                    info_img02.scale = info_img02.scale/0.9;
                }
                else
                {
                    if(info_img02.scale>0.05)
                    info_img02.scale = info_img02.scale*0.9;
                }
            }
        }
    }
//    Button1{//测试按钮
//        id: testBtn;
//        normalPic: "../image/info/zoomIn-notselected@2x.png";
//        pressedPic: "../image/info/zoomIn@2x.png";
//        hoverPic: "../image/info/zoomIn-mouseon@2x.png";

//        width: 40;
//        height: 40;

//        anchors.bottom: info_img02_border.bottom;
//        anchors.bottomMargin: 5;
//        anchors.left: info_img02_border.left;
//        anchors.leftMargin: 5;
//        onClicked: {
//            console.log("显示");//*************************************************************************************************
//            stateLable.text = "宽度："+info_img02.width+"高度："+info_img02.height+"最小x："+info_img02_dragArea.drag.minimumX+"最大x："+info_img02_dragArea.drag.maximumX+"最小y："+info_img02_dragArea.drag.minimumY+"最大y："+info_img02_dragArea.drag.maximumY;
//        }
//    }
    Button1{
        id: infoBtn1;
        normalPic: "../image/info/zoomIn-notselected@2x.png";
        pressedPic: "../image/info/zoomIn@2x.png";
        hoverPic: "../image/info/zoomIn-mouseon@2x.png";

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
        normalPic: "../image/info/zoomOut-notselected@2x.png";
        pressedPic: "../image/info/zoomOut@2x.png";
        hoverPic: "../image/info/zoomOut-mouseon@2x.png";
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
        source: "../image/info/attributes@2x.png"
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
        source:  "../image/info/dropBtn@2x.png";
    }
    Image {
        id: info_img05;

        width: 456;
        height: 359;
        anchors.top: info_img03.bottom;
        anchors.left: vInfoview.left;
        anchors.leftMargin: 65;
        source: "../image/info/attributesShow@2x.png"
    }
}
