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
                //n1.item.z = 3;
                //n1.item.draggable = false;
                //n1.item.resizable = false;
                //n1.item.selected = false;
                //n1.locked = "locked";
                var n1p1 = visgraph.insertPort(n1, Qan.NodeItem.Bottom);

                var n2 = visgraph.insertVisNode();
                n2.image = "../image/tianhe.png";
                n2.item.x = 600;
                n2.item.y = 300;
                //n2.item.z = 3;
                //n2.item.draggable = false;
                //n2.item.resizable = false;
                //n2.item.selected = false;
                //n2.locked = "locked";
                var n2p1 = visgraph.insertPort(n2, Qan.NodeItem.Bottom);

                var l1 = visgraph.insertEdge(n1,n2);
                l1.item.dstShape = Qan.EdgeStyle.None;
                visgraph.bindEdgeSource(l1, n1p1);
                visgraph.bindEdgeDestination(l1, n2p1);
                //l1.item.z = 0;
            }
        }

    }

}
