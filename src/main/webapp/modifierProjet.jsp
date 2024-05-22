<%@ page import="projetsManagement.dao.ProjetDao" %>
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
        <a href="" style=" color:green; text-decoration:none; " > <h3><i class="fa-solid fa-helmet-safety"></i> ConstructionXpert Services </h3> </a>


        <div class="col-md-3 mr-6" >
            <a href="login.jsp" class="btn btn-success">login</a>
            <a href="Register.jsp" class="btn btn-primary text-white">register</a>
        </div>
    </div>
</nav>


<section class="bg-light py-3 py-md-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                <div class="card border border-light-subtle rounded-3 shadow-sm">
                    <div class="card-body p-3 p-md-4 p-xl-5">
                        <h3 class="text-center mb-4">Modifier les Infos de projet</h3>

                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            ProjetDao projetdao = new ProjetDao();
                            Projet projet = projetdao.afficherProjetById(id);
                        %>

                        <form action="modifierProjet"  method="post">
                            <div class="row gy-2 overflow-hidden">

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="nomProjet" id="nomProjet" placeholder="nom projet" value="<%= projet.getNom_projet() %>" required>
                                        <label for="nomProjet" class="form-label">Nom de Projet</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="description" id="description" placeholder="Entrer description" value="<%= projet.getDescription() %>"  required>
                                        <label for="description" class="form-label">Description</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" name="date_debut" id="date_debut" value="<%= projet.getDate_debut() %>"  required>
                                        <label for="date_debut" class="form-label">Date Debut</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" name="date_fin" id="date_fin"  value="<%= projet.getDate_fin() %>"  required>
                                        <label for="date_fin" class="form-label">Date Fin</label>
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control" name="budget" id="budget" value="<%= projet.getBudget() %>"  aria-label="Amount (to the nearest dollar)">
                                </div>

                                <input type="hidden" name="id" value="<%= projet.getId_projet()%>">

                                <div class="col-12">
                                    <div class="d-grid my-3">
                                        <button class="btn btn-primary btn-lg" type="submit">Modifier</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script src="js/main.js"></script>
</body>
</html>