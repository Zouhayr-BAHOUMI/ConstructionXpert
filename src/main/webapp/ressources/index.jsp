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

        <style>
            .resource-container {
                background-color: #f8f9fa;
                border-radius: 8px;
            }

            .resource-header {
                border-bottom: 1px solid #dee2e6;
            }

            .resource-body {
                background-color: transparent;
            }

            .resource-card {
                background-color: #fff;
                border-radius: 8px;
                padding: 16px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .resource-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .resource-title {
                font-size: 18px;
                font-weight: 500;
                margin-bottom: 8px;
            }

            .resource-type-badge {
                font-size: 14px;
                color: #465562;
                background-color: #D3E5EF;
                padding: 4px 8px;
                border-radius: 4px;
                margin-bottom: 8px;
                display: inline-block;
            }

            .resource-quantity,
            .resource-supplier,
            .resource-contact {
                font-size: 14px;
                margin-bottom: 4px;
            }

            .resource-actions {
                display: flex;
                justify-content: flex-end;
                margin-top: 12px;
            }

            .resource-actions .btn {
                margin-left: 8px;
            }

            .fa-sm {
                font-size: 0.8rem;
            }
        </style>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="../index.jsp" style="color: #ffc107; font-weight: bold;">
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
            <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-12">
                    <div class="resource-container my-4">
                        <div class="resource-header py-3 px-4 d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">Resources</h3>
                            <a href="ajouterRessource.jsp?idTache=<%= request.getParameter("idTache") %>" class="btn btn-dark btn-sm">
                                <i class="fas fa-plus fa-sm"></i>
                            </a>
                        </div>

                        <div class="resource-body px-4 py-3">
                            <div class="row">
                                <%
                                    int id = Integer.parseInt(request.getParameter("idTache"));
                                    RessourceDao ressourcedao = new RessourceDao();
                                    List<Ressource> listRessources = ressourcedao.afficherRessourceByTacheId(id);
                                    System.out.println("Number of resources: " + listRessources.size());
                                    for (Ressource ressource : listRessources) {
                                %>
                                <div class="col-md-6 col-lg-4 mb-4">
                                    <div class="resource-card">
                                        <div class="resource-info">
                                            <h5 class="resource-title"><%= ressource.getNom_ressource() %></h5>
                                            <span class="resource-type-badge"><%= ressource.getType_ressource() %></span>
                                            <p class="resource-quantity">Quantity: <%= ressource.getQuantite() %></p>
                                            <p class="resource-supplier">Supplier: <%= ressource.getNom_fournisseur() %></p>
                                            <p class="resource-contact">Contact: <%= ressource.getContact_fournisseur() %></p>
                                        </div>
                                        <div class="resource-actions">
                                            <a href="modifierRessource.jsp?idRes=<%=ressource.getId_ressource()%>" class="btn btn-dark btn-sm"><i class="fas fa-edit"></i></a>
                                            <a href="../supprimerRessource?idRes=<%=ressource.getId_ressource()%>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a>
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

<script src="js/main.js"></script>
</body>
</html>