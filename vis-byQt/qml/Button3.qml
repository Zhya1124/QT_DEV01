import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


/*
    8/22添加下拉列表中的按钮 -L

    8/27添加了按钮背景变化

*/

Rectangle{
    id: button3;

    property string text_button3;
    property url url_button;

    property int icon_topMargin;
    property int icon_width;
    property int icon_height;

    property var hover_bg:"../image/tool/rect 11@2x.png";
    property var pressed_bg:"../image/tool/rect 11@2x.png";
    property var normal_bg:"../image/tool/rec-2@2x.png";

    signal btn3_clicked;//点击信号

    height: 52;
    width: 220;
    Image
    {
        id:vbutton_bg
        anchors.fill:parent

        state: "normal";


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


        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MidButton;
        hoverEnabled: true;

        onClicked: {
            btn3_clicked();
        }

        onPressed:
        {


            vbutton_bg.state = "pressed";
        }

        onReleased:
        {
            vbutton_bg.state = "normal";
        }

        onEntered:
        {
            if(vbutton_bg.state === "normal")
            {
               vbutton_bg.state = "hover";
            }

            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }

        onExited:
        {
            if(vbutton_bg.state === "hover")
            {
                vbutton_bg.state = "normal";
            }

            /* state === "hover" ? state = "normal" : state = "pressed"; */
        }

        onWheel:
        {

        }
    }

    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: vbutton_bg;
                source: normal_bg;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: vbutton_bg;
                source: pressed_bg;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: vbutton_bg;
                source: hover_bg;
            }
        }
    ]
}
}

