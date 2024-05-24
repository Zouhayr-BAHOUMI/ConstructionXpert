package projetsManagement.dao;

import projetsManagement.db.dbConnection;
import projetsManagement.model.Projet;
import projetsManagement.model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TacheDao {

    private Connection connection;

    public TacheDao(){
        connection = dbConnection.getConnection();
    }

    public boolean ajouterTache(Tache tache){

        boolean isAdded = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("INSERT INTO Tache(description,date_debut,date_fin,status,id_projet)"
                    + " VALUES (?, ?, ?, ?,?)");

            prstmt.setString(1,tache.getDescription());
            prstmt.setString(2,tache.getDate_debut());
            prstmt.setString(3,tache.getDate_fin());
            prstmt.setString(4,tache.getStatus());
            prstmt.setInt(5,tache.getId_projet());

            int i = prstmt.executeUpdate();

            if (i == 1){
                isAdded = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return  isAdded;
    }


    public Tache afficherTacheById(int id) {

        Tache tache = null;

        try {
            PreparedStatement prstmt = connection.prepareStatement("SELECT * FROM Tache where id_tache=? ");
            prstmt.setInt(1, id);
            ResultSet res = prstmt.executeQuery();

            while (res.next()){
                tache = new Tache();
                tache.setId_tache(res.getInt(1));
                tache.setDescription(res.getString(2));
                tache.setDate_debut(res.getString(3));
                tache.setDate_fin(res.getString(4));
                tache.setStatus(res.getString(5));
                tache.setId_projet(res.getInt(6));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return tache;
    }

    public List<Tache> afficherTachesByProjetId(int id) {

        List<Tache> taches = new ArrayList<Tache>();
        try {
            PreparedStatement prstmt = connection.prepareStatement("SELECT * FROM Tache WHERE id_projet = ?");
            prstmt.setInt(1,id);
            ResultSet res = prstmt.executeQuery();

            while (res.next()){
                Tache tache = new Tache();
                tache.setId_tache(res.getInt("id_tache"));
                tache.setDescription(res.getString("description"));
                tache.setDate_debut(res.getString("date_debut"));
                tache.setDate_fin(res.getString("date_fin"));
                tache.setStatus(res.getString("status"));
                tache.setId_projet(res.getInt("id_projet"));
                taches.add(tache);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }


        return taches;
    }


    public boolean modifierTache(Tache tache){
        boolean isUpdated = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("UPDATE Tache SET description = ?, date_debut = ?, date_fin = ?, status = ? WHERE id_tache = ?");

            prstmt.setString(1,tache.getDescription());
            prstmt.setString(2,tache.getDate_debut());
            prstmt.setString(3,tache.getDate_fin());
            prstmt.setString(4,tache.getStatus());
            prstmt.setInt(5,tache.getId_tache());

            int i = prstmt.executeUpdate();

            if (i == 1){
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    public boolean supprimerTache(int id){
        boolean isDeleted = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("DELETE from Tache where id_tache=?");
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
