package TADSBD.Bebidas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BebidasDAO {

    private String url = "jdbc:postgresql://10.0.1.10:5432/progweb";
    private String usuario = "giordanolima";
    private String senha = "123giordano";
    private Connection conn;

    public BebidasDAO() {
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

    public ArrayList<Bebidas> buscarBebidas() throws SQLException {
        
        // Criei a consulta SQL que será executada no banco
        String sql = "SELECT * FROM bebidas";
        
        // Criei a instância do objeto para executar o comando
        PreparedStatement consulta = this.conn.prepareStatement(sql);
        
        // Executando o comando e armazenando o resultado
        // em uma variável da classe ResultSet
        ResultSet resultado = consulta.executeQuery();
        ArrayList<Bebidas> retorno = new ArrayList<Bebidas>();
        while(resultado.next()) {
            
            int id = resultado.getInt("id");
            String nome = resultado.getString("nome");
            String categoria = resultado.getString("categoria");
            float valor = resultado.getFloat("valor");
            
            Bebidas bebida =  new Bebidas();
            bebida.setId(id);
            bebida.setNome(nome);
            bebida.setCategoria(categoria);
            bebida.setValor(valor);
            
            retorno.add(bebida);
            
        }
        return retorno;
    }

    public void inserirBebida(Bebidas bebida) throws SQLException {
        
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "INSERT INTO bebidas (nome, categoria, valor) VALUES (?,?,?)";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        
        // Setando os valores vindo dentro da instância "bebida" para dentro da consulta SQL
        sql.setString(1, bebida.getNome());
        sql.setString(2, bebida.getCategoria());
        sql.setFloat(3, bebida.getValor());
        
        sql.execute();
        
        
    }
    
    public Bebidas getById(int id) throws SQLException {
        
        String consulta = "SELECT * FROM bebidas WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        ResultSet resultado = sql.executeQuery();
        resultado.next();
        
        String nome = resultado.getString("nome");
        String categoria = resultado.getString("categoria");
        float valor = resultado.getFloat("valor");
        
        Bebidas retorno = new Bebidas();
        retorno.setId(id);
        retorno.setNome(nome);
        retorno.setCategoria(categoria);
        retorno.setValor(valor);
        
        return retorno;
    }

    public void editarBebida(Bebidas bebida) throws SQLException {
        
        String consulta = "UPDATE bebidas SET nome = ?, categoria = ?, valor = ? WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setString(1, bebida.getNome());
        sql.setString(2, bebida.getCategoria());
        sql.setFloat(3, bebida.getValor());
        sql.setInt(4, bebida.getId());
        sql.execute();
        
    }

    public void excluirBebida(int id) throws SQLException {
        String consulta = "DELETE FROM bebidas WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        sql.execute();
    }
}
