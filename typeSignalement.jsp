<%-- 
    Document   : typeSignalement
    Created on : 16 déc. 2021, 11:14:55
    Author     : Verthaga
--%>

<%@page import="entity.TypeSignalement"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<TypeSignalement> ts = (ArrayList<TypeSignalement>) request.getAttribute("listTs");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="<%= request.getContextPath() %>/assets/js/jquery-3.6.0.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-md">
            <div class="row">
                <div class="col-md-2 "></div>
                <div class="col-md-8">
                    <div class="display-4 text-center mt-3 mb-3" > Les types de signalement </div>
                    <button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#modalAjout">
                        Nouveau type de signalement
                    </button>
                    
                    <div class="row mt-5 row-cols-1 row-cols-md-3 g-4">
                        <% for(int i=0; i<ts.size(); i++) { %>
                            <div class="col mb-5 ">
                                <div class="card h-100 shadow p-3">
                                    <img src="<%= request.getContextPath() %>/assets/image/<%= ts.get(i).getIcon() %>" class="card-img-top p-1" alt="...">
                                    <div class="card-body text-center">
                                        <h5 class="card-title"><%= ts.get(i).getNom() %></h5>
                                        <button class=" btn btn-success " data-toggle="modal" data-target="#modalModif"
                                                onclick="changeValue('<%= ts.get(i).getNom() %>', '<%= ts.get(i).getId() %>', '<%= ts.get(i).getIcon() %>' )"> Modifier
                                        </button>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    </div>
                    <!-- Modal Ajout start -->
                    <div class="modal fade" id="modalAjout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nouveau type de signalement</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                            <form class="p-3 border-1" enctype="multipart/form-data" method="post" action="AjoutTypeSignalement" >
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="dignation">Designation</label>
                                        <input type="text" class="form-control" id="designation" name="nom">
                                    </div>
                                    <input class="mb-2" type="file" name="image">
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                  <input type="submit" class="btn btn-primary" value="Ajouter">
                                </div>
                            </form>
                        </div>
                      </div>
                    </div>
                   <!-- Modal Ajout end --> 
                   
                   <!-- Modal modif start -->
                   <div class="modal fade" id="modalModif" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modifier un type de signalement</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                            <form class="p-3 border-1" enctype="multipart/form-data" method="post" action="ModifTypeSignalement" >
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="dignation">Designation</label>
                                        <input type="text" class="form-control" id="nom" name="nom" value="">
                                        <input type="hidden"  id="idType" name="idType" value="">
                                        <input type="hidden"  id="image" name="image" value="">
                                    </div>
                                    <input class="mb-2" type="file" name="imageFile">
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                  <input type="submit" class="btn btn-primary" value="Modifier">
                                </div>
                            </form>
                        </div>
                      </div>
                    </div>
                   
                   <!-- Modal modif end -->
                </div>
                
                <div class="col-md-2"></div>
            </div>
        </div>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>
    <script>
        function changeValue(nom, idType, image){
            document.getElementById("nom").defaultValue = nom;
            document.getElementById("idType").defaultValue = idType;
            document.getElementById("image").defaultValue = image;
        }
    </script>
    </body>
</html>
