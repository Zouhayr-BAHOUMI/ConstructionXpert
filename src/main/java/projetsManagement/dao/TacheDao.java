package projetsManagement.dao;

import projetsManagement.db.dbConnection;
import projetsManagement.model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
