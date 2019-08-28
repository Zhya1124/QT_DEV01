import QtQuick 2.0

//工具栏
Rectangle {
    id: vToolbar;

    width: 1920;
    height: 60;
    //标签栏背景
    Image {
        id: toolbar_background;

        anchors.top: vToolbar.top;
        anchors.left: vToolbar.left;

        width: 1920;
        height: 60;
        source: "../image/tool/工具栏@2x.png"
    }
}
