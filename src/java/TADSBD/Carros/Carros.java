package TADSBD.Carros;

import TADSBD.Marcas.Marcas;

public class Carros {

    private int id;
    private Marcas marca;
    private String modelo;
    private int portas;
    private float motor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Marcas getMarca() {
        return marca;
    }

    public void setMarca(Marcas marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getPortas() {
        return portas;
    }

    public void setPortas(int portas) {
        this.portas = portas;
    }

    public float getMotor() {
        return motor;
    }

    public void setMotor(float motor) {
        this.motor = motor;
    }
    
    
    
}
