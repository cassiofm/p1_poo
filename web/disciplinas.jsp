<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 10:20:30
    Author     : cassio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Pacote.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf"%>


<!DOCTYPE html>
<%
    ArrayList<Disciplina> list = (ArrayList<Disciplina>)application.getAttribute("list");
        if(list == null){
            list = Disciplina.getList();
            application.setAttribute("list",list);
        }
        Exception requestException = null;
        if(request.getParameter("update")!=null){
               try{
                   int i = Integer.parseInt(request.getParameter("i"));
                   Double nota = Double.parseDouble(request.getParameter("nota"));
                   list.get(i).setNota(nota);
                   response.sendRedirect(request.getRequestURI());
               }catch(Exception ex){
                   requestException = ex;
               }
        }
%>


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
        <% if(requestException!= null){ %>
        <div style="color: red">Erro ao alterar a nota: <%= requestException.getMessage()%></div>
        <%}%>
        <div class="container">
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th>Indice</th>
                        <th>Nome</th>
                        <th>Nota</th>
                        <th>Alterar Nota</th>
                    </tr>
                </thead>
                <tbody>
                    
                 <% for(int i=0; i<list.size(); i++){%>
                 <tr>
                     <td><%= i %></td>
                     <td><%= list.get(i).getNome() %></td>
                     <td><%= list.get(i).getNota() %></td>
                     <td>
                         <form>
                             <input type="hidden" name="i" value="<%= i%>"/>
                             <input type="text"  name="nota"/>
                             <input type="submit" name="update" value="Alterar nota"/>
                         </form>
                     </td>
                 </tr>
                 <%}%>
                
                   
                </tbody>
            </table>
        </div>
        </div>
    </body>
</html>
