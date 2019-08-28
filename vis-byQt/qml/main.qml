import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
/*
    8/22添加了工具栏下拉列表（两个colume，rec_file,rec_help），添加了隐藏下拉列表的mousearea（menuAllMouseArea） -L
        添加了弹出框，实现软件信息和功能介绍（两个Dialog_info）-L

    8/23添加了点击编辑后的输入对话框(一个Dialog_info),增加了数据导入的窗口（一个FileDialog）

    8/24连接了C++中的读取json的函数（数据导入部分）

*/
Window {
    id: mainWindow;
    visible: true
    color:"white";
    width: 1920;
    height: 1080;

    //标题栏
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowCloseButtonHint;   //去标题栏
    MainTitle{
        id: maintitle01;

        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;
        height: 86;

        Button1{
            id: titleButton1;//关闭窗口按钮
            normalPic: "../image/icon/关闭-未选中@2x.png";
            hoverPic:"../image/icon/关闭移至icon@2x";
            pressedPic:"../image/icon/关闭-点击@2x.png";
            width: 24;
            height: 24;

            anchors.top: maintitle01.top;
            anchors.topMargin: 36;
            anchors.right: maintitle01.right;
            anchors.rightMargin: 48;

            onClicked: {
                Qt.quit();
            }
        }

        Button1{
            id: titleButton2;//还原窗口按钮
            normalPic: "../image/icon/最大化-还原icon-未选中@2x.png";
            hoverPic:"../image/icon/最大化-还原icon移至icon@2x.png";
            pressedPic:"../image/icon/最大化-还原icon-点击@2x.png";
            width: 32;
            height: 34;

            anchors.top: maintitle01.top;
            anchors.topMargin: 28;
            anchors.right: maintitle01.right;
            anchors.rightMargin: 120;

            onClicked: {
                mainWindow.visibility == Window.FullScreen?mainWindow.visibility = Window.Windowed:mainWindow.visibility = Window.FullScreen;
                //mainWindow.visibility = Window.FullScreen;
            }
        }

        Button1{
            id: titleButton3;//最小化窗口按钮
            normalPic: "../image/icon/最小化-未选中@2x.png";
            hoverPic:"../image/icon/最小化移至icon@2x.png";
            pressedPic:"../image/icon/最小化-点击@2x.png";
            width: 30;
            height: 20;

            anchors.top: maintitle01.top;
            anchors.topMargin: 45;
            anchors.right: maintitle01.right;
            anchors.rightMargin: 223;

            onClicked: {
                mainWindow.visibility = Window.Minimized;
            }
        }
    }

    //背景图
    Image {
        id: backgroundImg;

        anchors.top: parent.top;
        anchors.topMargin: 146;
        anchors.left: parent.left;
        fillMode: Image.PreserveAspectCrop;
        smooth: true;
        source: "../image/background@2x.png";
    }

    //property var nRa: value

//    Demo{
//        id: vDemo01;

//        x: 120;
//        y: 120;
//        width: 300;
//        height: 300;
//        //clip: true;
//    }

    /*Bubbles2{
        id: bubbles01;

        x:100;
        y:100;
    }*/

    //工具栏
    Toolbar {
        id: toolbar01

        anchors.top: parent.top;
        anchors.topMargin: 86;
        anchors.left: parent.left;
        z:3;
        Button2{
            id: toolButton1;
            height: 60//文件按钮
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.leftMargin: 45;
            text_button2: "文件";
            url_button2: "../image/tool/文件icon@2x.png";
            btn_area: 98;
            icon_width: 23;
            icon_height: 20;

            onBtn2_clicked: {
                rec_help.visible=false;

                if(rec_file.visible===true)
                {
                      rec_file.visible = false;
                      menuAllMouseArea.visible = false;
                }
                else
                {
                    rec_file.visible = true;
                    menuAllMouseArea.visible = true;
                }
            }
        }
        Column
        {
            id:rec_file;
            anchors.left: parent.left;
            anchors.leftMargin: 26;
            anchors.top: toolButton1.bottom;
            visible: false;

            Button3
            {
                id:filemenu_button1;
                text_button3:"数据导入";
                url_button:"../image/tool/数据导入@2x.png";
                icon_topMargin:20;
                icon_width:17;
                icon_height:17;


                onBtn3_clicked: {
                   fileDialog1.visible=true;
                }
            }

            Button3
            {
                id:filemenu_button2;
                text_button3:"保存图片";
                url_button:"../image/tool/保存@2x.png";
                icon_topMargin:19;
                icon_width:16;
                icon_height:18;
                onBtn3_clicked: {
                   console.log("保存图片");
                }
            }

            Button3
            {
                id:filemenu_button3;
                text_button3:"另存为…";
                url_button:"../image/tool/另存为@2x.png";
                icon_topMargin:17;
                icon_width:16;
                icon_height:18;
                onBtn3_clicked: {
                   console.log("另存为");
                }
            }

        }
//打开文件对话框
        FileDialog{
               id: fileDialog1;
               visible: false;
               folder: shortcuts.desktop;
               selectExisting: true
               selectFolder: false
               selectMultiple: false
               nameFilters: ["json文件 (*.json)"]
               onAccepted: {
                   console.log("you choose:"+fileDialog1.fileUrl);
                   fileprocess.setJsonFilePath(fileDialog1.fileUrl);
                   var res = fileprocess.readJsonFile();



               }
               onRejected: {
                    console.log("Canceled");
                    fileDialog1.visible=false;
                }
           }

        Button2{
            id: toolButton2;
            height: 60//编辑按钮

            anchors.top: parent.top;
            anchors.left: toolButton1.right;
            anchors.leftMargin: 45;
            text_button2: "编辑";
            url_button2: "../image/tool/画图icon@2x.png";
            btn_area: 96;
            icon_width: 21;
            icon_height: 21;

            onBtn2_clicked: {
                console.log("编辑");//***************************************************************************
                input1.visible = true;
            }
        }
        Button2{
            id: toolButton3;
            height: 60//帮助按钮

            anchors.top: parent.top;
            anchors.left: toolButton2.right;
            anchors.leftMargin: 45;
            text_button2: "帮助";
            url_button2: "../image/tool/帮助icon@2x.png";
            btn_area: 88;
            icon_width: 13;
            icon_height: 22;

            onBtn2_clicked: {
                rec_file.visible=false;

                if(rec_help.visible===true)
                {
                      rec_help.visible = false;
                      menuAllMouseArea.visible = false;
                }
                else
                {
                    rec_help.visible = true;
                    menuAllMouseArea.visible = true;
                }
            }
        }
        //帮助工具栏的下拉列表
                Column
                {
                    id:rec_help;
                    visible: false;
                    anchors.left:toolButton3.left;
                    anchors.top:toolButton3.bottom;

                    Button3
                    {
                        id:helpmenu_button1;
                        text_button3:"功能介绍";
                        url_button:"../image/tool/功能介绍-1@2x.png";
                        icon_topMargin:18;
                        icon_width:16;
                        icon_height:16;

                        onBtn3_clicked: {
                           function_intro.visible=true;
                        }

                    }
                    Button3
                    {
                        id:helpmenu_button2;
                        text_button3:"软件信息";
                        url_button:"../image/tool/软件信息-1@2x.png";
                        icon_topMargin:18;
                        icon_width:17;
                        icon_height:20;
                        onBtn3_clicked: {
                           software_intro.visible=true;
                        }

                    }

                }

            }

    Dialog_info
    {
        id:function_intro;

        visible: false;

        z:100;

        anchors.top:parent.top;
        anchors.left:parent.left;
        anchors.topMargin: parent.height/2-240;
        anchors.leftMargin: parent.width/2-300;



        dialog_title:"功能介绍";
        dialog_info:"这里是功能介绍";

        onDialog_closed:
        {
           function_intro.visible=false;
        }

     }
    Dialog_info
    {
        id:software_intro;

        visible: false;

        z:100;

        anchors.top:parent.top;
        anchors.left:parent.left;
        anchors.topMargin: parent.height/2-240;
        anchors.leftMargin: parent.width/2-300;



        dialog_title:"软件信息";
        dialog_info:"这里是软件信息";

        onDialog_closed:
        {
           software_intro.visible=false;
        }

     }
    Dialog_input
    {
        id:input1;
        visible: false;

        z:100;

        anchors.top:parent.top;
        anchors.left:parent.left;
        anchors.topMargin:(parent.height/2)-260;
        anchors.leftMargin: (parent.width/2)-300;

        onDialog_closed1:
        {
           input1.visible=false;
        }

        onDialog_save1:
        {
           input1.visible=false;
        }

    }
    //可视化栏
    FDview{
        id: vis01;

        anchors.top: toolbar01.bottom;
        anchors.topMargin: 21;
        anchors.left: parent.left;
        anchors.leftMargin: 607;
    }

    //信息栏
    Infoview{
        id: info01;

        anchors.top: toolbar01.bottom;
        anchors.topMargin: 21;
        anchors.left: parent.left;
        anchors.leftMargin: 20;

        info_img: "../image/info/未加载图片选框@2x.png";
        info_name: "显示纹样名称";
    }

    Cirimg{
        id: cirImg01;

        x:1200;
        y:500;
        cuted_img: "../image/mengli.png";
        img_height: 100;
        img_width: 100;
        progress: 300;
        arcWidth:6;
        arcColor: "pink";
        arcBackgroundColor: "pink";
    }

    /*ForceDirected{
        id: forceDirected01;

        x: 200;
        y: 200;
    }*/
    //用来控制菜单栏的隐藏
    MouseArea
          {
              id:menuAllMouseArea;
              visible: false;
              z:-1;


              width: mainWindow.width;
              height: mainWindow.height;

              onClicked:
              {

                  rec_file.visible = false;
                  rec_help.visible = false;

                  menuAllMouseArea.visible = false;
              }
          }
}
