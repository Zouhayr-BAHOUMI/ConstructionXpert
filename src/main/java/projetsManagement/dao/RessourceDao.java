package projetsManagement.dao;

import projetsManagement.db.dbConnection;
import projetsManagement.model.Ressource;
import projetsManagement.model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RessourceDao {

    private Connection connection;

    public RessourceDao(){
        connection = dbConnection.getConnection();
    }

    public boolean ajouterRessource(Ressource ressource){

        boolean isAdded = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("INSERT INTO Ressource (nom_ressource, type_ressource, quantite, nom_fournisseur, contact_fournisseur, adresse, id_tache)"
                    + " VALUES (?, ?, ?, ?,?,?,?)");

            prstmt.setString(1,ressource.getNom_ressource());
            prstmt.setString(2,ressource.getType_ressource());
            prstmt.setFloat(3,ressource.getQuantite());
            prstmt.setString(4, ressource.getNom_fournisseur());
            prstmt.setString(5, ressource.getContact_fournisseur());
            prstmt.setString(6, ressource.getAdresse());
            prstmt.setInt(7,ressource.getId_tache());

            int i = prstmt.executeUpdate();

            if (i == 1){
                isAdded = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return  isAdded;
    }

    public Ressource afficherRessourceById(int id) {

        Ressource ressource = null;

        try {
            PreparedStatement prstmt = connection.prepareStatement("SELECT * FROM Ressource where id_ressource=?");
            prstmt.setInt(1, id);
            ResultSet res = prstmt.executeQuery();

            while (res.next()){
                ressource = new Ressource();
                System.out.println("ResultSet: id_ressource=" + res.getInt("id_ressource") + ", nom_ressource=" + res.getString("nom_ressource") + ", ...");
                ressource.setId_ressource(res.getInt(1));
                ressource.setNom_ressource(res.getString(2));
                ressource.setType_ressource(res.getString(3));
                ressource.setQuantite(res.getFloat(4));
                ressource.setNom_fournisseur(res.getString(5));
                ressource.setContact_fournisseur(res.getString(6));
                ressource.setAdresse(res.getString(7));
                ressource.setId_tache(res.getInt(8));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return ressource;
    }

    public List<Ressource> afficherRessourceByTacheId(int id) {

        List<Ressource> ressources = new ArrayList<Ressource>();
        try {
            PreparedStatement prstmt = connection.prepareStatement("SELECT * FROM Ressource WHERE id_tache = ?");
            prstmt.setInt(1,id);
            ResultSet res = prstmt.executeQuery();

            while (res.next()){
                Ressource ressource = new Ressource();

                ressource.setId_ressource(res.getInt("id_ressource"));
                ressource.setNom_ressource(res.getString("nom_ressource"));
                ressource.setType_ressource(res.getString("type_ressource"));
                ressource.setQuantite(res.getFloat("quantite"));
                ressource.setNom_fournisseur(res.getString("nom_fournisseur"));
                ressource.setContact_fournisseur(res.getString("contact_fournisseur"));
                ressource.setAdresse(res.getString("adresse"));
                ressource.setId_tache(res.getInt("id_tache"));

                ressources.add(ressource);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }


        return ressources;
    }


    public boolean modifierRessource(Ressource ressource){
        boolean isUpdated = false;

        try {
            PreparedStatement prstmt = connection.prepareStatement("UPDATE Ressource SET nom_ressource = ?, type_ressource = ?, quantite = ?, nom_fournisseur = ? , contact_fournisseur = ? , adresse = ?  WHERE id_ressource = ?");

            prstmt.setString(1,ressource.getNom_ressource());
            prstmt.setString(2,ressource.getType_ressource());
            prstmt.setFloat(3,ressource.getQuantite());
            prstmt.setString(4, ressource.getNom_fournisseur());
            prstmt.setString(5, ressource.getContact_fournisseur());
            prstmt.setString(6, ressource.getAdresse());
            prstmt.setInt(7,ressource.getId_ressource());

            int i = prstmt.executeUpdate();

            if (i == 1){
                isUpdated = true;
            }else {
                System.out.println("Resource update failed.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

}
