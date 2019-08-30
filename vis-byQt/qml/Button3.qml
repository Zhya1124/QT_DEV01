import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


/*
    下拉列表中的按钮 8/22添加 -L
*/

Rectangle{
    id: button3;

    property string text_button3;
    property url url_button;

    property int icon_topMargin;
    property int icon_width;
    property int icon_height;
    signal btn3_clicked;//点击信号

    height: 52;
    width: 220;
    Image
    {
        id:vbutton_bg
        anchors.fill:parent
        width:220
        height:52
        source:"../image/tool/rect 11@2x.png";

    Text
    {
        id: button3_text;
        anchors.top: parent.top;
        anchors.topMargin: 13;
        anchors.left: parent.left;
        anchors.leftMargin: 19;
        color: "#ffffff";
        font.pointSize: 20;
        font.family: "simplex";
        text: text_button3;
    }

    Image{
        id: button3_img;

        width: icon_width;
        height: icon_height;

        anchors.top: parent.top;
        anchors.topMargin: icon_topMargin;

        anchors.left: button3_text.right;
        anchors.leftMargin: 10;

        source: url_button;
    }

    MouseArea
    {
        id: button3_ma;

        anchors.fill: parent;

        onClicked: {
            btn3_clicked();
        }
    }
    }
}
