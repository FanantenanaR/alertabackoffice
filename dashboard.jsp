<%-- 
    Document   : SignalementAccueil
    Created on : 22 déc. 2021, 18:01:00
    Author     : USER
--%>

<%@page import="entity.StatTypeTotal"%>
<%@page import="entity.StatRegion"%>
<%@page import="entity.StatNombre"%>
<%@page import="entity.StatEtat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<StatNombre> statnombre = (ArrayList<StatNombre>) request.getAttribute("statnombre");%>
<% ArrayList<StatRegion> statregion = (ArrayList<StatRegion>) request.getAttribute("statRegion");%>
<% ArrayList<StatTypeTotal> statetatglobal = (ArrayList<StatTypeTotal>) request.getAttribute("statEtatGlobal"); %>
<% ArrayList<StatEtat> statEtatPosted = (ArrayList<StatEtat>) request.getAttribute("statEtatPosted"); %>
<% ArrayList<StatEtat> statEtatValided = (ArrayList<StatEtat>) request.getAttribute("statEtatValided"); %>
<% ArrayList<StatEtat> statEtatEncours = (ArrayList<StatEtat>) request.getAttribute("statEtatEncours"); %>
<% ArrayList<StatEtat> statEtatDone = (ArrayList<StatEtat>) request.getAttribute("statEtatDone"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="<%= request.getContextPath() %>/assets/js/jquery-3.6.0.min.js"></script>
         <script src="<%= request.getContextPath() %>/assets/js/canvasjs.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid p-5">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Effectif</h3><a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#"><i class="fas fa-download fa-sm text-white-50"></i>&nbsp;Generate Report</a>
                    </div>
                    <div class="row">
                        <% for (int idx = 0; idx < statnombre.size(); idx++) { %>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-start-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col me-2">
                                            <div class="text-uppercase text-<%= statnombre.get(idx).getCouleur() %> fw-bold text-xs mb-1"><span><%= statnombre.get(idx).getDesignation() %></span></div>
                                            <div class="text-dark fw-bold h5 mb-0"><span><%= statnombre.get(idx).getNombre() %></span></div>
                                        </div>
                                        <div class="col-auto"><i class="bi bi-<%= statnombre.get(idx).getIcone() %> fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-xl-12">
                            <div class="card shadow mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary fw-bold m-0">Signalement par region</h6>
                                </div>
                                <div class="card-body">
                                    <div id="regionchart" style="height: 470px; width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-6">
                            <div class="card shadow mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary fw-bold m-0">Signalement par état groupé par type de signalement</h6>
                                </div>
                                <div class="card-body">
                                    <div id="chartpertype" style="height: 600px; width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-xl-6">
                            <div class="card shadow mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h6 class="text-primary fw-bold m-0">Signalement par type</h6>
                                </div>
                                <div class="card-body">
                                    <div id="chartetatglobal" style="height: 600px; width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © Brand 2021</span></div>
                </div>
            </footer>
                </div>
        
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    
        <script>
            window.onload = function() {      
                
                var regionchart = new CanvasJS.Chart("regionchart", {
                    theme: "light2", // "light1", "light2", "dark1"
                    animationEnabled: false,
                    exportEnabled: true,
                    axisX: {
                        labelPlacement: "outside",
                        tickPlacement: "outside",
                        title: "Region",
                    },
                    axisY2: {
                        title: "Nombre de signalement",
                        titleFontSize: 14,
                        includeZero: true,
                    },
                    data: [{
                        type: "bar",
                        axisYType: "secondary",
                        yValueFormatString: "#,###.## signalements",
                        indexLabel: "{y}",
                        dataPoints: [
                            <% for (int idx = 0; idx < statregion.size(); idx++) { %>
                                <% StatRegion elt = (StatRegion) statregion.get(idx); %>
                                <% if(idx+1 == statregion.size()) { %>
                                        { y: <% out.println(elt.getNombre()); %> , label: '<%= elt.getDesignation() %>'  }
                                <% } else { %>
                                        { y: <% out.println(elt.getNombre()); %> , label: '<%= elt.getDesignation() %>'   },
                                <% } %>
                            <% } %>
                        ]
                    }]
                });
                
                regionchart.render();
                
             
            
            var chartetatglobal = new CanvasJS.Chart("chartetatglobal", {
                exportEnabled: true,
                animationEnabled: false,
                legend:{
                    cursor: "pointer",
                    itemclick: explodePie
                },
                data: [{
                    type: "pie",
                    showInLegend: true,
                    toolTipContent: "{name}: <strong>{y}</strong>",
                    indexLabel: "{name} - {y}",
                    dataPoints: [
                        <% for (int idx = 0; idx < statetatglobal.size(); idx++) { %>
                            <% StatTypeTotal elt = (StatTypeTotal) statetatglobal.get(idx); %>
                            <% if(idx+1 == statetatglobal.size()) { %>
                                    { y: <%= elt.getNombre() %> , name: '<%= elt.getNomtype()%>' }
                            <% } else { %>
                                    { y: <%= elt.getNombre() %> , name: '<%= elt.getNomtype() %>' },
                            <% } %>
                        <% } %>
                    ]
                }]
            });
            
            chartetatglobal.render();
                
            function explodePie (e) {
                    if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
                            e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
                    } else {
                            e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
                    }
                    e.chart.render();

            }
            
            
            var chartpertype = new CanvasJS.Chart("chartpertype", {
                    animationEnabled: true,
                    axisX: {
                            labelPlacement: "outside",
                            tickPlacement: "outside",
                            title: "Type de signalement",
                            interval: 1,
                            intervalType: "string"
                            
                    },
                    axisY:{
                            labelPlacement: "outside",
                            tickPlacement: "outside",
                            title: "Nombre de signalement",
//                            valueFormatString:"$#y",
                            interval: 1,
                            gridColor: "#B6B1A8",
                            tickColor: "#B6B1A8"
                    },
                    toolTip: {
                            shared: true,
                            content: toolTipContent
                    },
                    data: [{
                            type: "stackedColumn",
                            showInLegend: true,
                            color: "#ed4000",
                            name: "Signalement posté",
                            dataPoints: [
                                <% for (int idx = 0; idx < statEtatPosted.size(); idx++) { %>
                                    <% StatEtat elt = (StatEtat) statEtatPosted.get(idx); %>
                                    <% if(idx+1 == statEtatPosted.size()) { %>
                                            { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype()%>' }
                                    <% } else { %>
                                            { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype() %>' },
                                    <% } %>
                                <% } %>
                            ]
                            },
                            {        
                                type: "stackedColumn",
                                showInLegend: true,
                                name: "Signalement validé",
                                color: "#edc000",
                                dataPoints: [
                                    <% for (int idx = 0; idx < statEtatValided.size(); idx++) { %>
                                        <% StatEtat elt = (StatEtat) statEtatValided.get(idx); %>
                                        <% if(idx+1 == statEtatValided.size()) { %>
                                                { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype()%>' }
                                        <% } else { %>
                                                { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype() %>' },
                                        <% } %>
                                    <% } %>
                                ]
                            },
                            {        
                                type: "stackedColumn",
                                showInLegend: true,
                                name: "Signalement en cours de traitement",
                                color: "#eced00",
                                dataPoints: [
                                    <% for (int idx = 0; idx < statEtatEncours.size(); idx++) { %>
                                        <% StatEtat elt = (StatEtat) statEtatEncours.get(idx); %>
                                        <% if(idx+1 == statEtatEncours.size()) { %>
                                                { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype()%>' }
                                        <% } else { %>
                                                { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype() %>' },
                                        <% } %>
                                    <% } %>
                                ]
                            }
                            ,
                            {        
                                type: "stackedColumn",
                                showInLegend: true,
                                name: "Probleme resolu",
                                color: "#6fec00",
                                dataPoints: [
                                    <% for (int idx = 0; idx < statEtatDone.size(); idx++) { %>
                                        <% StatEtat elt = (StatEtat) statEtatDone.get(idx); %>
                                        <% if(idx+1 == statEtatDone.size()) { %>
                                                { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype()%>' }
                                        <% } else { %>
                                                { y: <%= elt.getNombre() %> , label: '<%= elt.getNomtype() %>' },
                                        <% } %>
                                    <% } %>
                                ]
                    }
                    ]
            });
            chartpertype.render();

            function toolTipContent(e) {
                    var str = "";
                    var total = 0;
                    var str2, str3;
                    for (var i = 0; i < e.entries.length; i++){
                            var  str1 = "<span style= 'color:"+e.entries[i].dataSeries.color + "'> "+e.entries[i].dataSeries.name+"</span>: $<strong>"+e.entries[i].dataPoint.y+"</strong>bn<br/>";
                            total = e.entries[i].dataPoint.y + total;
                            str = str.concat(str1);
                    }
                    str2 = "<span style = 'color:DodgerBlue;'><strong>"+(e.entries[0].dataPoint.x).getFullYear()+"</strong></span><br/>";
                    total = Math.round(total * 100) / 100;
                    str3 = "<span style = 'color:Tomato'>Total:</span><strong> $"+total+"</strong>bn<br/>";
                    return (str2.concat(str)).concat(str3);
            }


            }
        </script>
        
    </body>
    
</html>
