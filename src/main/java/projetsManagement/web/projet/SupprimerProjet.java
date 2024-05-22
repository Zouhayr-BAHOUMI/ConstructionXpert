package projetsManagement.web.projet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.ProjetDao;

import java.io.IOException;


@WebServlet(name = "supprimerProjet", urlPatterns = {"/supprimerProjet"})
public class SupprimerProjet extends HttpServlet {

    private ProjetDao projetdao;

    public SupprimerProjet(){
        super();
        projetdao = new ProjetDao();
    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int id = Integer.parseInt(req.getParameter("id"));

            if (projetdao.supprimerProjet(id)){
                resp.sendRedirect("index.jsp");
            }
    }
}
