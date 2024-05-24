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

  <link rel="stylesheet" type="text/css" href="">
  <title>Projet Management</title>
</head>
<body>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#" style="color: #ffc107; font-weight: bold;">
            <i class="fa-solid fa-helmet-safety"></i> ConstructionXpert
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Register.jsp">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>




<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-5">
        <h1 class="text-center mb-0">List Projects</h1>
        <a href="ajouterProjet.jsp" class="btn btn-warning text-dark" style="color: #212529;"><i class="fas fa-plus mr-2"></i>Add Project</a>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% ProjetDao projetdao = new ProjetDao();
            List<Projet> listProjet = projetdao.afficherProjets();
            System.out.println("Number of projects: " + listProjet.size());
            for (Projet projet : listProjet) { %>
        <div class="col mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title mb-3"><%=projet.getNom_projet()%></h5>
                    <p class="card-text"><%=projet.getDescription()%></p>
                    <ul class="list-group list-group-flush mb-3">
                        <li class="list-group-item">Start Date: <%=projet.getDate_debut()%></li>
                        <li class="list-group-item">End Date: <%=projet.getDate_fin()%></li>
                    </ul>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="dollar mb-0"><span class="dollar-sign" >$</span><%=projet.getBudget()%></h4>
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="modifierProjet.jsp?id=<%=projet.getId_projet()%>" class="btn btn-sm btn-success px-3">Edit</a>
                        <a href="supprimerProjet?id=<%=projet.getId_projet()%>" class="btn btn-sm btn-outline-danger px-3">Delete</a>
                        <a href="taches/index.jsp?id=<%=projet.getId_projet()%>" class="btn btn-sm btn-info text-white px-3">Tasks</a>
                    </div>
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