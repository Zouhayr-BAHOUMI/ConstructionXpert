package projetsManagement.dao;

import projetsManagement.db.dbConnection;
import projetsManagement.model.Ressource;
import projetsManagement.model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
