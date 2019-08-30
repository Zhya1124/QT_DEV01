import QtQuick 2.0

//标题栏


/*
   8/22 添加了点击标题栏可以隐藏下拉工具栏的功能，添加了onclicked函数  -L
*/

Rectangle {
    id: mainTitle;

    property int mainWindowX //用来存储主窗口x坐标
    property int mainWindowY //存储窗口y坐标
    property int xMouse //存储鼠标x坐标
    property int yMouse //存储鼠标y坐标

    Image {
        id: titleImg;

        anchors.top: mainTitle.top;
        anchors.left: mainTitle.left;

        fillMode: Image.TileHorizontally;
        source: "../image/maintitle@2x.png";
    }

    Text {
        id: titleText;

        anchors.top: mainTitle.top;
        anchors.topMargin: 23;
        anchors.left: mainTitle.left;
        anchors.leftMargin: 45;

        color: "#ffffff";
        font.pointSize: 30;
        font.family: "simplex";
        text: "可视化";
    }

    MouseArea { //为窗口添加鼠标事件
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton; //只处理鼠标左键
        property point clickPos: "0,0";
        onPressed: { //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: { //鼠标按下后改变位置
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            mainWindow.setX(mainWindow.x+delta.x)
            mainWindow.setY(mainWindow.y+delta.y)

        }
        onClicked:
        {
            rec_file.visible = false;
            rec_help.visible = false;
            menuAllMouseArea.visible = false;
        }

    }

}
