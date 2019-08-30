import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.1
import QtQuick.Shapes            1.0

import QuickQanava      2.0 as Qan
import visFD            1.0 as Qan
import "qrc:/QuickQanava"   as Qan
import "../d3.min.js"       as D3

Rectangle {
    id: forceDirected2;

    //color: "transparent";
    /*Cirimg{
        id: cirImg01;

        anchors.top: parent.top;
        anchors.topMargin: 100;
        anchors.left: parent.left;
        anchors.leftMargin: 200;

        cuted_img: "../image/mengli.png";
        img_height: 100;
        img_width: 100;
        progress: 300;
        arcWidth:2;
        arcColor: "#50616d";
        arcBackgroundColor: "#50616d";
    }*/
    Qan.GraphView{
        id: graphView;
        anchors.fill: parent;
        navigable: true;
        clip: true;
        Qan.VisGraph{
            id: graph;
            objectName: "graph";
            connectorEnabled: true;
            Component.onCompleted: {
                defaultEdgeStyle.srcShape = Qan.EdgeStyle.None;
                defaultEdgeStyle.dstShape = Qan.EdgeStyle.None;
                defaultEdgeStyle.lineType = Qan.EdgeStyle.Straight;

                var a = graph.insertVisNode();
                a.image = "../image/mengli.png";
                a.item.x = 400;
                a.item.y = 200;

                var b = graph.insertVisNode();
                b.image = "../image/tianhe.png";
                b.item.x = 600;
                b.item.y = 300;

                graph.insertEdge(a,b);
            }
        }

    }

}
