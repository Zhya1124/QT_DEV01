import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
/*
  修改了按钮的样式，使按钮可以根据普通、按下、悬停三种状态更换图片
  */
Button{
    id: button1;
    property url normalPic;
    property url hoverPic;
    property url pressedPic;
    //property var : value
    //text:qsTr("这是一个测试按钮");
    //iconSource:{ source:url_button}//指定按钮图标
    style: ButtonStyle{
        background: Rectangle{
            implicitWidth:50
            implicitHeight:50
            color: "transparent";
            //border.width:control.pressed?4:2
            BorderImage
                {
                   anchors.fill: parent;
                   source: control.hovered ? (control.pressed ? pressedPic : hoverPic) : normalPic;

                }
            }
        }
    }



