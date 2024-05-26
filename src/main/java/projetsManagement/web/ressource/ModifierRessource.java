package projetsManagement.web.ressource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.RessourceDao;
import projetsManagement.model.Ressource;


import java.io.IOException;

@WebServlet(name = "modifierRessource", urlPatterns = {"/modifierRessource"})
public class ModifierRessource extends HttpServlet {

    private RessourceDao ressourcedao;

    public ModifierRessource(){
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


        ressource.setId_ressource(Integer.parseInt(req.getParameter("id_ressource")));

        if (ressourcedao.modifierRessource(ressource)){
            String tacheId = req.getParameter("idTache");
            resp.sendRedirect(req.getContextPath() + "/ressources/index.jsp?id=" + tacheId);
        }
    }
}
