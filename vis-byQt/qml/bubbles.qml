import QtQuick 2.0
//import "."
import QtSensors 5.0
import "../d3.min.js" as D3

Rectangle {
    id: bubbleContainer
    width: 1600
    height: 1000
    //clip: true

    Cirimg{
        id: cirImg01;

        x:1200;
        y:700;
        cuted_img: "../image/mengli.png";
        img_height: 20;
        img_width: 20;
        progress: 300;
        arcWidth:6;
        arcColor: "pink";
        arcBackgroundColor: "pink";
    }
}
