package projetsManagement.web.ressource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.RessourceDao;
import projetsManagement.web.tache.SupprimerTache;

import java.io.IOException;


@WebServlet(name = "supprimerRessource", urlPatterns = {"/supprimerRessource"})
public class SupprimerRessource extends HttpServlet {

    RessourceDao ressourcedao;

    public SupprimerRessource(){
        super();
        ressourcedao = new RessourceDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("idRes"));
        if (ressourcedao.supprimerRessource(id)){
            response.sendRedirect("index.jsp");
        }
    }
}
