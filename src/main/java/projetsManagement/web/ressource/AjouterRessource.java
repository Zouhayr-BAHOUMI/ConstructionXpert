package projetsManagement.web.ressource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.RessourceDao;
import projetsManagement.model.Ressource;
import projetsManagement.model.Tache;

import java.io.IOException;


@WebServlet(name = "ajouterRessource", urlPatterns = {"/ajouterRessource"})
public class AjouterRessource extends HttpServlet {

    private RessourceDao ressourcedao;

    public AjouterRessource(){
        super();
        ressourcedao = new RessourceDao();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Ressource ressource = new Ressource();


        ressource.setNom_ressource(req.getParameter("nomRessource"));
        ressource.setType_ressource(req.getParameter("typeRessource"));
        ressource.setQuantite(Float.parseFloat(req.getParameter("quantite")));
        ressource.setNom_fournisseur(req.getParameter("nomFournisseur"));
        ressource.setContact_fournisseur(req.getParameter("contactFournisseur"));
        ressource.setAdresse(req.getParameter("adresseFournisseur"));

        ressource.setId_tache(Integer.parseInt(req.getParameter("id_tache")));

        if (ressourcedao.ajouterRessource(ressource)){
            resp.sendRedirect(req.getContextPath() + "/ressources/index.jsp");
        }
    }
}
