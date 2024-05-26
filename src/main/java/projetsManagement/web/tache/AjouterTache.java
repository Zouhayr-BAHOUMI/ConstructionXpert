package projetsManagement.web.tache;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.TacheDao;
import projetsManagement.model.Projet;
import projetsManagement.model.Tache;

import java.io.IOException;


@WebServlet(name = "ajouterTache", urlPatterns = {"/ajouterTache"})
public class AjouterTache extends HttpServlet {


    private TacheDao tachedao;

    public AjouterTache(){
        super();
        tachedao = new TacheDao();
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Tache tache = new Tache();

        tache.setDescription(req.getParameter("description"));
        tache.setDate_debut(req.getParameter("date_debut"));
        tache.setDate_fin(req.getParameter("date_fin"));
        tache.setStatus(req.getParameter("status"));

        int id_projet = Integer.parseInt(req.getParameter("id_projet"));
        tache.setId_projet(id_projet);

        if (tachedao.ajouterTache(tache)){
            resp.sendRedirect(req.getContextPath() + "/taches/index.jsp?id=" +id_projet);
        }
    }
}
