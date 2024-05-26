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


<section class="bg-light py-3 py-md-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                <div class="card border border-light-subtle rounded-3 shadow-sm">
                    <div class="card-body p-3 p-md-4 p-xl-5">
                        <h3 class="text-center mb-4">Ajouter Un projet</h3>
                        <form action="ajouterProjet"  method="post">
                            <div class="row gy-2 overflow-hidden">

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="nomProjet" id="nomProjet" placeholder="nom projet" required>
                                        <label for="nomProjet" class="form-label">Nom de Projet</label>
                                        <span id="error" style="color: red;"> </span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="description" id="description" placeholder="Entrer description" required>
                                        <label for="description" class="form-label">Description</label>
                                        <span id="errorDES" style="color: red;"> </span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" name="date_debut" id="date_debut"  required>
                                        <label for="date_debut" class="form-label">Date Debut</label>
                                        <span id="errorD" style="color: red;"> </span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="date" class="form-control" name="date_fin" id="date_fin"  required>
                                        <label for="date_fin" class="form-label">Date Fin</label>
                                        <span id="errorF" style="color: red;"> </span>
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">$</span>
                                    <input type="text" class="form-control" name="budget" id="budget" aria-label="Amount (to the nearest dollar)">
                                    <span id="errorB" style="color: red;"> </span>
                                </div>

                                <div class="col-12">
                                    <div class="d-grid my-3">
                                        <button class="btn btn-primary btn-lg" type="submit">Enregistrer</button>
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


<script >

    function validerNom() {
    let projetNom = document.getElementById("nomProjet").value;
    let error = document.getElementById("error");
    if (projetNom === "") {
        error.textContent = "Champ requis";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function validerDescription() {
    let description = document.getElementById("description").value;
    let error = document.getElementById("errorDES");
    if (description === "") {
        error.textContent = "Champ requis";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function validerDateDebut() {
    let dateDebut = document.getElementById("date_debut").value;
    let error = document.getElementById("errorD");
    if (dateDebut === "") {
        error.textContent = "Champ requis";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function validerDateFin() {
    let dateFin = document.getElementById("date_fin").value;
    let dateDebut = document.getElementById("date_debut").value;
    let error = document.getElementById("errorF");
    if (dateFin === "") {
        error.textContent = "Champ requis";
        return false;
    } else if (new Date(dateFin) <= new Date(dateDebut)) {
        error.textContent = "Date fin doit être après date début";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function validerBudget() {
    let budget = document.getElementById("budget").value;
    let error = document.getElementById("errorB");
    if (budget === "" || isNaN(budget)) {
        error.textContent = "Champ requis et doit être un nombre";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

    window.onload = function() {
        document.getElementById("nomProjet").addEventListener("blur", validerNom);
        document.getElementById("description").addEventListener("blur", validerDescription);
        document.getElementById("date_debut").addEventListener("blur", validerDateDebut);
        document.getElementById("date_fin").addEventListener("blur", validerDateFin);
        document.getElementById("budget").addEventListener("blur", validerBudget);
    };

</script>
</body>
</html>