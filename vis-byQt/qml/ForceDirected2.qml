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

Item {
    id: forceDirected2;

    Qan.GraphView{
        id: graphView;

        anchors.fill: parent;
        navigable: true;
        clip: true;
        graph: visgraph;

        /*Image{
            id: background;
            width: 1216;
            height: 709;
            source: "../image/vis/logicShow@2x.png";
        }*/

        Qan.VisGraph{
            id: visgraph;
            objectName: "graph"
            anchors.fill: parent
            clip: true
            connectorEnabled: true
            Component.onCompleted: {
                var n1 = visgraph.insertVisNode();
                n1.image = "../image/mengli.png";
                n1.item.x = 400;
                n1.item.y = 200;
                n1.item.style.backRadius = 99;

                var n2 = visgraph.insertVisNode();
                n2.image = "../image/tianhe.png";
                n2.item.x = 600;
                n2.item.y = 300;
                n2.item.style.backRadius = 99;

                var l1 = visgraph.insertEdge(n1,n2);
                l1.item.dstShape = Qan.EdgeStyle.None;
            }
        }

    }

}
