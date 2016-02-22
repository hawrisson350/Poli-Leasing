<%-- 
    Document   : ListaArren
    Created on : 27/08/2013, 05:55:07 PM
    Author     : mateo
--%>

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
        <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miusua = (Usuario) sesion.getAttribute("usuario");
            if (miusua == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            }
            if (!miusua.getTipodeusuario().equals("Administrador")) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <% }%>
            <jsp:include page="Encabezado.jsp"></jsp:include>
            <br/>
            <table border="1"  style="width: 45%; margin-left: auto; margin-right: auto;  border: whitesmoke 5px groove;">
                <thead>
                    <tr>
                        <th>Id arrendatario</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Direccion</th>
                        <th>Telefono fijo</th>
                        <th>Telefono celular</th>
                        <th>E-mail</th>
                        <th>Profesion</th>
                        <th>Hijos</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    Datos misdatos=new Datos();
                    ResultSet rs =misdatos.getArrendatarios();
                    while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("idarrendatario")%></td>
                        <td><%=rs.getString("nombre")%></td>
                        <td><%=rs.getString("apellido")%></td>
                        <td><%= rs.getString("direccion")%></td>
                        <td><%=rs.getString("telfijo")%></td>
                        <td><%=rs.getString("telcel")%></td>
                        <td><%=rs.getString("e-mail")%></td>
                        <td><%=rs.getString("profesion")%></td>
                        <td><%=rs.getString("hijos")%></td>
                    </tr>
                    <%
                      }
                    misdatos.CerrarConexion();
                    %>
                </tbody>
            </table>
            </center>
        </div>
    </body>
</html>