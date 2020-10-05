<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 10:20:30
    Author     : cassio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Pacote.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/menu.jspf"%>

<% ArrayList<Disciplina> disciplinas = (ArrayList) application.getAttribute("disciplinas");
    if(request.getParameter("enviar")!=null){
        int t = Integer.parseInt(request.getParameter("indice"));
        disciplinas.get(t).setNota(Float.parseFloat(request.getParameter("nota")));
    }

%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
        <h1>Disciplinas matriculadas:</h1>
        
        <div class="container">
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Ementa</th>
                        <th>Ciclo</th>
                        <th>Nota</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(int i=0; i<disciplinas.size(); i++){%>
                    <% Disciplina disciplina = disciplinas.get(i); %>
                    <tr><td><%= disciplina.getNome()%></td>
                        <td><%= disciplina.getEmenta()%></td>
                        <td><%= disciplina.getCiclo()%></td>
                        <td>
                            <form>
                                <input type="text" name="nota" value="<%=disciplina.getNota()%>">
                                <input type="hidden" name="indice" value="<%=i%>"></td>
                                <td>
                                    <input type="submit" name="enviar" value="modificar">
                                </td>
                            </form>
                        </td> <% } %>
                        </tr>
                </tbody>
            </table>
        </div>
        </div>
    </body>
</html>
