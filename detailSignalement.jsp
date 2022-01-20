<%-- 
    Document   : detailSignalement
    Created on : 28 déc. 2021, 20:34:51
    Author     : User
--%>
<%@page import="entity.Region"%>
<%@page import="entity.ListerSignalement" %>
<%@page import="entity.SignalementGlobale" %>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    ArrayList<ListerSignalement> s = (ArrayList<ListerSignalement>) request.getAttribute("listSignalement");
    ArrayList<SignalementGlobale> sg = (ArrayList<SignalementGlobale>) request.getAttribute("image");
    ArrayList<Region> r = (ArrayList<Region>) request.getAttribute("regions");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bouton.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/headers.css">
        
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
        
        <script src="<%= request.getContextPath()%>/assets/js/bootstrap.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Signalement</title>
        
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        
        <style>
            #map { position: absolute; top: 0; bottom: 0; left: 0; right: 0; }
        </style>
    
    </head>
    
    <header>
        <div class="px-3 py-2 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" fill="currentColor" class="bi bi-emoji-wink-fill" viewBox="0 0 16 16">
                            <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM7 6.5C7 5.672 6.552 5 6 5s-1 .672-1 1.5S5.448 8 6 8s1-.672 1-1.5zM4.285 9.567a.5.5 0 0 0-.183.683A4.498 4.498 0 0 0 8 12.5a4.5 4.5 0 0 0 3.898-2.25.5.5 0 1 0-.866-.5A3.498 3.498 0 0 1 8 11.5a3.498 3.498 0 0 1-3.032-1.75.5.5 0 0 0-.683-.183zm5.152-3.31a.5.5 0 0 0-.874.486c.33.595.958 1.007 1.687 1.007.73 0 1.356-.412 1.687-1.007a.5.5 0 0 0-.874-.486.934.934 0 0 1-.813.493.934.934 0 0 1-.813-.493z"/>
                        </svg>
                        <div class="sidebar-brand-text mx-3"><span>Alerta</span></div>
                    </a>

                    <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
                        <li>
                            <a href="#" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#speedometer2"/></svg>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="ListSignalement" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#table"/></svg>
                                Signalement
                            </a>
                        </li>
<!--                        <li>
                            <a href="Minicarte" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#map"/></svg>
                                Carte
                            </a>
                        </li>-->
                        <li>
                            <a href="ListTypeSignalement" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#grid"/></svg>
                                Type de Signalement
                            </a>
                        </li>
                        <li>
                            <a href="LoginRegion" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#people-circle"/></svg>
                                Profil Region
                            </a>
                        </li>
                        <li>
                            <a href="LogOut" class="nav-link text-white">
                                <svg class="bi d-block mx-auto mb-1" width="24" height="24"><use xlink:href="#logout"/></svg>
                                Deconnection
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    
    
    <body>
        
        <div class="container-md">
            <% for(int i=0; i<s.size(); i++) { %>
                <form action="ValidationSignalement">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="display-4 text-center" > 
                                <%= s.get(i).getNom() %> 
                                <input type="submit" class="btn btn-outline-success" value="Valider">
                                <a href="ListSignalement" class="btn btn-outline-secondary" role="button" aria-pressed="true">Retour</a>
                            </div>
                        </div>

                        <input type="hidden" id="id" name="id" value="<%= s.get(i).getId() %>">

                        <div class="col-md-7">
                            <div class="container py-5 h-100">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                  <div class="col col-lg-8 col-xl-12">
                                    <div class="card">
                                        <div class="card-body p-4 text-black">
                                            <div class="mb-5">
                                                <p class="lead fw-normal mb-1">Attribuer region :
                                                    <select name="regionSelect" id="regionSelect">
                                                        <% for(int j=0; j<r.size(); j++){ %>
                                                            <option value="<%= r.get(j).getId() %>" ><%= r.get(j).getNom() %></option>
                                                        <% } %>
                                                    </select>
                                                </p>
                                            </div>
                                                    
                                            <div class="mb-5">
                                                <p class="lead fw-normal mb-1">Type : <%= s.get(i).getType() %></p>
                                            </div>
                                            
                                            <div class="mb-5">
                                              <p class="lead fw-normal mb-1">Description</p>
                                              <div class="p-4" style="background-color: #f8f9fa;">
                                                  <%= s.get(i).getDescription() %>
                                              </div>
                                            </div>
                                              
                                            <div class="mb-5">
                                                <p class="lead fw-normal mb-1">Latitude : <%= s.get(i).getLatitude() %></p>
                                                <p class="lead fw-normal mb-1">Longitude : <%= s.get(i).getLongitude() %></p>
                                            </div>

                                            <% for(int j=0; j<sg.size();j++){ %>
                                                <div class="row g-2">
                                                    <div class="col mb-2">
                                                        <div class="col-md-5">
                                                            <img src="<%= request.getContextPath() %>/assets/sary/<%= sg.get(j).getImage() %>" alt="image 1" class="w-100 rounded-3">
                                                        </div>
                                                    </div>
                                                </div>
                                            <% } %> 
                                        </div>
                                    </div>
                                  </div>
                                </div>
                            </div>    
                        </div>
                        <div class="col-md-5">
                            <div id="map">
                                <script type="text/javascript">
                                    var map = L.map('map').setView([-18.397, 45.644], 6);

                                    L.tileLayer('https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=QEzPkll3oLHKKFbWg3Hf',{
                                        attribution : '<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
                                    }).addTo(map);
                                    var marker = L.marker([<%= s.get(i).getLatitude() %>, <%= s.get(i).getLongitude() %>]).addTo(map);
                                </script>
                            </div>
                        </div>
                    </div>             
                </form>
            <% } %>
        </div>
                    
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="bootstrap" viewBox="0 0 118 94">
            <title>Bootstrap</title>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
        </symbol>
        <symbol id="home" viewBox="0 0 16 16">
            <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
        </symbol>
        <symbol id="speedometer2" viewBox="0 0 16 16">
            <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
            <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
        </symbol>
        <symbol id="table" viewBox="0 0 16 16">
            <path d="M3.05 3.05a7 7 0 0 0 0 9.9.5.5 0 0 1-.707.707 8 8 0 0 1 0-11.314.5.5 0 0 1 .707.707zm2.122 2.122a4 4 0 0 0 0 5.656.5.5 0 1 1-.708.708 5 5 0 0 1 0-7.072.5.5 0 0 1 .708.708zm5.656-.708a.5.5 0 0 1 .708 0 5 5 0 0 1 0 7.072.5.5 0 1 1-.708-.708 4 4 0 0 0 0-5.656.5.5 0 0 1 0-.708zm2.122-2.12a.5.5 0 0 1 .707 0 8 8 0 0 1 0 11.313.5.5 0 0 1-.707-.707 7 7 0 0 0 0-9.9.5.5 0 0 1 0-.707zM10 8a2 2 0 1 1-4 0 2 2 0 0 1 4 0z"/>
        </symbol>

        <symbol id="map" viewBox="0 0 16 16">
            <path d="M10.453 14.016l6.563-6.609-1.406-1.406-5.156 5.203-2.063-2.109-1.406 1.406zM12 2.016q2.906 0 4.945 2.039t2.039 4.945q0 1.453-0.727 3.328t-1.758 3.516-2.039 3.070-1.711 2.273l-0.75 0.797q-0.281-0.328-0.75-0.867t-1.688-2.156-2.133-3.141-1.664-3.445-0.75-3.375q0-2.906 2.039-4.945t4.945-2.039z"/>
        </symbol>
        <symbol id="people-circle" viewBox="0 0 16 16">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
        </symbol>
        <symbol id="grid" viewBox="0 0 16 16">
            <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
        </symbol>
        <symbol id="logout" viewBox="0 0 16 16">
            <path d="M7.5 1v7h1V1h-1z"/>
            <path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
        </symbol>
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">

        </svg>
    </svg>
    
    
    </body>
</html>


