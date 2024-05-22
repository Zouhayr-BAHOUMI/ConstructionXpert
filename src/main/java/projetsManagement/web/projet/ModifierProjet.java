package projetsManagement.web.projet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.ProjetDao;
import projetsManagement.model.Projet;

import java.io.IOException;

@WebServlet(name = "modifierProjet", urlPatterns = {"/modifierProjet"})
public class ModifierProjet extends HttpServlet {

    private ProjetDao projetdao;

    public ModifierProjet(){
        super();
        projetdao = new ProjetDao();
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Projet projet = new Projet();

        projet.setNom_projet(req.getParameter("nomProjet"));
        projet.setDescription(req.getParameter("description"));
        projet.setDate_debut(req.getParameter("date_debut"));
        projet.setDate_fin(req.getParameter("date_fin"));
        projet.setBudget(Float.parseFloat(req.getParameter("budget")));

        projet.setId_projet(Integer.parseInt(req.getParameter("id")));

        if (projetdao.modifierProjet(projet)){
            resp.sendRedirect("index.jsp");
        }
    }
}
