package TADSBD.Usuarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDAO {
    
    private String url = "jdbc:postgresql://10.0.1.10:5432/progweb";
    private String usuario = "giordanolima";
    private String senha = "123giordano";
    private Connection conn;

    public UsuariosDAO() {
        try {
            Class.forName("org.postgresql.Driver").newInstance();
            this.conn = DriverManager.getConnection(this.url, this.usuario, this.senha);
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        } catch (Exception e) {
            System.out.println("Problemas ao tentar conectar com o banco de dados: " + e);
        }
    }
    
    public void inserirUsuario(Usuarios usuario) throws SQLException {
        
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "INSERT INTO usuarios (nome, email, senha) VALUES (?,?,?)";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        
        // Setando os valores vindo dentro da instância "bebida" para dentro da consulta SQL
        sql.setString(1, usuario.getNome());
        sql.setString(2, usuario.getEmail());
        sql.setString(3, usuario.getSenha());
        
        sql.execute();
        
        
    }
    
    public Usuarios login(String email, String senha) throws SQLException {
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setString(1, email);
        sql.setString(2, senha);
        ResultSet resultado = sql.executeQuery();
        
        if(!resultado.next()) {
            return null;
        }
        
        Usuarios retorno = new Usuarios();
        retorno.setId(resultado.getInt("id"));
        retorno.setNome(resultado.getString("nome"));
        retorno.setEmail(resultado.getString("email"));
        retorno.setSenha(resultado.getString("senha"));
        return retorno;
        
    }
    
}
