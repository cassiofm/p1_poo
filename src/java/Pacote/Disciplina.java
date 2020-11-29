
package Pacote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author cassio
 */
public class Disciplina {
    private String nome;
    private String ementa;
    private String ciclo;
    private double nota;

    public Disciplina(String nome, String ementa, String ciclo) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
    }

    public Disciplina(String nome, String ementa, String ciclo, double nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
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

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }
    
     public static ArrayList<Disciplina> getList() throws Exception{
        ArrayList<Disciplina> list = new ArrayList<>();
        Connection con = null; Statement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM disciplinas");
            while(rs.next()){
                list.add(new Disciplina(
                        rs.getString("nome"),
                        rs.getString("ementa"),
                        rs.getString("ciclo"),
                        rs.getDouble("nota")
                ));
            }
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
        return list;
    }
    
    public static void insert(String nome, String ementa, String ciclo, Double nota) throws Exception{
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO disciplinas values(?,?,?,?)");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setString(3, ciclo);
            stmt.setDouble(2, nota);
            stmt.execute();
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
    }
    
    public static void update(String nomeAntigo, String nome, String ementa, String ciclo, Double nota) throws Exception{
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.prepareStatement("UPDATE categorias SET nome=?, descricao=? WHERE nome=?");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setString(3, ciclo);
            stmt.setDouble(4, nota);
            stmt.setString(5, nomeAntigo);
            stmt.execute();
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
    }
    
    public static void delete(String nome) throws Exception{
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DbListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome=?");
            stmt.setString(1, nome);
            stmt.execute();
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "nome VARCHAR(50) UNIQUE,"
                + "ementa VARCHAR(200),"
                + "ciclo VARCHAR(2),"
                + "nota,Double"
                + ")";
    }
    
}
