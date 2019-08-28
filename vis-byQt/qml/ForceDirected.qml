import QtQuick 2.0
import "../d3.min.js" as D3

Rectangle{
    id: forceDirected;
    width: 900;
    height: 700;

    property var svg;
    property var force3;
    property var edges_lines;
    property var edges_text;
    property var nodes_img;
    property var defs;
    property var catpattern;
    property var nodes_text;

    Component.onCompleted: {
        fdTimer.start();
    }

    Timer{
        id: fdTimer;
        interval: 20;
        running: false;
        repeat: false;
        onTriggered: {
            var fdwidth = 800;
            var fdheight = 600;
            var img_w = 77;
            var img_h = 80;
            var radius = 30;
            var text_dx = -20;
            var text_dy = 20;

            /*svg = D3.d3.select("forceDirected").append("svg")
            .attr("width",fdwidth)
            .attr("height",fdheight);*/

            D3.d3.json("relation.json",function(error,root){
                if(error){
                    return console.log(error);
                }
                console.log(root);

                force3 = D3.d3.layout.force()
                .nodes(root.nodes)
                .links(root.edges)
                .size([fdwidth,fdheight])
                .linkDistance(200)
                .charge(-1500)
                .start();

                edges_lines = svg.selectAll("line")
                .data(root.edges)
                .enter()
                .append("line")
                .style("stroke","#ccc")
                .style("stroke-width",1);

                edges_text = svg.selectAll(".linetext")
                .data(root.edges)
                .enter()
                .append("text")
                .attr("class","linetext")
                .text(function(d){
                    return d.relation;
                });

                nodes_img = svg.selcetAll("image")
                .data(root.nodes)
                .enter()
                .append("circle")
                .attr("class","circleImg")
                .attr("r",radius)
                .attr("fill", function(d,i){
                    defs = svg.append("defs").attr("id","imgdefs");

                    catpattern = defs.append("pattern")
                    .attr("id","catpattern"+i)
                    .attr("height",1)
                    .attr("width",1);

                    catpattern.append("image")
                    .attrr("x", - (img_w / 2 - radius))
                    .attr("y", - (img_h / 2 - radius))
                    .attr("width", img_w)
                    .attr("height", img_h)
                    .attr("xlink:href", d.image);

                    return "url(#catpattern)"+i+")";
                })

                .on("mouseover",function(d,i){
                    edges_text.style("fill-opacity",function(edge){
                        if(edge.source === d || edge.target === d){
                            return 1.0;
                        }
                    });
                })
                .on("mouseout",function(d,i){
                    edges_text.style("fill-opacity",function(edge){
                        if(edge.source === d || edge.target === d){
                            return 0.0;
                        }
                    });
                })
                .call(force3.drag);

                nodes_text = svg.selectAll(".nodetext")
                .data(root.nodes)
                .enter()
                .append("text")
                .attr("class","nodetext")
                .attr("dx",text_dx)
                .attr("dy",text_dy)
                .text(function(d){
                    return d.name;
                });

                force3.on("tick",function(){
                    root.nodes.forEach(function(d,i){
                        d.x = d.x - img_w/2 < 0 ? img_w/2:d.x;
                        d.x = d.x + img_w/2 > fdwidth ? fdwidth - img_w/2:d.x;
                        d.y = d.y - img_h/2 < 0 ? img_h/2:d.y;
                        d.y = d.y + img_h/2 > fdheight ? fdheight - img_h/2:d.y;
                    });

                    //更新连接线的位置
                    edges_line.attr("x1",function(d){ return d.source.x; });
                    edges_line.attr("y1",function(d){ return d.source.y; });
                    edges_line.attr("x2",function(d){ return d.target.x; });
                    edges_line.attr("y2",function(d){ return d.target.y; });

                    //更新连接线上文字的位置
                    edges_text.attr("x",function(d){ return (d.source.x + d.target.x) / 2 ; });
                    edges_text.attr("y",function(d){ return (d.source.y + d.target.y) / 2 ; });


                    //更新结点图片和文字
                    nodes_img.attr("cx",function(d){ return d.x });
                    nodes_img.attr("cy",function(d){ return d.y });
                    nodes_text.attr("x",function(d){ return d.x });
                    nodes_text.attr("y",function(d){ return d.y + img_w/2; });
                });
            });

            console.log(svg.nodetext);
        }
    }

}
