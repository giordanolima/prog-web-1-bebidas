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

}
