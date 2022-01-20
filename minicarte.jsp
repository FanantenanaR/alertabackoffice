<%@page import="entity.ListerSignalement" %>
<%@page import="java.util.ArrayList" %>

<% 
    ArrayList<ListerSignalement> s = (ArrayList<ListerSignalement>) request.getAttribute("listSignalement");
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
        <title>title</title>
        <style>
            #map { position: absolute; top: 100px; bottom: 0; left: 0; right: 0; }
        </style>
        
    </head>
    <body>
        
        <div id="map">
        
        <script type="text/javascript">
            <% for (int i = 0; i < s.size(); i++) { %>
                var locations = [["<%= s.get(i).getNom() %>" , <%= s.get(i).getLatitude() %>, <%= s.get(i).getLongitude() %>]];
                
                var map = L.map('map').setView([-18.397, 45.644], 6);

                L.tileLayer('https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=QEzPkll3oLHKKFbWg3Hf',{
                    attribution : '<a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>'
                }).addTo(map);
                
                for (var i = 0; i < locations.length; i++) {
                    marker = new L.marker([locations[i][1], locations[i][2]])
                      .bindPopup(locations[i][0])
                      .addTo(map);
                  }
                
            <% } %>
            
        </script>
        </div>
        
        <%@include file="header.jsp" %>
    
    </body>
</html>

