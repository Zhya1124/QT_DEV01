import QtQuick 2.0

/*
  8/22 添加了弹出窗界面定义 -L

  */



Rectangle {  //height:480  height:640


   id:vDialog

   property var dialog_title:"";
   property var dialog_info:"";
   signal dialog_closed;//点击信号
   height:480;
   width:640;

   //弹出框的标题栏
   Rectangle
   {
       id:dialog_title1

       height: 60;
       width: 640;

       Image
       {
           id:title_bg
           height: 60
           anchors.bottomMargin: -5
           source:"../image/dialog/顶栏@2x.png";
           anchors.fill:parent;

           Text {
               id: title_name;
               anchors.top:parent.top;
               anchors.topMargin: 10;
               text: dialog_title;
               anchors.centerIn: parent;
               color: "#ffffff";
               font.pointSize: 25;
               font.family: "simplex";
           }

           Image
           {
              id:dlog_closed;
              anchors.top:parent.top;
              anchors.topMargin:22;
              anchors.right:parent.right;
              anchors.rightMargin: 15;
              source:"../image/dialog/取消@2x.png";
              height:24;
              width:24;

              MouseArea
              {
                  id: dialog_ma;

                  anchors.fill: parent;

                  onClicked: {
                      dialog_closed();
                  }
              }

           }


       }


   }

   //内容部分
   Rectangle
   {
       id:dialog_content;
       width:640
       height:420
       anchors.leftMargin: 0
       anchors.topMargin: -7
       anchors.top:dialog_title1.bottom;
       anchors.left:parent.left;

       Image
       {
           id:content_bg;
           width: 640
           height: 425
           anchors.leftMargin: 0
           anchors.topMargin: 0
           anchors.rightMargin: 0
           anchors.bottomMargin: -11
           anchors.fill:parent;
           source:"../image/dialog/背景图@2x.png";

       Text {
           id: content_info;
           text: dialog_info;
           color: "#ffffff";
           font.pointSize: 20;
           font.family: "simplex";
           anchors.centerIn: parent;
       }
       }

   }




}

