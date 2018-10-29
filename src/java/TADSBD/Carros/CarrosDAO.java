package TADSBD.Carros;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarrosDAO {

    private String url = "jdbc:postgresql://10.0.1.10:5432/progweb";
    private String usuario = "giordanolima";
    private String senha = "123giordano";
    private Connection conn;

    public CarrosDAO() {
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
    
    public ArrayList<Carros> buscarCarros() throws SQLException {
        
        // Criei a consulta SQL que será executada no banco
        String sql = "SELECT * FROM carros";
        
        // Criei a instância do objeto para executar o comando
        PreparedStatement consulta = this.conn.prepareStatement(sql);
        
        // Executando o comando e armazenando o resultado
        // em uma variável da classe ResultSet
        ResultSet resultado = consulta.executeQuery();
        ArrayList<Carros> retorno = new ArrayList<Carros>();
        while(resultado.next()) {
            
            int id = resultado.getInt("id");
            String marca = resultado.getString("marca");
            String modelo = resultado.getString("modelo");
            int portas = resultado.getInt("portas");
            float motor = resultado.getFloat("motor");
            
            Carros carro =  new Carros();
            carro.setId(id);
            carro.setMarca(marca);
            carro.setModelo(modelo);
            carro.setPortas(portas);
            carro.setMotor(motor);
            
            retorno.add(carro);
            
        }
        return retorno;
    }
    
    public void inserirCarro(Carros carro) throws SQLException {
        
        String consulta = "INSERT INTO carros (marca,modelo,portas,motor) VALUES (?,?,?,?)";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        
        sql.setString(1, carro.getMarca());
        sql.setString(2, carro.getModelo());
        sql.setInt(3, carro.getPortas());
        sql.setFloat(4, carro.getMotor());
        
        sql.execute();
        
    }
    
    public Carros getById(int id) throws SQLException {
        String consulta = "SELECT * FROM carros WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        ResultSet resultado = sql.executeQuery();
        resultado.next();
        
        Carros retorno = new Carros();
        retorno.setId(id);
        retorno.setMarca(resultado.getString("marca"));
        retorno.setModelo(resultado.getString("modelo"));
        retorno.setMotor(resultado.getFloat("motor"));
        retorno.setPortas(resultado.getInt("portas"));
        
        return retorno;
    }
    
    public void editarCarro(Carros carro) throws SQLException {
        String consulta = "UPDATE carros SET marca = ?, modelo = ?, motor = ?, portas = ? WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setString(1, carro.getMarca());
        sql.setString(2, carro.getModelo());
        sql.setFloat(3, carro.getMotor());
        sql.setInt(4, carro.getPortas());
        sql.setInt(5, carro.getId());
        
        sql.execute();
    }
    
    public void excluirCarro(int id) throws SQLException {
        String consulta = "DELETE FROM carros WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        sql.execute();
    }
}
