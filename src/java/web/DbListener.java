package web;
import Pacote.Disciplina;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DbListener implements ServletContextListener {
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String DB_URL = "jdbc:sqlite:disciplinas.db";
    
    public static String exceptionMessage = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(DB_URL);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String etapa = "Inicialização";
        Connection con = null;
        Statement stmt = null;
        try{
            etapa = "Registro a classe do driver";
            Class.forName(CLASS_NAME);
            etapa = "Conectar com o banco de dados";
            con = getConnection();
            etapa = "Preparando o statement";
            stmt = con.createStatement();
            etapa = "Criar a tabela de disciplinas";
            stmt.execute(Disciplina.getCreateStatement());
            if(Disciplina.getList().isEmpty()){
                etapa = "Criar primeiras disciplinas";
               stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Internet das Coisas',"
                        + "'Aplicações de sensores em ambiente agrícola. Arquiteturas de hardware e software. Metodologias e etapas de projeto e desenvolvimento.',"
                        + "5,"
                        + "6"
                        + ")");


stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Banco de dados',"
                        + "'Conceitos de Base de Dados. Modelos conceituais de informações. Modelos de Dados: Relacional,  Redes e Hierárquicos. Modelagem de dados',"
                        + "4,"
                        + "7"
                        + ")");


stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Eng. Soft. 3',"
                        + "'Conceitos, evolução e importância de arquitetura de software. Padrões de Arquitetura. Padrões de Distribuição. Camadas no desenvolvimento de software',"
                        + "4,"
                        + "6"
                        + ")");


stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Programacao Orientada a Objetos',"
                        + "'Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças entre o paradigma da programação estruturada em relação à orientação a objetos.',"
                        + "4,"
                        + "9"
                        + ")");



stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Linguagem de Programação IV',"
                        + "'Comandos de linguagens usadas na construção e estruturação de sites para a Web, com páginas dinâmi­cas e interativas.',"
                        + "4,"
                        + "6"
                        + ")");


stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Metodologia da Pesquisa Científico-Tecnológica',"
                        + "'O Papel da ciência e da tecnologia. Tipos de conhecimento. Método e técnica. O processo de leitura e de análise textual.',"
                        + "4,"
                        + "8"
                        + ")");


stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Trabalho de Graduação I',"
                        + "'O estudante elaborará, sob a orientação de docente, um Trabalho de Graduação, e o apresentará perante uma banca examinadora. ',"
                        + "5,"
                        + "8"
                        + ")");


stmt.execute("INSERT INTO disciplinas VALUES ("
                        + "'Sistemas Operacionais II',"
                        + "'Apresentação de um sistema operacional específico utilizado em ambiente corporativo. Requisitos de hardware para instalação do sistema.',"
                        + "4,"
                        + "8"
                        + ")");

            }
            
         
            etapa = "Desconectar do banco de dados";
        }catch(Exception ex){
            exceptionMessage = etapa+": "+ex.getLocalizedMessage();
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
