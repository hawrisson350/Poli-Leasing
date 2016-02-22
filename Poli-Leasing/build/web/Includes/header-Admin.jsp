<%-- 
    Document   : header-Admin
    Created on : 2/02/2016, 03:10:55 PM
    Author     : pc
--%>
<%
String Foto ="";
%>
<header>
    <nav class="indigo darken-3" style="padding-bottom: 70px;">
        <a href="#" data-activates="slide-out" class="button-collapse show-on-large" style="margin: 0px 10px;"><i class="mdi-navigation-menu"></i></a>
        <ul id="slide-out" class="side-nav indigo darken-3">
            <li><img class="responsive-img circle" src= "<%="images/Usuarios/"+Foto%>" style="max-width: 300px; height: auto; margin: 15px 15px;"></li>
            
            <li>Menú Principal</li>
            <li><a href="Usuarios.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Usuarios</a></li>
            <li><a href="Arrendatarios.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Arrendatarios</a></li>
            <li><a href="Pagos.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Pagos</a></li>
            <li><a href="Propietarios.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Propietarios</a></li>
            <li><a href="Multas.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Multas</a></li>
            <li><a href="Visitas.jsp" style="color:#e8eaf6;text-shadow: black 0.1em 0.1em 0.2em;">Visitas</a></li>
            



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
            <li><a href="MenuPrincipal.jsp"><i class="small mdi-action-home"></i></a></li>
            <li><a href="Registrarse.jsp">Registrese</a></li>
            <li><a href="login.jsp">Inicie sesión</a></li>
            <li><a class="dropdown-button indigo darken-3" href="#!" data-activates="dropdown1">Poli-Leaing-Pro<i class="small mdi-navigation-arrow-drop-down right"></i></a></li>
            <ul id='dropdown1' class='dropdown-content indigo darken-3'>
                <li><a href="MenuPrincipal.jsp?quien=quien.jsp" style="color:#fff;">Quienes Somos</a></li>
                <li><a href="#!" style="color:#fff;">Contactenos</a></li>
                <li><a href="#!" style="color:#fff;">Mision</a></li>
                <li><a href="#!" style="color:#fff;">Vision</a></li>
            </ul>
        </ul>
    </nav>
</header>
