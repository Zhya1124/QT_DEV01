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

                const CANVAS_WIDTH =1216;

                const CANVAS_HEIGHT = 709;

                let k;

                let mNodeList = [];

                let mEdgeList = [];

                let mDxMap = {};

                let mDyMap = {};

                let mNodeMap = {};

                function forceDirected() {

                  //generate nodes and edges

                  for (let i = 0; i < 5; i++) {

                    mNodeList.push(new Node(i));

                  }




                  let edge = new Edge(1, 3);

                  mEdgeList.push(edge);

                   edge = new Edge(2, 4);

                  mEdgeList.push(edge);




                  if (mNodeList && mEdgeList) {

                    k = Math.sqrt(CANVAS_WIDTH * CANVAS_HEIGHT / mNodeList.length);

                  }

                  for (let i = 0; i < mNodeList.length; i++) {

                    let node = mNodeList[i];

                    if (node) {

                      mNodeMap[node.id] = node;

                    }

                  }



                  //随机生成坐标. Generate coordinates randomly.

                  let initialX, initialY, initialSize = 40.0;

                  for (let i in mNodeList) {

                    initialX = CANVAS_WIDTH * .5;

                    initialY = CANVAS_HEIGHT * .5;

                    mNodeList[i].x = initialX + initialSize * (Math.random() - .5);

                    mNodeList[i].y = initialY + initialSize * (Math.random() - .5);

                  }



                  //迭代200次. Iterate 200 times.

                  for (let i = 0; i < 200; i++) {

                    calculateRepulsive();

                    calculateTraction();

                    updateCoordinates();

                  }

                  console.log(JSON.stringify(new Result(mNodeList, mEdgeList)));

                }



                function Node(id = null) {

                  this.id = id;

                  this.x = 22;

                  this.y = null;

                }

                function Edge(source = null, target = null) {

                  this.source = source;

                  this.target = target;

                }



                /**

                 * 计算两个Node的斥力产生的单位位移。

                 * Calculate the displacement generated by the repulsive force between two nodes.*

                 */

                function calculateRepulsive() {

                  let ejectFactor = 6;

                  let distX, distY, dist;

                  for (let i = 0; i < mNodeList.length; i++) {

                    mDxMap[mNodeList[i].id] = 0.0;

                    mDyMap[mNodeList[i].id] = 0.0;

                    for (let j = 0; j < mNodeList.length; j++) {

                      if (i !== j) {

                        distX = mNodeList[i].x - mNodeList[j].x;

                        distY = mNodeList[i].y - mNodeList[j].y;

                        dist = Math.sqrt(distX * distX + distY * distY);

                      }

                      if (dist < 30) {

                        ejectFactor = 5;

                      }

                      if (dist > 0 && dist < 250) {

                        let id = mNodeList[i].id;

                        mDxMap[id] = mDxMap[id] + distX / dist * k * k / dist * ejectFactor;

                        mDyMap[id] = mDyMap[id] + distY / dist * k * k / dist * ejectFactor;

                      }

                    }

                  }

                }



                /**

                 * 计算Edge的引力对两端Node产生的引力。

                 * Calculate the traction force generated by the edge acted on the two nodes of its two ends.

                 */

                function calculateTraction() {

                  let condenseFactor = 3;

                  let startNode, endNode;

                  for (let e = 0; e < mEdgeList.length; e++) {

                    let eStartID = mEdgeList[e].source;

                    let eEndID = mEdgeList[e].target;

                    startNode = mNodeMap[eStartID];

                    endNode = mNodeMap[eEndID];

                    if (!startNode) {

                      console.log("Cannot find start node id: " + eStartID + ", please check it out.");

                      return;

                    }

                    if (!endNode) {

                      console.log("Cannot find end node id: " + eEndID + ", please check it out.");

                      return;

                    }

                    let distX, distY, dist;

                    distX = startNode.x - endNode.x;

                    distY = startNode.y - endNode.y;

                    dist = Math.sqrt(distX * distX + distY * distY);

                    mDxMap[eStartID] = mDxMap[eStartID] - distX * dist / k * condenseFactor;

                    mDyMap[eStartID] = mDyMap[eStartID] - distY * dist / k * condenseFactor;

                    mDxMap[eEndID] = mDxMap[eEndID] + distX * dist / k * condenseFactor;

                    mDyMap[eEndID] = mDyMap[eEndID] + distY * dist / k * condenseFactor;

                  }

                }



                /**

                 * 更新坐标。

                 * update the coordinates.

                 */

                function updateCoordinates() {

                  let maxt = 4, maxty = 3; //Additional coefficients.

                  for (let v = 0; v < mNodeList.length; v++) {

                    let node = mNodeList[v];

                    let dx = Math.floor(mDxMap[node.id]);

                    let dy = Math.floor(mDyMap[node.id]);



                    if (dx < -maxt) dx = -maxt;

                    if (dx > maxt) dx = maxt;

                    if (dy < -maxty) dy = -maxty;

                    if (dy > maxty) dy = maxty;

                    node.x = node.x + dx >= CANVAS_WIDTH || node.x + dx <= 0 ? node.x - dx : node.x + dx;

                    node.y = node.y + dy >= CANVAS_HEIGHT || node.y + dy <= 0 ? node.y - dy : node.y + dy;

                  }

                }



                function Result(nodes = null, links = null) {

                  this.nodes = nodes;

                  this.links = links;

                }

                forceDirected();

                for(let i in mNodeList)
                {
                    var temp1 = visgraph.insertVisNode();
                    temp1.item.x = mNodeList[i].x;
                    temp1.item.y = mNodeList[i].y;
                    temp1.image = "../image/tianhe.png"
                    visgraph.insertPort(temp1, Qan.NodeItem.Bottom);
                }

                for(let i in mEdgeList)
                {
                    var target = mEdgeList[i].target;
                    var source = mEdgeList[i].source;
                       //****在下面补充画线的部分
                }
            }
        }

    }

}
