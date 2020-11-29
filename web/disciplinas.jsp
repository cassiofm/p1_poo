<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 10:20:30
    Author     : cassio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Pacote.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf"%>
<%@page import="web.DbListener"%>
        
        <%        
        String exceptionMessage = null;
    if(request.getParameter("Cancelar")!=null){
    response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("FormInsert")!=null){
        try{
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            String ciclo = request.getParameter("ciclo");
            Double nota = Double.parseDouble(request.getParameter("nota"));
            Disciplina.insert(nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormUpdate")!=null){
        try{
            String nome = request.getParameter("nome");
            String nomeAntigo = request.getParameter("nomeAntigo");
            String ementa = request.getParameter("ementa");
            String ciclo = request.getParameter("ciclo");
            Double nota = Double.parseDouble(request.getParameter("nota"));
            Disciplina.update(nomeAntigo, nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormDelete")!=null){
        try{
            String nome = request.getParameter("nome");
            Disciplina.delete(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <body>
      
       
            <%if(request.getParameter("prepareInsert")!=null){%>
                <h3>Inserir registro</h3>
                <form>
                    Nome: <input type="text" name="nome"/>
                    Ementa: <input type="text" name= "ementa"/>
                    Ciclo: <input type="text" name="ciclo"/>
                    Nota: <input type="text" name="nota"/>
                    <input type="submit" name="FormInsert" value="Inserir"/>
                    <input type="submit" name="Cancelar" value="Cancelar"/>
                </form>
            <%}else if(request.getParameter("prepararUpdate")!=null){%>
                <h3>Alterar registro</h3>
                <form>
                    <% String nome = request.getParameter("nome");
                     String ementa = request.getParameter("ementa"); 
                     String ciclo = request.getParameter("ciclo"); 
                     String nota = request.getParameter("nota"); %>
                    <input type="hidden" name="nomeAntigo" value="<%= nome %>"/>
                    Nome: <input type="text" name="nome" value="<%= nome %>"/>
                    Ementa: <input type="text" name="ementa" value="<%= ementa %>"/>
                    Ciclo: <input type="text" name="ementa" value="<%= ciclo %>"/>
                    Nota: <input type="text" name="ementa" value="<%= nota %>"/>
                    <input type="submit" name="FormUpdate" value="Alterar"/>
                    <input type="submit" name="Cancelar" value="Cancelar"/>
                </form>
            <%}else if(request.getParameter("prepararDelete")!=null){%>
                <h3>Excluir registro</h3>
                <form>
                    <% String nome = request.getParameter("nome"); %>
                    <input type="hidden" name="nome" value="<%= nome %>"/>
                    Excluir o registro <b><%= nome %></b>?
                    <input type="submit" name="FormDelete" value="Excluir"/>
                    <input type="submit" name="Cancelar" value="Cancelar"/>
                </form>
            <%}else{%>
                <form method="post">
                    <input type="submit" name="prepareInsert" value="Inserir"/>
                </form>
            <%}%>
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
                    <th>Comandos</th>
                </tr>
                
                </thead>
                
                
                <%for(Disciplina c: Disciplina.getList()){%>
                <tr>
                    <td><%= c.getNome() %></td>
                    <td><%= c.getEmenta()%></td>
                    <td><%= c.getCiclo()%></td>
                    <td><%= c.getNota()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="nome" value="<%= c.getNome() %>"/>
                            <input type="hidden" name="ementa" value="<%= c.getEmenta()%>"/>
                            <input type="hidden" name="ciclo" value="<%= c.getCiclo()%>"/>
                            <input type="hidden" name="nota" value="<%= c.getNota()%>"/>
                            <input type="submit" name="prepararUpdate" value="Alterar"/>
                            <input type="submit" name="prepararDelete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        
        </div>
    </body>
</html>
