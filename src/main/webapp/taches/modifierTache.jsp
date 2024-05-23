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

<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-md-10">
            <div class="card borde-0 shadow-lg my-4">
                <div class="card-header bg-dark">
                    <h3 class="text-white" >Modifier Tache</h3>
                </div>

                <%
                    int idTache = Integer.parseInt(request.getParameter("idTache"));
                    TacheDao tacheDao = new TacheDao();
                    Tache tache = tacheDao.afficherTacheById(idTache);
                %>

                <form action="../modifierTache" method="post">
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="description" cols="30" rows="5" ><%= tache.getDescription() %></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Date debut</label>
                            <input type="date" class="form-control" name="date_debut" id="date_debut" value="<%= tache.getDate_debut() %>"  required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Date fin</label>
                            <input type="date" class="form-control" name="date_fin" id="date_fin"  value="<%= tache.getDate_fin() %>"  required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" id="status" class="form-control">
                                <option selected>--select--</option>
                                <option value="todo" <%= "todo".equals(tache.getStatus()) ? "selected" : "" %> >A faire</option>
                                <option value="doing" <%= "doing".equals(tache.getStatus()) ? "selected" : "" %> >En progress</option>
                                <option value="done" <%= "done".equals(tache.getStatus()) ? "selected" : "" %> >Terminer</option>
                            </select>
                        </div>

                        <input type="hidden" name="id_projet" value="<%= request.getParameter("id") %>">
                        <input type="hidden" name="id_tache" value="<%= tache.getId_tache()%>">


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
