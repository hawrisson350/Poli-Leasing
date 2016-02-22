<%-- 
    Document   : MenuAdmin
    Created on : 8/05/2013, 10:31:00 PM
    Author     : Hawrisson
--%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="Clases.ReadXMLFile"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Datos"%>
<%@page import="java.util.Random"%>
<%@page import="Clases.Usuario"%>
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

        </script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miusu = (Usuario) sesion.getAttribute("usuario");
            if (miusu == null) {
        %>
        <script>
            $(document).ready(function () {
                $("<div></div>").html("Por favor ingrese al sistema.").
                        dialog({title: "Error", modal: true, buttons: [
                                {
                                    text: "Aceptar",
                                    click: function () {
                                        location.href = "login.jsp";
                                    }
                                }
                            ]
                        });
                return false;
            });
        </script>
        <%
        } 
            String Foto = miusu.getFoto();
            String dir = "\\images\\Usuarios\\";
        %>

        <%
            Random rnd = new Random();
            Datos misdatos = new Datos();
            String FotoI;
            String Estado;
            ResultSet rs = misdatos.getInmueblesp(0, 6);
            String pregu = "¿Te intereza alguno de nuestros inmuebles";
            String pregun = "¿Buscas ofertar tu inmueble?";
            String pregn = "¿Buscas comprar un inmueble?";
            String p = "";
            int n;
            File Not = new File("C:\\Users\\pc\\Desktop\\poli-leasign ultiiii\\Poli-Leasing\\web\\noticias.xml");
            ReadXMLFile read = new ReadXMLFile();
            NodeList nlist = read.Readxlm(Not);
        %>
        <header>
            <nav class="indigo darken-3" style="padding-bottom: 70px;">
                <a href="#" data-activates="slide-out" class="button-collapse show-on-large" style="margin: 0px 10px;"><i class="mdi-navigation-menu"></i></a>
                <ul id="slide-out" class="side-nav indigo darken-3">
                    <li><img class="responsive-img circle" src= "<%="images/Usuarios/" + Foto%>" style="max-width: 250px; max-height: 250px; height: auto; margin: 15px 35px;"></li>
                    <li>Menú Principal</li>
                        <li class="no-padding">
                        <ul class="collapsible collapsible-accordion ">
                            <li>
                                <a class="collapsible-header " style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Inmuebles<i class=" small mdi-navigation-arrow-drop-down"></i></a>
                                <div class="collapsible-body indigo darken-3">
                                    <ul>
                                        <li><a href="#!" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Administrar Inmuebles</a></li>
                                        <li><a href="#!" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Generar reporte</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li><a href="login.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Cerrar sesión</a></li>
                </ul>
                <ul class="right hide-on-med-and-down">
                                        <ul id='dropdown2' class='dropdown-content indigo darken-3'>
                        <li><a href="MenuPrincipal.jsp?quien=quien.jsp" style="color:#fff;">Administrar Inmuebles</a></li>
                        <li><a href="#!" style="color:#fff;">Generar reporte</a></li>
                    </ul>
                    <li><a href="login.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Cerrar sesión</a></li>
                </ul>
            </nav>
        </header>

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
                                                FotoI = rs.getString("imagen");
                                                Estado = rs.getString("estado");
                                                if ((FotoI == null) || (Foto.equals(""))) {
                                                    FotoI = "nocasa.jpg";
                                                }
                                                if (!Estado.equals("Ocupado")) {

                                        %>
                                        <li>
                                            <img src="<%="images/" + FotoI%>"/>
                                            <div class="caption left-align">
                                                <h3 style="text-shadow: black 0.1em 0.1em 0.2em"><%out.println(p);%></h3>
                                                <h6 class="light text-lighten-3" style="text-shadow: black 0.1em 0.1em 0.2em">Solo tienes que registrarte</h6>
                                            </div>
                                        </li>
                                        <% }
                                            }%>
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

                    <div class="col s12 m12 L12">
                        <jsp:include page="Includes/ListaInmuebles.jsp"/>
                    </div>

                </div>

                <div class="col s12 m12 l4">
                    <div class="col s12 m6 l12" id="Usuario">
                        <div class="card indigo lighten-5" >
                            <div class="card-content">
                                <div class="row">
                                    <div class=" col s4 m4 l4">
                                        <img class="responsive-img circle" src= "<%="images/Usuarios/" + Foto%>" style="max-width: 100px; max-height: 100px; height: auto;">
                                    </div>
                                    <div class=" col s8 m8 l8">
                                        <div style="text-align: left; height:50px;padding: 5px;">
                                            <h5>Bienvenido Invitad@</h5>
                                            <h6><%= miusu.getNombre() %> <br/>
                                                <%= miusu.getApellido()%></h6>
                                        </div>
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class=" col s12 m12 l12">
                                        <button type="submit" value="Nuevo" id="Nuevo" name="Nuevo" class="indigo darken-4">
                                            <a href="Infousuario.jsp" class="waves-effect waves-light btn indigo darken-4"><i class="medium mdi-editor-mode-edit"></i>Editar cuenta</a>
                                        </button>
                                    </div>
                                        
                                </div>
                            </div>
                        </div>
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
