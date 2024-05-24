<%@ page import="projetsManagement.dao.ProjetDao" %>
<%@ page import="java.util.List" %>
<%@ page import="projetsManagement.model.Projet" %>
<%@ page import="projetsManagement.dao.TacheDao" %>
<%@ page import="projetsManagement.model.Tache" %>
<%@ page import="projetsManagement.dao.RessourceDao" %>
<%@ page import="projetsManagement.model.Ressource" %>
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

<div class="container">
    <div class="row justify-content-center mt-4">
        <div class="col-md-10 d-flex justify-content-end">
            <a href="ajouterRessource.jsp?idTache=<%= request.getParameter("idTache") %>" class="btn btn-dark">Create</a>
        </div>
    </div>



    <div class="row d-flex justify-content-center">
        <div class="col-md-10">
            <div class="card borde-0 shadow-lg my-4">
                <div class="card-header bg-dark">
                    <h3 class="text-white"> Ressources</h3>
                </div>

                <%

                    int id = Integer.parseInt(request.getParameter("idTache"));
                    RessourceDao ressourcedao = new RessourceDao();
                    List<Ressource> listRessources = ressourcedao.afficherRessourceByTacheId(id);
                    System.out.println("Number of projects: " + listRessources.size());
                    for (Ressource ressource : listRessources){
                %>

                <div class="card-body">
                    <table class="table">
                        <tr>
                            <th>Nom</th>
                            <th>Type</th>
                            <th>Quantity</th>
                            <th>Nom Fornisseur</th>
                            <th>Contact Fornisseur</th>
                            <th>Action</th>
                        </tr>

                        <tr>
                            <td><%=ressource.getNom_ressource() %></td>
                            <td><%=ressource.getType_ressource() %></td>
                            <td><%=ressource.getQuantite() %></td>
                            <td><%=ressource.getNom_fournisseur() %></td>
                            <td><%=ressource.getContact_fournisseur()%></td>
                            <td>
                                <a href="" class="btn btn-dark">Edit</a>
                                <a href="" class="btn btn-danger">Delete</a>
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