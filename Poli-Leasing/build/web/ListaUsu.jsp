<%-- 
    Document   : ListaUsu
    Created on : 23/07/2013, 10:15:12 PM
    Author     : ADA
--%>

<%@page import="java.util.List"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poli-leasing</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miusu = (Usuario) sesion.getAttribute("usuario");
            if (miusu == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            }
            if (!miusu.getTipodeusuario().equals("Administrador")) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <% }%>
                <jsp:include page="Encabezado.jsp"></jsp:include>
                    <table border="0" style="width: 650px; height: 650px;  border: whitesmoke 5px groove;">
                        <thead>
                            <tr>
                                <th>Id Usuario</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Perfli de usuario</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%  Datos misdatos = new Datos();
                            List<Usuario> LP = misdatos.ListaUsuarios();
                            
                        for(Usuario rs:LP) { %>
                        <tr>
                            <td><%=rs.getIdusuario() %></td>
                            <td><%=rs.getNombre()%></td>
                            <td><%=rs.getApellido()%></td>
                            <td><%=rs.getTipodeusuario()  %></td>
                            <td><img src="<%="images/" + rs.getFoto() %>" width="50" height="50" alt="no foto"/></td>

                        </tr>
                        <% }
                            misdatos.CerrarConexion();
                        %>
                    </tbody>
                </table>
                <center>
                </center>
    </body>
</html>
