/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pacote;

import java.util.ArrayList;

/**
 *
 * @author cassio
 */
public class Disciplina {
    private String nome;
    private String ementa;
    private String ciclo;
    private Double nota;

    public Disciplina(String nome, String ementa, String ciclo, Double nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }



    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }
    
public static String getCreateStatement(){
    return "CREATE TABLE IF NOT EXISTS disciplinas("
            + "nome VARCHAR(50) UNIQUE,"
            + "ementa VARCHAR(200),"
            + "ciclo VARCHAR(2),"
            + "nota Double";
}
    
}
