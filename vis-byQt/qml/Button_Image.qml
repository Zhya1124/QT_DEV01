import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
/*
  测试用的状态按钮
*/
Button
{
    id: vButton_Image;

    //------------------------------------------------------------//

    property url url_PressedImage:"";
    property url url_NormalImage:"";
    property url url_HoverImage:"";
    property var nIndex: 0;
    //property var zoomTag: 0;//0缩小，1放大

   // signal back(var nIndex);
    signal back();

    //------------------------------------------------------------//
    style: ButtonStyle{
        background: Rectangle{
            implicitWidth:0
            implicitHeight:0
            color: "transparent";
        }
    }
    //button image
    Image
    {
        id: vButtonImage;
        anchors.fill: parent;
        source: url_NormalImage;
    }
//    iconSource:
//    {
//        id: vIcon;
//        source:url_NormalImage;
//    }

    //------------------------------------------------------------//

//    //button text
//    Text
//    {
//        id: vButtonText;

//        x: 0;
//        y: 0;
//        width: parent.width;
//        height: parent.height;
//        horizontalAlignment: Text.AlignHCenter;
//        verticalAlignment: Text.AlignVCenter;
//        wrapMode: Text.WordWrap;
//        color: "#000000";/*color: "black";*/
//        font.family: "微软雅黑";
//        font.pixelSize: nTextSize;
//        font.letterSpacing: 1;
//        font.bold: true;
//        text: sTextText;

//    }

    //------------------------------------------------------------//

    //button mousearea
    MouseArea
    {
        id: vButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MidButton;
        hoverEnabled: true;
        onPressed:
        {
            vButton_Image.state = "pressed";
        }
        onReleased:
        {
            back(nIndex);
        }

        onEntered:
        {
            if(vButton_Image.state === "normal")
            {
                vButton_Image.state = "hover";
            }
        }
        onExited:
        {
            if(vButton_Image.state === "hover")
            {
                vButton_Image.state = "normal";
            }
        }
        onWheel:
        {

        }
//        onClicked:
//        {
//            if(zoomTag==1)
//            {
//                info_img02.scale += 0.05;
//            }
//            if(zoomTag==0)
//            {
//                if(info_img02.scale>0.05)
//                info_img02.scale -= 0.05;
//            }
//        }
    }

    //------------------------------------------------------------//

    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: vButtonImage;
                source: url_PressedImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: vButtonImage;
                source: url_NormalImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: vButtonImage;
                source: url_HoverImage;
            }
        }
    ]
}
