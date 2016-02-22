<%-- 
    Document   : MenuAdmin
    Created on : 8/05/2013, 10:31:00 PM
    Author     : Hawrisson
--%>
<%@page import="com.mysql.jdbc.Util"%>
<%@page import="java.io.File"%>
<%@page import="Clases.LSL"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Inmuebles"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.Usuario"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="Clases.ReadXMLFile"%>
<%@page import="java.util.Random" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Includes/Import.jsp"%>
        <style>
            #mensaje{
                visibility: hidden;
            }
            main{
                margin:0px 5%;
            }
            @media only screen and  (max-width: 992px) {
                #mensaje{
                    visibility: visible;
                }
                main{
                    margin:0px 1%;
                }

            }
        </style>
        <script>
            $(document).ready(function () {
                $('.button-collapse').sideNav({
                    menuWidth: 300, // Default is 240
                    edge: 'left', // Choose the horizontal origin
                    closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
                }
                );
                $('.slider').slider({full_width: true});
            });

            function cl() {
                $("#login").fadeOut("slow");
            }
            
            function clq() {
                $("#quien").fadeOut("slow");
            }
            
        </script>
    </head>
    <body>
        <%
            Random rnd = new Random();
            Datos misdatos = new Datos();
            String Foto;
            String Estado;
            ResultSet rs = misdatos.getInmueblesp(0,6);
            String pregu = "¿Te intereza alguno de nuestros inmuebles";
            String pregun = "¿Buscas ofertar tu inmueble?";
            String pregn = "¿Buscas comprar un inmueble?";
            String p = "";
            int n;
            File Not = new File("C:\\Users\\pc\\Desktop\\poli-leasign ultiiii\\Poli-Leasing\\web\\noticias.xml");
            ReadXMLFile read = new ReadXMLFile();
            NodeList nlist = read.Readxlm(Not);
        %>
        <%@include file="Includes/header.jsp"%>
        <main>
            <div class="row">
                <div class="col s12 m12 l8">
                    <div class="col s12 m12 l12">
                        <div class="card indigo lighten-3">
                            <div class="card-image">
                                <!--Slider-->
                                <div class="slider">
                                    <ul class="slides">
                                        <% while (rs.next()) {
                                                p = "";
                                                n = ((int) (rnd.nextDouble() * 3.0) + 1);
                                                if (n == 1) {
                                                    p = pregn;
                                                } else if (n == 2) {
                                                    p = pregun;
                                                } else if (n == 3) {
                                                    p = pregu;
                                                }
                                                Foto = rs.getString("imagen");
                                                Estado = rs.getString("estado");
                                                if ((Foto == null) || (Foto.equals(""))) {
                                                    Foto = "nocasa.jpg";
                                                }
                                                if (!Estado.equals("Ocupado")) {

                                        %>
                                        <li>
                                            <img src="<%="images/" + Foto%>"/>
                                            <div class="caption left-align">
                                                <h3 style="text-shadow: black 0.1em 0.1em 0.2em"><%out.println(p);%></h3>
                                                <h6 class="light text-lighten-3" style="text-shadow: black 0.1em 0.1em 0.2em">Solo tienes que registrarte</h6>
                                            </div>
                                        </li>
                                        <% }}%>
                                    </ul>
                                </div>
                                <!-- Fin Slider-->
                            </div>
                            <div class="card-content">
                                <p>
                                    Registrate <a href="#">aquí</a>
                                    en nuestra plataforma es facil y totalmente gratis,
                                    o si deseas puedes comunicarte a alguna de nustras lineas telefonicas o escribenos en nuestras redes sociales.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m12 l12" id="quien">
                        <% if (request.getParameter("quien") != null) {
                            String rut= request.getParameter("quien");
                        %>
                        <div class="card indigo lighten-5" >
                            <a href="#!" id="quienclose" onclick="clq()"><i class="material-icons right">close</i></a>
                            <div class="card-content">
                                <jsp:include page="<%=rut%>"/>
                            </div>
                        </div>
                        <% }%>
                    </div>
                    <div class="col s12 m12 L12">
                        <jsp:include page="Includes/ListaInmuebles.jsp"/>
                    </div>

                </div>

                <div class="col s12 m12 l4">
                    <div class="col s12 m6 l12" id="login">
                        <% if (request.getParameter("accion") != null) {
                            String rut=request.getParameter("accion");
                        %>
                        <div class="card indigo lighten-5" >
                            <a href="#!" id="loginclose" onclick="cl()"><i class="material-icons right">close</i></a>
                            <div class="card-content">
                                <jsp:include page="<%=rut%>"/>
                            </div>
                        </div>
                        <% }%>
                    </div>
                    <div class="col s12 m6 l12">
                        <div class="card indigo lighten-5" >
                            <div class="card-content">
                                    <h3>Noticias</h3>
                                    <!--- /////////////////Noticias --->
                                    <%
                                        for (int temp = 0; nlist.getLength() > temp; temp++) {
                                            Node nNode = nlist.item(temp);
                                            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                                                Element eElement = (Element) nNode;
                                                System.out.println("Titulo:" + read.getTagValue("titulo", eElement));
                                                System.out.println("Descripcion:" + read.getTagValue("desc", eElement));
                                                System.out.println("imagen:" + read.getTagValue("ima", eElement));
                                    %>
                                        <div class="card small">
                                            <div class="card-image waves-effect waves-block waves-light">
                                                <img class="activator" src="<%= read.getTagValue("ima", eElement)%>">
                                            </div>
                                            <div class="card-content" >
                                                <span class="card-title activator grey-text text-darken-4"><%=read.getTagValue("titulo", eElement)%><i class="material-icons right">more_vert</i></span>
                                                <p><%= read.getTagValue("sub", eElement)%></p>
                                            </div>
                                            <div class="card-reveal indigo lighten-4">
                                                <span class="card-title grey-text text-darken-4"><%=read.getTagValue("titulo", eElement)%><i class="material-icons right">close</i></span>
                                                <p><%=read.getTagValue("desc", eElement)%></p>
                                            </div>
                                        </div>
                                        <% }
                                            }%>
                                        <!-- ///////////////// Fin Noticias-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <%@include file="Includes/footer.jsp" %>
    </body>
</html>
