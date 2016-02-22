<%-- 
    Document   : ListaInmu
    Created on : 24-jul-2013, 9:52:51
    Author     : USUARIO
--%>

<%@page import="Clases.Usuario"%>
<%@page import="Clases.Multas"%>
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
            <jsp:include page="Encabezado.jsp"></jsp:include>
                <table border="1"  style="width: 45%; margin-left: auto; margin-right: auto;  border: whitesmoke 5px groove;">
                <thead>
                    <tr>
                        <th>Codigo de la multa</th>
                        <th>Fecha</th>
                        <th>Valor</th>
                        <th>Descripcion</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    Datos misdatos=new Datos();
                    ResultSet rs =misdatos.getMultas();
                    while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("codigo")%></td>
                        <td><%=rs.getString("fecha")%></td>
                        <td><%=rs.getString("valor")%></td>
                        <td><%=rs.getString("descripcion")%></td>
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
    </body>
</html>
