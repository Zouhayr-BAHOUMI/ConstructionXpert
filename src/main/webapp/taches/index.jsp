<%@ page import="projetsManagement.dao.ProjetDao" %>
<%@ page import="java.util.List" %>
<%@ page import="projetsManagement.model.Projet" %>
<%@ page import="projetsManagement.dao.TacheDao" %>
<%@ page import="projetsManagement.model.Tache" %>
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

    <div class="container">
        <div class="row justify-content-center mt-4">
            <div class="col-md-10 d-flex justify-content-end">
                <a href="ajouterTache.jsp?id=<%= request.getParameter("id") %>" class="btn btn-dark">Create</a>
            </div>
        </div>



        <div class="row d-flex justify-content-center">
            <div class="col-md-10">
                <div class="card borde-0 shadow-lg my-4">
                    <div class="card-header bg-dark">
                        <h3 class="text-white"> Taches</h3>
                    </div>

                    <%

                        int id = Integer.parseInt(request.getParameter("id"));
                        TacheDao tachedao = new TacheDao();
                        List<Tache> listTache = tachedao.afficherTachesByProjetId(id);
                        System.out.println("Number of projects: " + listTache.size());
                        for (Tache tache : listTache){
                    %>

                    <div class="card-body">
                        <table class="table">
                            <tr>
                                <th>Description</th>
                                <th>Date debut</th>
                                <th>Date fin</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>

                            <tr>
                                <td><%=tache.getDescription() %></td>
                                <td><%=tache.getDate_debut() %></td>
                                <td><%=tache.getDate_fin()%></td>
                                <td><%=tache.getStatus()%></td>
                                <td>
                                    <a href="modifierTache.jsp?idTache=<%=tache.getId_tache()%>" class="btn btn-dark">Edit</a>
                                    <a href="../supprimerTache?idTache=<%=tache.getId_tache()%>" class="btn btn-danger">Delete</a>
                                    <a href="../ressources/index.jsp?idTache=<%=tache.getId_tache()%>" class="btn btn-dark">show ressources</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

<script src="js/main.js"></script>
</body>
</html>