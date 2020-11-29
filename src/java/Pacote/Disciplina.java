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

    public Disciplina(String nome, String ementa, String ciclo) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
    }

    public Disciplina() {
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
    
    /*public ArrayList getList(ArrayList<Disciplina> dis){
        ArrayList<String> list = new ArrayList<>();
            for (Disciplina disciplina :dis) {
                list.add(disciplina.getNome());
        }
            return list; 
    }*/
    public static ArrayList<Disciplina> getList(){
        ArrayList<Disciplina> list = new ArrayList<>();
        list.add(new Disciplina("Materia 1", "Ementa 1", "4"));
        list.add(new Disciplina("Materia 2", "Ementa 2", "4"));
        list.add(new Disciplina("Materia 3", "Ementa 3", "4"));
        list.add(new Disciplina("Materia 4", "Ementa 4", "4"));
        
        return list;
    }
    
}
