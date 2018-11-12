package TADSBD.Marcas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MarcasDAO {

    private String url = "jdbc:postgresql://10.0.1.10:5432/progweb";
    private String usuario = "giordanolima";
    private String senha = "123giordano";
    private Connection conn;

    public MarcasDAO() {
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
    
    public ArrayList<Marcas> buscarMarcas() throws SQLException {
        
        // Criei a consulta SQL que será executada no banco
        String sql = "SELECT * FROM marcas";
        
        // Criei a instância do objeto para executar o comando
        PreparedStatement consulta = this.conn.prepareStatement(sql);
        
        // Executando o comando e armazenando o resultado
        // em uma variável da classe ResultSet
        ResultSet resultado = consulta.executeQuery();
        ArrayList<Marcas> retorno = new ArrayList<Marcas>();
        while(resultado.next()) {
            
            int id = resultado.getInt("id");
            String nome = resultado.getString("nome");
            
            Marcas marca =  new Marcas();
            marca.setId(id);
            marca.setNome(nome);
            
            retorno.add(marca);
            
        }
        return retorno;
    }

    public void inserirMarca(Marcas marca) throws SQLException {
        
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "INSERT INTO marcas (nome) VALUES (?)";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        
        // Setando os valores vindo dentro da instância "marca" para dentro da consulta SQL
        sql.setString(1, marca.getNome());
        sql.execute();
        
    }
    
    public Marcas getById(int id) throws SQLException {
        
        String consulta = "SELECT * FROM marcas WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        ResultSet resultado = sql.executeQuery();
        resultado.next();
        
        String nome = resultado.getString("nome");
        Marcas retorno = new Marcas();
        retorno.setId(id);
        retorno.setNome(nome);
        
        return retorno;
    }

    public void editarMarca(Marcas marca) throws SQLException {
        
        String consulta = "UPDATE marcas SET nome = ? WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setString(1, marca.getNome());
        sql.setInt(2, marca.getId());
        sql.execute();
        
    }

    public void excluirMarca(int id) throws SQLException {
        String consulta = "DELETE FROM marcas WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        sql.execute();
    }
    
}
