
<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.Utilidades"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Datos"%>
<%@page import="Clases.Inmuebles"%>
<script>
    Paginador = function (divPaginador, tabla, tamPagina)
    {
        this.miDiv = divPaginador; //un DIV donde irán controles de paginación
        this.tabla = tabla;           //la tabla a paginar
        this.tamPagina = tamPagina; //el tamaño de la página (filas por página)
        this.pagActual = 1;         //asumiendo que se parte en página 1
        this.paginas = Math.floor((this.tabla.rows.length - 1) / this.tamPagina); //¿?

        this.SetPagina = function (num)
        {
            if (num < 0 || num > this.paginas)
                return;

            this.pagActual = num;
            var min = 1 + (this.pagActual - 1) * this.tamPagina;
            var max = min + this.tamPagina - 1;

            for (var i = 1; i < this.tabla.rows.length; i++)
            {
                if (i < min || i > max)
                    this.tabla.rows[i].style.display = 'none';
                else
                    this.tabla.rows[i].style.display = '';
            }
            this.miDiv.firstChild.rows[0].cells[1].innerHTML = this.pagActual;
        }

        this.Mostrar = function ()
        {
            //Crear la tabla
            var tblPaginador = document.createElement('table');

            //Agregar una fila a la tabla
            var fil = tblPaginador.insertRow(tblPaginador.rows.length);

            //Ahora, agregar las celdas que serán los controles
            var ant = fil.insertCell(fil.cells.length);
            ant.innerHTML = 'Anterior';
            ant.className = 'pag_btn waves-effect waves-light btn indigo darken-3'; //con eso le asigno un estilo
            var self = this;
            ant.onclick = function ()
            {
                if (self.pagActual == 1)
                    return;
                self.SetPagina(self.pagActual - 1);
            }

            var num = fil.insertCell(fil.cells.length);
            num.innerHTML = ''; //en rigor, aún no se el número de la página
            num.className = 'pag_num waves-effect waves-light btn indigo darken-2';

            var sig = fil.insertCell(fil.cells.length);
            sig.innerHTML = 'Siguiente';
            sig.className = 'pag_btn waves-effect waves-light btn indigo darken-3';
            sig.onclick = function ()
            {
                if (self.pagActual == self.paginas)
                    return;
                self.SetPagina(self.pagActual + 1);
            }

            //Como ya tengo mi tabla, puedo agregarla al DIV de los controles
            this.miDiv.appendChild(tblPaginador);

            //¿y esto por qué?
            if (this.tabla.rows.length - 1 > this.paginas * this.tamPagina)
                this.paginas = this.paginas + 1;

            this.SetPagina(this.pagActual);
        }
    }
</script>
<%
    Datos misdatos = new Datos();
    List<Inmuebles> LP = misdatos.ListaInmueble();
    String Foto = "", Estado = "";
%>

<div class="card indigo lighten-5">
    <form name="Lista" id="Lista" method="POST">
        <div class="card-content black-text">
            
            <table id="tblDatos" class="striped indigo lighten-4 responsive-table" style="margin-bottom: 20px;">
                <tbody>
                    <%  for (int i = 0; i < LP.size(); i++) {
                            Foto = LP.get(i).getImagen();
                            Estado = LP.get(i).getEstado();

                            if (Foto == null) {
                                Foto = "";
                            }
                            if (Foto.equals("")) {
                                Foto = "nocasa.jpg";
                            }

                            if (Foto == null) {
                                Foto = "";
                            }
                            if (!Estado.equals("Ocupado")) {%>
                    <tr> 
                        <td>
                            <table>
                                <tr>
                                    <td rowspan="5"><img src="<%="images/" + Foto%>" width="175" height="175" alt="no foto"/></td>
                                </tr>    
                                <tr>
                                    <td> Area: <%=LP.get(i).getArea()%>m<sup>2</sup></td>
                                    <td>Barrio: <%=LP.get(i).getBarrio()%></td>
                                    <td>Tipo: <%=LP.get(i).getTipo()%></td>
                                </tr>
                                <tr>
                                    <td>Número de habitaciones: <%=LP.get(i).getNhabitaciones()%></td>
                                    <td>Piso: <%=LP.get(i).getPiso()%></td>
                                    <td>Estado: <%=LP.get(i).getEstado()%></td>
                                </tr>
                                <tr>
                                    <td>Garaje: <%=LP.get(i).getGaraje()%></td>
                                    <td>Estrato: <%=LP.get(i).getEstrato()%></td>
                                    <td>Ciudad: <%=LP.get(i).getCiudad()%></td>
                                </tr>
                                <tr>
                                    <td>Precio: $<%=LP.get(i).getPrecio()%></td>
                                    <td>Baños: <%=LP.get(i).getBano()%></td>
                                    <td>Enchapado: <%=LP.get(i).getEnchape()%></td>                
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <% }
                        }%>

                </tbody>
            </table>
                        <div id="mensaje">Desliza para ver mas -></div>
                        <br>
            <div id="paginador" style="float: bottom"></div>
            <script type="text/javascript">
                var p = new Paginador(
                        document.getElementById('paginador'),
                        document.getElementById('tblDatos'),
                        3);
                p.Mostrar();
            </script>  
        </div>
    </form>
</div>