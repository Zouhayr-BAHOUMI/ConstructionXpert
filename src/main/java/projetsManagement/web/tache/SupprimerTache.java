package projetsManagement.web.tache;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.TacheDao;

import java.io.IOException;

@WebServlet(name = "supprimerTache", urlPatterns = {"/supprimerTache"})
public class SupprimerTache extends HttpServlet {

    private TacheDao tachedao;

    public SupprimerTache() {
        super();
        tachedao = new TacheDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("idTache"));
        if (tachedao.supprimerTache(id)){
            response.sendRedirect("index.jsp");
        }
    }
}
