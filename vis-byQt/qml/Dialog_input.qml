import QtQuick 2.0
import QtQuick.Dialogs 1.2
/*
 08/23 用于作为输入对话框 -L

 08/26 修改对话框格式，连接后端存入json文件的函数
 */

Rectangle
{
   id:vDialog_input;

   property var title_name:"请输入数据";

   signal dialog_save1;//点击信号
   signal dialog_closed1;
   //点击信号

   Rectangle
   {
     id:dialog_title;
     height:63;
     width:640

     Image
     {
         id:dialog_bg;
         source: "../image/dialog/顶栏@2x.png";
         anchors.fill:parent;

         Image
         {
             id:dialog_closed;
             anchors.top:parent.top;
             anchors.topMargin: 22;
             anchors.left:parent.left;
             anchors.leftMargin: 23;
             height:24;
             width:24;
             source: "../image/dialog/取消@2x.png";
             MouseArea
             {
                 id: dialog_ma1;
                 anchors.fill: parent;
                 onClicked: {
                     dialog_closed1();
                 }
             }

         }

         Text {
             id: dialog_t;
             text: title_name;
             anchors.top:parent.top;
             anchors.topMargin: 12;
             anchors.centerIn: parent;
             color: "#ffffff";
             font.pointSize: 25;
             font.family: "simplex";
         }
         Image
         {
             id:dialog_save;
             anchors.top:parent.top;
             anchors.topMargin: 22;
             anchors.right:parent.right;
             anchors.rightMargin: 15;
             height:24;
             width:31;
             source: "../image/dialog/确认@2x.png";

             MouseArea
             {
                 id: dialog_ma2;
                 anchors.fill: parent;
                 onClicked: {
                     console.log(info.text);

                     dialog_save1();
                 }
             }
         }

     }

   }//标题栏

   Rectangle
   {
       id:diag_content
       anchors.top:dialog_title.bottom;
       anchors.left:parent.left;
       height:420;
       width:640
       Image
       {
           id:content_bg
           anchors.fill:parent;
           source: "../image/dialog/背景图@2x.png";

           Text {
               id: name
               x: 65
               width: 87
               height: 46
               text: qsTr("姓名");
               styleColor: "#ffffff"
               font.pointSize: 25;

               font.family: "simplex";
               color:"#ffffff"
               anchors.right: input_bg.left;
               anchors.rightMargin: 59
               anchors.top:input_bg.top;
               anchors.topMargin: 10;
           }


           Image
           {
               id:input_bg;
               height:56
               anchors.leftMargin: 210;
               anchors.topMargin: 75;
               width: 227
               anchors.top:parent.top;
               anchors.left:parent.left;
               source: "../image/dialog/底@2x.png";

               TextEdit
               {
                   id:info
                   width:parent.width;
                   anchors.left:parent.left;
                   anchors.top:parent.top;
                   anchors.topMargin:10;

                   font.pointSize: 15;
                   cursorVisible:true;//显示光标
                   focus: true;
                   anchors.centerIn: parent;
                   font.family: "simplex";
                   color:"black";
                   text:"";
                   anchors.bottomMargin: 18

               }

           }

           Button3 {
               id: button3;
               x: 26;
               y: 180;
               width: 164;
               height: 61;
               color: "#00000000";
               text_button3: "打开文件";

               onBtn3_clicked: {
                  fileDialog2.visible=true;
               }
           }

           Image
           {
               id:input_bg1;
               height:56
               anchors.leftMargin: 210
               anchors.topMargin: 182
               width: 407
               anchors.top:parent.top;
               anchors.left:parent.left;
               source: "../image/dialog/底@2x.png";

               TextEdit
               {
                   id:info1
                   width:parent.width;
                   anchors.left:parent.left;
                   anchors.top:parent.top;
                   anchors.topMargin:10;

                   font.pointSize: 15;
                   cursorVisible:true;//显示光标
                   focus: true;
                   wrapMode:TextEdit.Wrap;
                   anchors.centerIn: parent;
                   font.family: "simplex";
                   color:"black";
                   text:"";
                   anchors.bottomMargin: 18;

               }

           }


           FileDialog{
                  id: fileDialog2;
                  visible: false;
                  folder: shortcuts.desktop;
                  selectExisting: true;
                  selectFolder: false;
                  selectMultiple: false;
                  nameFilters: ["jpg文件 (*.jpg)","png文件 (*.png)"];
                  onAccepted: {
                      console.log("you choose:"+fileDialog2.fileUrl);
                      var text1=fileDialog2.fileUrl;
                      info1.text=text1;
                      fileprocess.addRole(info.text,text1);
                  }
                  onRejected: {
                       console.log("Canceled");
                       fileDialog2.visible=false;
                   }
              }

}

}
}



