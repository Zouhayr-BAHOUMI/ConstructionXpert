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

<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-10">
            <div class="card borde-0 shadow-lg my-4">
                <div class="card-header bg-dark">
                    <h3 class="text-white" >Create Ressource</h3>
                </div>
                <form action="../ajouterRessource" method="post">
                    <div class="card-body">

                        <div class="mb-3">
                            <label class="form-label">Nom ressource</label>
                            <input type="text" class="form-control" name="nomRessource" id="nomRessource" placeholder="nom ressource" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Type de ressource</label>
                            <select name="typeRessource" id="typeRessource" class="form-control">
                                <option selected>--Select--</option>
                                <option value="materiel">Matériel</option>
                                <option value="humain">Humain</option>
                                <option value="financier">Financier</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Quantité</label>
                            <input type="number" class="form-control" name="quantite" id="quantite" placeholder="Quantité" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Nom fournisseur</label>
                            <input type="text" class="form-control" name="nomFournisseur" id="nomFournisseur" placeholder="Nom Fournisseur" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Contact fournisseur</label>
                            <input type="text" class="form-control" name="contactFournisseur" id="contactFournisseur" placeholder="Contact Fournisseur" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Adresse fournisseur</label>
                            <input type="text" class="form-control" name="adresseFournisseur" id="adresseFournisseur" placeholder="Adresse Fournisseur" required>
                        </div>



                        <input type="hidden" name="id_tache" value="<%= request.getParameter("idTache") %>">


                        <div class="d-grid my-3">
                            <button class="btn btn-primary btn-lg" type="submit">Enregistrer</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
