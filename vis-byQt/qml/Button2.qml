import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: button2;

    property string text_button2;
    property url url_button2;
    property int icon_width;
    property int icon_height;
    property int btn_area;
    signal btn2_clicked;//点击信号

    height: 60;
    width: btn_area;
    color: "transparent";

    Text {
        id: button2_text;

        anchors.top: button2.top;
        anchors.topMargin: 13;
        anchors.left: button2.left;

        color: "#ffffff";
        font.pointSize: 25;
        font.family: "simplex";
        text: text_button2;
    }

    Image {
        id: button2_img;

        width: icon_width;
        height: icon_height;

        anchors.top: button2.top;
        anchors.topMargin: 20;
        anchors.left: button2_text.right;
        anchors.leftMargin: 10;
        source: url_button2;
    }

    MouseArea{
        id: button2_ma;

        anchors.fill: parent;

        onClicked: {
            btn2_clicked();
        }
    }
}
