package projetsManagement.web.projet;

import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import projetsManagement.dao.ProjetDao;
import projetsManagement.dao.RessourceDao;
import projetsManagement.dao.TacheDao;
import projetsManagement.model.Projet;
import projetsManagement.model.Ressource;
import projetsManagement.model.Tache;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "generatePdf", urlPatterns = {"/generatePdf"})
public class GeneratePdf extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int projetId = Integer.parseInt(req.getParameter("id"));


        ProjetDao projetdao = new ProjetDao();
        Projet projet = projetdao.afficherProjetById(projetId);

        TacheDao tachedao = new TacheDao();
        List<Tache> taches =tachedao.afficherTachesByProjetId(projetId);

        String projetNom = projet.getNom_projet();

        resp.setContentType("application/pdf");
        resp.setHeader("Content-Disposition", "attachment; filename=" + projetNom + ".pdf");

        PdfWriter pdfWriter = new PdfWriter(resp.getOutputStream());
        com.itextpdf.kernel.pdf.PdfDocument pdfDocument = new com.itextpdf.kernel.pdf.PdfDocument(pdfWriter);
        Document document = new Document(pdfDocument);

        document.add(new Paragraph("Nom du projet: " + projet.getNom_projet()));
        document.add(new Paragraph("Description: " + projet.getDescription()));
        document.add(new Paragraph("La date debut: " + projet.getDate_debut()));
        document.add(new Paragraph("La date fin" + projet.getDate_fin()));

        document.add(new Paragraph("Taches de ce projet:"));

        for (Tache tache : taches){
            document.add(new Paragraph("Tache description: " + tache.getDescription()));
            document.add(new Paragraph("La date debut: " + tache.getDate_debut()));
            document.add(new Paragraph("La date debut: " + tache.getDate_fin()));
            document.add(new Paragraph("Status: " + tache.getStatus()));

            RessourceDao ressourcedao = new RessourceDao();
            List<Ressource> ressources = ressourcedao.afficherRessourceByTacheId(tache.getId_tache());

            document.add(new Paragraph("Resources pour chaque tache:"));
            for (Ressource ressource : ressources){
                document.add(new Paragraph("Nom resource : " + ressource.getNom_ressource()));
                document.add(new Paragraph("Type: " + ressource.getType_ressource()));
                document.add(new Paragraph("Quantity: " + ressource.getQuantite()));
                document.add(new Paragraph("Fournisseur: " + ressource.getNom_fournisseur()));
                document.add(new Paragraph("Contact de Fournisseur: " + ressource.getContact_fournisseur()));
                document.add(new Paragraph("Address de Fournisseur: " + ressource.getAdresse()));
            }
        }
        document.close();
    }


}
