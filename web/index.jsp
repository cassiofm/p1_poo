<%-- 
    Document   : index
    Created on : 5 de out de 2020, 10:17:39
    Author     : cassio
--%>

<%@page import="Pacote.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf//menu.jspf"%>

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
         <h3>Disciplinas matriculadas no semestre: <%= Disciplina.getList().size()%></h3>
       
      
        </div>
    </body>
</html>
