package projetsManagement.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.*;

import projetsManagement.db.dbConnection;
import projetsManagement.model.Projet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ProjetDao {

    private Connection connection;

    public ProjetDao() {
        connection = dbConnection.getConnection();
    }

    public boolean ajouterProjet(Projet projet) {

        boolean isAdded = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("INSERT INTO Projet(nom_projet,description,date_debut,date_fin,budget)"
             + " VALUES (?, ?, ?, ?, ?)");

            prstmt.setString(1, projet.getNom_projet());
            prstmt.setString(2,projet.getDescription());
            prstmt.setString(3,projet.getDate_debut());
            prstmt.setString(4,projet.getDate_fin());
            prstmt.setFloat(5,projet.getBudget());

            int i = prstmt.executeUpdate();

            if (i == 1){
                isAdded = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAdded;
    }

    public List<Projet> afficherProjets() {
        List<Projet> projets = new ArrayList<Projet>();
        try {
            PreparedStatement prstmt = connection.prepareStatement("SELECT * FROM Projet");
            ResultSet res = prstmt.executeQuery();

            while (res.next()){
                Projet projet = new Projet();
                projet.setId_projet(res.getInt("id_projet"));
                projet.setNom_projet(res.getString("nom_projet"));
                projet.setDescription(res.getString("description"));
                projet.setDate_debut(res.getString("date_debut"));
                projet.setDate_fin(res.getString("date_fin"));
                projet.setBudget(res.getFloat("budget"));

                projets.add(projet);
            }

            System.out.println(projets);

        }catch (SQLException e){
            e.printStackTrace();
        }


        return projets;
    }

    public Projet afficherProjetById(int id) {

        Projet projet = null;

        try {
            PreparedStatement prstmt = connection.prepareStatement("SELECT * FROM Projet where id_projet=? ");
            prstmt.setInt(1, id);
            ResultSet res = prstmt.executeQuery();

            while (res.next()){
                projet = new Projet();
                projet.setId_projet(res.getInt(1));
                projet.setNom_projet(res.getString(2));
                projet.setDescription(res.getString(3));
                projet.setDate_debut(res.getString(4));
                projet.setDate_fin(res.getString(5));
                projet.setBudget(res.getFloat(6));

            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return projet;
    }


    public boolean modifierProjet(Projet projet){
        boolean isUpdated = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("UPDATE Projet SET nom_projet = ? ,description=? ,date_debut=? ,date_fin=? ,budget=? where id_projet=?");

            prstmt.setString(1, projet.getNom_projet());
            prstmt.setString(2,projet.getDescription());
            prstmt.setString(3,projet.getDate_debut());
            prstmt.setString(4,projet.getDate_fin());
            prstmt.setFloat(5,projet.getBudget());
            prstmt.setInt(6,projet.getId_projet());

            int i = prstmt.executeUpdate();

            if (i == 1){
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



        return isUpdated;
    }


    public boolean supprimerProjet(int id){
        boolean isDeleted = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("DELETE from Projet where id_projet=?");
            prstmt.setInt(1,id);

            int i = prstmt.executeUpdate();

            if (i == 1){
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

}
