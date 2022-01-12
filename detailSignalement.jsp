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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Signalement</title>
    </head>
    <body>
        
        <%@include file="header.jsp" %>
        <div class="container-md">
            <% for(int i=0; i<s.size(); i++) { %>
            <form action="ValidationSignalement">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="display-4 text-center" > 
                            <%= s.get(i).getNom() %> 
                            <input type="submit" class="btn btn-outline-success" value="Valider">
                            <a href="ListSignalement" class="btn btn-outline-secondary" role="button" aria-pressed="true">Retour</a>
                            
                        </div>
                        
                    </div>
                    
                    <input type="hidden" id="id" name="id" value="<%= s.get(i).getId() %>">
                      
                    <div class="col-md-12">
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
                </div>
                </form>
            <% } %>
        </div>
                    
        <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>
        
        </body>
</html>


