/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 idinmueble,direccion,imagen,barrio,nhabitaciones,piso,estado,descripcion,estrato,ciudad,precio,bano,enchape,cocina,tipo,area,garaje
 */
package Clases;

public class Sqlhelpers {

    public static String getUsuarioParametros(String campo, String Valor) {
        return "select idusuario,nombre,apellido,clave,tipodeusuario,foto,correo,estado from usuario where " + campo + "  like   '%" + Valor + "%'   ";
    }

    public static String getUsuario() {
        return "select idusuario,nombre,apellido,clave,tipodeusuario,foto,correo,estado from usuario ";
    }
    
    public static String getVerUsuario(String campo, String Valor) {
        return "select "+campo+" from usuario where " + campo + "  like   '%" + Valor + "%'   ";
    }

    public static String getInmueblesParametros(String campo, String Valor) {
        return "select idinmueble,direccion,imagen,barrio,nhabitaciones,piso,estado,descripcion,estrato,ciudad,precio,bano,enchape,cocina,tipo,area,garaje from inmueble where " + campo + " like '%" + Valor + "%' ;";

    }

    public static String getInmuebles() {
        return "select idinmueble,direccion,imagen,barrio,nhabitaciones,piso,estado,descripcion,estrato,ciudad,precio,bano,enchape,cocina,tipo,area,garaje from inmueble";

    }

    public static String getConsecutivo() {
        return "SELECT Lpad( max( cast( codigo AS signed ) ) +1, 8, '0' )  FROM contraarrenda";
    }

    public static String getConsecutivoMulta() {
        return "SELECT Lpad( max( cast( codigo AS signed ) ) +1, 5, '0' )  FROM multas";
    }

    public static String getPropietario() {
        return "select idpropietario,nombre,apellido,telfijo,telcel,email from propietario ";
    }

    public static String getConsecutivoInmueble() {
        return "SELECT Lpad( max( cast( idinmueble AS signed ) ) +1, 5, '0' )  FROM inmueble";
    }
    
    public static String getConsecutivoFoto() {
        return "SELECT Lpad( max( cast( foto AS signed ) ) +1, 5, '0' )  FROM usuario";
    }
    
    public static String getVisitas() {
        return "SELECT codigo,idinmueble,documento,nombre,apellido,direccion,correo,telfijo,telcel,fecha,horaini,horafin,observa FROM visitas ";
    }
}
