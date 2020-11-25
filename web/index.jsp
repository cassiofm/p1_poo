<%-- 
    Document   : index
    Created on : 5 de out de 2020, 10:17:39
    Author     : cassio
--%>

<%@page import="Pacote.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/menu.jspf"%>

<%--<% ArrayList<Disciplina> disciplinas = (ArrayList) application.getAttribute("disciplinas");
    if(disciplinas == null){
        disciplinas = new ArrayList();
        disciplinas.add(new Disciplina("IAL205", "Aplicações de sensores em ambiente agrícola. Arquiteturas de hardware e software","2" )); 
        disciplinas.add(new Disciplina("IBD002", "Conceitos de Base de Dados. Modelos conceituais de informações. Modelos de Dados: Relacional,  Redes e Hierárquicos.","4" )); 
        disciplinas.add(new Disciplina("IES300", "Conceitos, evolução e importância de arquitetura de software. Padrões de Arquitetura. Padrões de Distribuição.", "4")); 
        disciplinas.add(new Disciplina("ILP007", "Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças entre o paradigma da programação estruturada em relação à orientação a objetos.", "4")); 
        disciplinas.add(new Disciplina("ILP512", "Comandos de linguagens usadas na construção e estruturação de sites para a Web, com páginas dinâmi­cas e interativas. Definição de layouts e formatação em geral. ", "4")); 
        disciplinas.add(new Disciplina("ISO200", "Apresentação de um sistema operacional específico utilizado em ambiente corporativo. Requisitos de hardware para instalação do sistema.", "4")); 
        disciplinas.add(new Disciplina("TTG001", "O Papel da ciência e da tecnologia. Tipos de conhecimento. Método e técnica. O processo de leitura e de análise textual. Citações e bibliografias.", "4")); 
        disciplinas.add(new Disciplina("TTG003", "O estudante elaborará, sob a orientação de docente, um Trabalho de Graduação, e o apresentará perante uma banca examinadora.", "5"));
        application.setAttribute("disciplinas", disciplinas);
        
        for(int j=0; j<disciplinas.size(); j++){
            disciplinas.get(j).setNota(Float.parseFloat("0.0"));
        }
    }
    
%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <div align="center">
        <br><br>
        <h3>Cássio Félix de Moura</h3>
        <br><hr><br>
        <h3>R.A. : 1290481913009</h3>
        
        <%--<% Disciplina disciplina = new Disciplina();
            ArrayList list = disciplina.getList(disciplinas);
            int discSize = list.size();
        %>--%>
        <%--<h3>Disciplinas matriculadas no semestre: <%=discSize%></h3>--%>
        <h3>Disciplinas matriculadas no semestre: <%= Disciplina.getList().size()%></h3>
        </div>
    </body>
</html>
