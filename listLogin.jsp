<%@page import="entity.LoginRegionView"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList<LoginRegionView> listLogin = (ArrayList<LoginRegionView>) request.getAttribute("listLogin") ; %>
<div>
    <table class="table table-hover mt-3">
        <thead>
          <tr>
            <th scope="col">Nom de l'utilisateur</th>
            <th scope="col">Login</th>
            <th scope="col">Region</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
        <% for(int i=0; i<listLogin.size(); i++) { %>
          <tr>
            <td><%= listLogin.get(i).getNom() %></td>
            <td><%= listLogin.get(i).getLogin() %></td>
            <td><%= listLogin.get(i).getRegion() %></td>
            <td> 
                <button class="icon" data-toggle="modal" data-target="#modalModif" 
                                onclick="changeValue('<%= listLogin.get(i).getId() %>', 
                                '<%= listLogin.get(i).getNom() %>',
                                '<%= listLogin.get(i).getLogin() %>', 
                                '<%= listLogin.get(i).getIdRegion() %>')" >
                    <img width="25" src="<%= request.getContextPath() %>/assets/image/modif.png"> 
                </button>
                <a href="DeleteLoginRegion?id=<%= listLogin.get(i).getId() %>">
                    <button class="ml-3 icon">
                        <img width="25" src="<%= request.getContextPath() %>/assets/image/delete.png"> 
                    </button>
                </a>
                    
            </td>
          </tr>
        <% } %>
        </tbody>
    </table>
</div>
<!-- Modal modif start -->
<div class="modal fade" id="modalModif" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifier Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form class="p-3 border-1"  method="post" action="ModifLoginRegion" >
            <div class="modal-body">
                <input type="hidden" id="idUser" name="idUser" value="">
                <input type="hidden" id="idRegion" name="idRegion" value="">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" value="">
                </div>
                <div class="form-group">
                    <label for="login">Login</label>
                    <input type="text" class="form-control" id="login" name="login" value="">
                </div>
                <div class="form-group">
                    <label for="mdp">Mot de passe</label>
                    <input type="text" class="form-control" id="mdp" name="mdp">
                </div>

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


