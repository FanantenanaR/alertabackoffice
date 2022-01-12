<%-- 
    Document   : loginRegion
    Created on : 20 déc. 2021, 17:52:14
    Author     : Verthaga
--%>

<%@page import="entity.Region"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<Region> listRegion = (ArrayList<Region>) request.getAttribute("listRegion"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Region</title>
        <script src="<%= request.getContextPath() %>/assets/js/jquery-3.6.0.min.js"></script>
    </head>
    <body onload="showLogins('0')">
        
        <%@include file="header.jsp" %>
        <div class="container-md">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="display-4 text-center mb-3"> Les logins des regions</div>
                   
                    <form>
                        <p class="mt-3 font-weight-bold ">Choisir un region</p>
                        <select class="custom-select col-md-4" id="inlineFormCustomSelect" onchange="showLogins(this.value)">
                            <option value="0">Tous</option>
                            <% for(int i=0; i<listRegion.size(); i++) { %>
                            <option value="<%= listRegion.get(i).getId() %>" ><%= listRegion.get(i).getNom() %></option>
                            <% } %>
                        </select>
                    </form>
                    <button class="btn btn-dark mt-3" data-toggle="modal" data-target="#modalAjout">Nouveau login</button>
                    
                    <div id="logins"></div>
                </div>
                
                <!-- Modal Ajout start -->
                <div class="modal fade" id="modalAjout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nouveau Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                        <form class="p-3 border-1"  method="post" action="AjoutLoginRegion" >
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="region">Region</label>
                                    <select class="form-control col-md-4" id="region" name="idRegion">
                                        <% for(int i=0; i<listRegion.size(); i++) { %>
                                        <option value="<%= listRegion.get(i).getId() %>" ><%= listRegion.get(i).getNom() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="nom">Nom</label>
                                    <input type="text" class="form-control" id="nom" name="nom">
                                </div>
                                <div class="form-group">
                                    <label for="login">Login</label>
                                    <input type="text" class="form-control" id="login" name="login">
                                </div>
                                <div class="form-group">
                                    <label for="mdp">Mot de passe</label>
                                    <input type="text" class="form-control" id="mdp" name="mdp">
                                </div>
                                
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
                <div class="col-md-2"></div>
            </div>
        </div>
    <script src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>
    <script>
        function showLogins(idRegion) {
          if (idRegion == "") {
            document.getElementById("logins").innerHTML = "";
            return;
          } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
                document.getElementById("logins").innerHTML = this.responseText;
              }
            };
            xmlhttp.open("GET","ListLoginRegion?idRegion="+idRegion,true);
            xmlhttp.send();
          }
        }
        
        function changeValue(idUser,nom, login,idRegion){
            document.getElementById("idUser").defaultValue = idUser;
            document.getElementById("nom").defaultValue = nom;
            document.getElementById("login").defaultValue = login;
            document.getElementById("idRegion").defaultValue = idRegion;
        }
    </script>
    </body>
</html>
