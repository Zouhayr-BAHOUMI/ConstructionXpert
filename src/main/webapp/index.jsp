<%@ page import="projetsManagement.dao.ProjetDao" %>
<%@ page import="java.util.List" %>
<%@ page import="projetsManagement.model.Projet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

  <!--  bootstrap -->
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
  <!--  end bootstrap -->

  <!--  font awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!--  end font awesome -->

  <link rel="stylesheet" type="text/css" href="css/main.css">
  <title>Projet Management</title>
</head>
<body>

<nav class="navbar navbar-light bg-light mb-5 mt-4">
  <div class="container">
    <a href="" style=" color:green; text-decoration:none; " > <h3><i class="fa-solid fa-helmet-safety"></i>ConstructionXpert</h3> </a>


    <div class="col-md-3 mr-6" >
      <a href="login.jsp" class="btn btn-success">login</a>
      <a href="Register.jsp" class="btn btn-primary text-white">register</a>
    </div>
  </div>
</nav>




    <div class="container py-5">
        <h1 class="text-center"> List Projects </h1>

        <div class="row row-cols-1 row-cols-md-3 g-4 py-5 ">

            <%
                ProjetDao projetdao = new ProjetDao();
                List<Projet> listProjet = projetdao.afficherProjets();
                System.out.println("Number of projects: " + listProjet.size());
                for (Projet projet : listProjet){
            %>

            <div class="col">
              <div class="card" style="width: 18rem; ">

                <div class="d-flex justify-content-around ">
                      <div class="card-body">
                        <h5 class="card-title mt-2">P<%=projet.getNom_projet() %></h5>
                        <p class="card-text mt-2 "><%=projet.getDescription() %></p>
                          <ul class="list-group list-group-flush">
                              <li class="list-group-item"><%=projet.getDate_debut() %></li>
                              <li class="list-group-item"><%=projet.getDate_fin() %></li>
                          </ul>

                      </div>
                      <h4 class="dollar" STYLE="margin-top: 1.5rem; margin-right: 1rem" ><%=projet.getBudget() %> $</h4>
                </div>

                  <div class="card-body d-flex justify-content-around ">
                      <a href="modifierProjet.jsp?id=<%= projet.getId_projet()%>" class="btn btn-success">Edit</a>
                      <a href="supprimerProjet?id=<%= projet.getId_projet()%>" class="btn btn-outline-success ">Delete</a>
                      <a href="Register.jsp" class="btn btn-info text-white">Taches</a>
                  </div>

              </div>
            </div>

            <% } %>
        </div>
    </div>

<%--
      <%
        ProjetDao projetdao = new ProjetDao();
        List<Projet> listProjet = projetdao.afficherProjets();
        System.out.println("Number of projects: " + listProjet.size());
        for (Projet projet : listProjet){
      %>
<div class="card" style="width: 18rem; flex-direction: row; max-width: 30em;">
  <div class="card-body">
    <h5 class="card-title"> <%=projet.getNom_projet() %> </h5>
    <p class="card-text"><%=projet.getDescription() %></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><%=projet.getDate_debut() %></li>
    <li class="list-group-item"><%=projet.getDate_fin() %></li>
    <li class="list-group-item"><%=projet.getBudget() %></li>
  </ul>
&lt;%&ndash;  <div class="card-body">
    <a href="modifierProjet.jsp?id=<%= projet.getId_projet()%>" class="card-link">Edit</a>
    <a href="supprimerProjet?id=<%= projet.getId_projet()%>" class="card-link">Delete</a>
  </div>&ndash;%&gt;
</div>

    <% } %>--%>


  <script src="js/main.js"></script>
</body>
</html>