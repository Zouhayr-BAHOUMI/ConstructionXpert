package projetsManagement.web.projet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.ProjetDao;
import projetsManagement.model.Projet;

import java.io.IOException;

@WebServlet(name = "ajouterProjet", urlPatterns = {"/ajouterProjet"})
public class AjouterProjet extends HttpServlet {

    private ProjetDao projetdao;

    public AjouterProjet(){
        super();
        projetdao = new ProjetDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Projet projet = new Projet();

        projet.setNom_projet(req.getParameter("nomProjet"));
        projet.setDescription(req.getParameter("description"));
        projet.setDate_debut(req.getParameter("date_debut"));
        projet.setDate_fin(req.getParameter("date_fin"));
        projet.setBudget(Float.parseFloat(req.getParameter("budget")));

        if (projetdao.ajouterProjet(projet)){
            resp.sendRedirect("index.jsp");
        }
    }
}
