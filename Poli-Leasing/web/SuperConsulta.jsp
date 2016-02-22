<%@page import="Clases.LSL"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Inmuebles"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : MenuAdmin
    Created on : 8/05/2013, 10:31:00 PM
    Author     : Hawrisson
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poli-Leasing</title>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".button-collapse").sideNav();
                $('.button-collapse').sideNav({
                    menuWidth: 400, // Default is 240
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
            Datos misdatos = new Datos();
            List<Inmuebles> LP = misdatos.ListaInmueble();
            LSL lista = new LSL();

            String IdInmueble = "";
            String Direccion = "";
            String Imagen = "";
            String Barrio = "";
            String Nhabitaciones = "";
            String Piso = "";
            String Estado = "";
            String Descripcion = "";
            String Estrato = "";
            String Ciudad = "";
            String Precio = "";
            String valor = "";
            String campo = "";
            String Bano = "";
            String Enchapado = "";
            String Cocina = "";
            String Tipo = "";
            String Area = "";
            String Garajes = "";

            if (request.getParameter("IdInmueble") != null) {
                IdInmueble = request.getParameter("IdInmueble");
            }
            if (request.getParameter("Direccion") != null) {
                Direccion = request.getParameter("Direccion");
            }
            if (request.getParameter("Imagen") != null) {
                Imagen = request.getParameter("Imagen");
            }
            if (request.getParameter("Barrio") != null) {
                Barrio = request.getParameter("Barrio");
            }
            if (request.getParameter("Nhabitaciones") != null) {
                Nhabitaciones = request.getParameter("Nhabitaciones");
            }
            if (request.getParameter("Piso") != null) {
                Piso = request.getParameter("Piso");
            }
            if (request.getParameter("Estado") != null) {
                Estado = request.getParameter("Estado");
            }
            if (request.getParameter("Descripcion") != null) {
                Descripcion = request.getParameter("Descripcion");
            }
            if (request.getParameter("Estrato") != null) {
                Estrato = request.getParameter("Estrato");
            }
            if (request.getParameter("Ciudad") != null) {
                Ciudad = request.getParameter("Ciudad");
            }
            if (request.getParameter("Precio") != null) {
                Precio = request.getParameter("Precio");
            }
            if (request.getParameter("valor") != null) {
                valor = request.getParameter("valor");
            }
            if (request.getParameter("campo") != null) {
                campo = request.getParameter("campo");
            }
            if (request.getParameter("Bano") != null) {
                Bano = request.getParameter("Bano");
            }
            if (request.getParameter("Enchapado") != null) {
                Enchapado = request.getParameter("Enchapado");
            }
            if (request.getParameter("Cocina") != null) {
                Cocina = request.getParameter("Cocina");
            }
            if (request.getParameter("Tipo") != null) {
                Tipo = request.getParameter("Tipo");
            }
            if (request.getParameter("Area") != null) {
                Area = request.getParameter("Area");
            }
            if (request.getParameter("Garajes") != null) {
                Garajes = request.getParameter("Garajes");
            }
            
            if (request.getParameter("accion") != null) {
                IdInmueble = request.getParameter("accion");
                Inmuebles miinmu = misdatos.getInmueble(IdInmueble);
                        IdInmueble = miinmu.getIdinmueble();
                        Direccion = miinmu.getDireccion();
                        Imagen = miinmu.getImagen();
                        Barrio = miinmu.getBarrio();
                        Nhabitaciones = miinmu.getNhabitaciones();
                        Piso = miinmu.getPiso();
                        Estado = miinmu.getEstado();
                        Descripcion = miinmu.getDescripcion();
                        Estrato = miinmu.getEstrato();
                        Ciudad = miinmu.getCiudad();
                        Precio = "" + miinmu.getPrecio();
                        Bano = miinmu.getBano();
                        Enchapado = miinmu.getEnchape();
                        Cocina = miinmu.getCocina();
                        Tipo = miinmu.getTipo();
                        Area = miinmu.getArea();
                        Garajes = miinmu.getGaraje();

                    misdatos.CerrarConexion();
                }
        %>
        <header>
            <nav class="black">
                <span href="#" data-activates="slide-out" class="button-collapse" style="margin:2px 0px 0px 10px; padding: 0px 7px;background-color: #3f51b5;"><i class="mdi-navigation-menu"></i></span>
                <ul id="slide-out" class="side-nav darken-1" style="background-color: #3f51b5;">
                    <li><a href="#!" >First Sidebar Link</a></li>
                    <li><a href="#!" >Second Sidebar Link</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <div class="row">
                <div class="col s12 m12 l8">
                    <div class="card">
                        <div class="card-image">
                            <!--Slider-->
                            <div class="slider">
                                <ul class="slides">
                                    <li>
                                        <img src="http://lorempixel.com/580/250/nature/1"> <!-- random image -->
                                        <div class="caption center-align">
                                            <h3>This is our big Tagline!</h3>
                                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="http://lorempixel.com/580/250/nature/2"> <!-- random image -->
                                        <div class="caption left-align">
                                            <h3>Left Aligned Caption</h3>
                                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="http://lorempixel.com/580/250/nature/3"> <!-- random image -->
                                        <div class="caption right-align">
                                            <h3>Right Aligned Caption</h3>
                                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="http://lorempixel.com/580/250/nature/4"> <!-- random image -->
                                        <div class="caption center-align">
                                            <h3>This is our big Tagline!</h3>
                                            <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- Fin Slider-->
                        </div>
                        <div class="card-content">
                            <p>I am a very simple card. I am good at containing small bits of information.
                                I am convenient because I require little markup to use effectively.</p>
                        </div>
                    </div>
                </div>
                <div class="col s12 m12 l4">
                    <div class="card">
                        <div class="card-image">
                            <img src="images/Poli-leasing.png" style="height: 350px;">
                        </div>
                        <div class="card-content">
                            <p>Pensando en usted y su comodidad.</p>
                        </div>
                    </div>
                </div>

                <div class="col s12 m6 l6">
                    <div class="card">
                        <div class="card-content">
                            <h4>¿Te intereza alguno de nuestros inmuebles y Te gustaria vivir en alguno?</h4>
                            <p class="flow-text">
                                Registrate <a href="#">aquí</a>
                                en nuestra plataforma es facil y totalmente gratis,
                                o si deseas puedes comunicarte a alguna de nustras lineas telefonicas y estaremos gustosos de ayudarte o escribenos es nuestras redes sociales.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col s12 m6 l6">
                    <div class="card">
                        <div class="card-content">
                            <h4>¿Buscas ofertar tu inmueble?</h4>
                            <p class="flow-text">
                                Registrate <a href="#">aquí</a>
                                en nuestra plataforma es facil y totalmente gratis,
                                o si deseas puedes comunicarte a alguna de nustras lineas telefonicas y estaremos gustosos de ayudarte o escribenos es nuestras redes sociales.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col s12 m12 l12">
                    <div class="card">
                        <div class="card-content">
                            <h4>Quienes Somos</h4>
                            <p class="flow-text">
                                Poli Leasing es una empresa dedicada a la venta y alquiler de distintos 
                                tipos de inmuebles que busca dar el mejor servicio a sus clientes y mejorar la forma de vida de estos mismos, Desde casas en el centro de la ciudady tambien en las afueras de la ciudad
                                incluyendo fincas, Tambi&eacute;n arrendamos y vendemos casas en distintas ciudades del paispara las personas que quieran cambiar de vivienda en cualquier ciudad del pais.<br/><br/> 
                                Nuestro lema es: Pensamos en usted y en su familia y le garantizamos un excelente Hogar. para Poli-Leasing es muy importante que los clientes se sientan satisfechos con sus inmuebles que 
                                han pedido en arrendamiento o han comprado por este motivo en nuestra pagina le damos las opciones a los usuarios sean propietarios o arrendatarios que presenten sus quejas y que reporten 
                                los da&ntilde;os que tienen sus inmuebles para de esta forma mejorar nuestra relacion entre cliente y agencia.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col s12 m12 l12">
                    <div class="card">
                        <div class="card-content">
                            <!-------- form imnu-->


                            <div style="width: 720px; height: 200px;">
                                <%if (LP != null) {%> 
                                <table id="tab" border="5" style="width:660px; border: whitesmoke 5px groove;empty-cells: hide; border-spacing: 0px 0px; ">
                                    <thead>
                                        <tr>
                                            <th>Id inmueble</th>
                                            <th>Direccion</th>
                                            <th>Barrio</th>
                                            <th>Estrato</th>
                                            <th>Ciudad</th>
                                            <th>Imagen</th>
                                            <th>Precio</th>
                                            <th>Tipo</th>
                                            <th>Area</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (Inmuebles rs : LP) {
                                        %>
                                        <tr  id="po">

                                            <td><a href="MenuPrincipal.jsp?accion=<%=rs.getIdinmueble()%>"><%=rs.getIdinmueble()%></a></td>
                                            <td><%=rs.getDireccion()%></td>
                                            <td><%=rs.getBarrio()%></td>
                                            <td><%=rs.getEstrato()%></td>
                                            <td><%=rs.getCiudad()%></td>
                                            <td><img src="<%="images/" + rs.getImagen()%>" width="50" height="50" alt="no foto"/></td>
                                            <td><%=rs.getPrecio()%></td>
                                            <td><%=rs.getTipo()%></td>
                                            <td><%=rs.getArea()%>m<sup>2</sup></td>
                                            <td><a href="MenuPrincipal.jsp?accion=<%=rs.getIdinmueble()%>">Ver mas.</a></td>
                                        </tr>
                                        <% }//misdatos.CerrarConexion();%>
                                    </tbody>
                                </table>
                                <%}%>
                            </div>
                            <!-- fin form imnu-->  
                        </div>
                    </div>
                </div>
                <div class="col s12 m12 l12">
                    <div class="card">
                        <div class="card-content">            
                <form name="inmuebles" id="inmuebles" action="MenuPrincipal.jsp" method="POST">
                    <table border="0" style="margin-left: auto; margin-right: auto; empty-cells: hide; text-align:left;">
                        <tbody>
                            <tr>
                                <td style="width: 50px">Identificación Inmueble*:</td>
                                <td style="width: 50px"><input type="text" name="IdInmueble" id="IdInmueble" value="<%=IdInmueble%>" size="20" disabled="disabled" /></td>

                                <td style="width: 50px">Dirección*:</td>
                                <td style="width: 50px"><input type="text" name="Direccion" id="Direccion" value="<%=Direccion%>" size="25" /></td>

                                <td>Tipo de Inmueble*:</td>
                                <td><select name="Tipo" id="Tipo">
                                        <option value="null" <%=(Tipo.equals("") ? "selected" : "")%>>Seleccionar Tipo</option>
                                        <option value="Casa"<%=(Tipo.equals("Casa") ? "selected" : "")%>>Casa</option>
                                        <option value="Finca"<%=(Tipo.equals("Finca") ? "selected" : "")%>>Finca</option>
                                        <option value="Local"<%=(Tipo.equals("Local") ? "selected" : "")%>>Local</option>
                                        <option value="Apartamento"<%=(Tipo.equals("Apartamento") ? "selected" : "")%>>Apartamento</option>
                                    </select>
                                </td> 

                            </tr>
                            <tr>
                                <td>Barrio*:</td>
                                <td><input type="text" name="Barrio" id="Barrio" value="<%=Barrio%>" size="20" /></td>

                                <td>Número de<br/>habitaciones*:</td>
                                <td><input type="text" name="Nhabitaciones" id="Nhabitaciones" value="<%=Nhabitaciones%>" size="20" onkeypress="return soloNumeros(event)" /></td>

                                <td>Baños*:</td>
                                <td><select name="Bano" id="Bano">
                                        <option value="null" <%=(Bano.equals("") ? "selected" : "")%>>Seleccionar Cantidad</option>
                                        <option value="Ninguno"<%=(Bano.equals("Ninguno") ? "selected" : "")%>>Ninguno</option>
                                        <option value="1"<%=(Bano.equals("1") ? "selected" : "")%>>1</option>
                                        <option value="2"<%=(Bano.equals("2") ? "selected" : "")%>>2</option>
                                        <option value="3"<%=(Bano.equals("3") ? "selected" : "")%>>3</option>
                                        <option value="4"<%=(Bano.equals("4") ? "selected" : "")%>>4</option>
                                        <option value="Mas de 5"<%=(Bano.equals("Mas de 5") ? "selected" : "")%>>Mas de 5</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Piso*:</td>
                                <td><input type="text" name="Piso" id="Piso" value="<%=Piso%>" size="20" onkeypress="return soloNumeros(event)" /></td>

                                <td>Estado*:</td>
                                <td><select name="Estado" id="Estado">
                                        <option value="null" <%=(Estado.equals("") ? "selected" : "")%>>Seleccionar estado</option>
                                        <option value="Libre"<%=(Estado.equals("Libre") ? "selected" : "")%>>Libre</option>
                                        <option value="Ocupado"<%=(Estado.equals("Ocupado") ? "selected" : "")%>>Ocupado</option>
                                        <option value="En reparaciones"<%=(Estado.equals("En reparaciones") ? "selected" : "")%>>En reparaciones</option>
                                    </select>
                                </td>

                                <td>Ciudad*:</td>
                                <td><select name="Ciudad" id="Ciudad" >
                                        <option value="null" <%=(Ciudad.equals("") ? "selected" : "")%>>Seleccionar Ciudad</option>
                                        <option value="Medellin"<%=(Ciudad.equals("Medellin") ? "selected" : "")%>>Medellin</option>
                                        <option value="Cali"<%=(Ciudad.equals("Cali") ? "selected" : "")%>>Cali</option>
                                        <option value="Bogota"<%=(Ciudad.equals("Bogota") ? "selected" : "")%>>Bogota</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Precio*:</td>
                                <td><input type="text" name="Precio" id="Precio" value="<%=Precio%>" size="20" onkeypress="return soloNumeros(event)" ></td>

                                <td>Estrato*:</td>
                                <td><select name="Estrato" id="Estrato">
                                        <option value="null" <%=(Estrato.equals("") ? "selected" : "")%>>Seleccionar Estrato</option>
                                        <option value="1"<%=(Estrato.equals("1") ? "selected" : "")%>>1</option>
                                        <option value="2"<%=(Estrato.equals("2") ? "selected" : "")%>>2</option>
                                        <option value="3"<%=(Estrato.equals("3") ? "selected" : "")%>>3</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Garajes*:</td>
                                <td><select name="Garajes" id="Garajes">
                                        <option value="null" <%=(Garajes.equals("") ? "selected" : "")%>>Seleccionar Cantidad</option>
                                        <option value="Ninguno"<%=(Garajes.equals("Ninguno") ? "selected" : "")%>>Ninguno</option>
                                        <option value="1"<%=(Garajes.equals("1") ? "selected" : "")%>>1</option>
                                        <option value="2"<%=(Garajes.equals("2") ? "selected" : "")%>>2</option>
                                        <option value="3"<%=(Garajes.equals("3") ? "selected" : "")%>>3</option>
                                        <option value="4"<%=(Garajes.equals("4") ? "selected" : "")%>>4</option>
                                        <option value="Mas de 5"<%=(Garajes.equals("Mas de 5") ? "selected" : "")%>>Mas de 5</option>
                                    </select>
                                </td>    

                                <td>Area*:</td>
                                <td><input type="text" name="Area" id="Area" value="<%=Area%>" size="15" onkeypress="return soloNumeros(event)" /> m<sup>2</sup></td>

                                <td>Enchapado*:</td>
                                <td><select name="Enchapado" id="Enchapado">
                                        <option value="null" <%=(Enchapado.equals("") ? "selected" : "")%>>Seleccionar Respuesta</option>
                                        <option value="Si"<%=(Enchapado.equals("Si") ? "selected" : "")%>>Si</option>
                                        <option value="No"<%=(Enchapado.equals("No") ? "selected" : "")%>>No</option>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td>Descripcion*:</td>
                                <td>
                                    <textarea name="Descripcion" id="Descripcion" style="overflow: hidden;" rows="5" cols="20"><%=Descripcion%></textarea>
                                </td>

                                <td rowspan="1">Imagen:</td>
                                <td rowspan="1" style="padding: 0px 0px">
                        <center>
                            <% if (Imagen == null) {
                                    Imagen = "";
                                }
                                if (Imagen.equals("")) {
                            %>
                            <img src="images/nocasa.jpg" width="70" height="70" alt="Foto a seleccionar"/>
                            <% } else {%>
                            <img src="<%="images/" + Imagen%>" width="70" height="70" alt="Foto a seleccionar"/>
                            <% }%>
                            <br/>
                            <input type="file" name="Imagen" id="Imagen" value="<%=Imagen%>" style="width:130px;" />
                            <!--<input type="submit" value="Imagen" name="Imagen"  class="boto" id="Imagen" onclick="return ValidarInmu1()" /> --->
                        </center>
                        </td>

                        </tr>
                        </tbody>
                    </table>
                </form>
                        
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="page-footer indigo">
            <div class="row" style="margin-left: 5%;">
                <div class="col s12 m6 l6">
                    <h5 class="white-text">Footer Content</h5>
                    <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
                </div>
                <div class="col s12 m6 l6">
                    <h5 class="white-text">Links</h5>
                    <ul>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
                        <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    © 2014 Copyright Text
                    <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
                </div>
            </div>
        </footer>

    </body>
</html>

