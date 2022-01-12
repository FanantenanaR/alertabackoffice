<%-- 
    Document   : listSignalement
    Created on : 23 déc. 2021, 05:42:01
    Author     : User
--%>

<%@page import="entity.ListerSignalement" %>
<%@page import="java.util.ArrayList" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    ArrayList<ListerSignalement> s = (ArrayList<ListerSignalement>) request.getAttribute("listSignalement");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste Signalement</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-md">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="display-4 text-center" > Les signalements non validés </div>
                </div>
                <div class="col-md-12">
                    <table class="table table-striped mt-3">
                        <thead>
                            <tr>
                              <th scope="col">Type</th>
                              <th scope="col">Signalement</th>
                              <th scope="col">Region</th>
                              <th scope="col">Date Envoie</th>
                            </tr>   
                        </thead>
                        <tbody>
                            <% for(int i=0; i<s.size(); i++) { %>
                                <tr>
                                    <td><%= s.get(i).getType() %></td>
                                    <td><%= s.get(i).getNom() %></td>
                                    <td><%= s.get(i).getRegion() %></td>
                                    <td><%= s.get(i).getDhenvoie() %></td>
                                    
                                    <td><a href="ImageSignalement?id=<%= s.get(i).getId() %>" >
                                    <img width="25" src="<%= request.getContextPath() %>/assets/image/more.png">
                                    </td> </a>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
                    
        <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>
    </body>
</html>

