package Clases;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Datos {

    private Connection cnn;

    public Datos() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/poli-leasing";
            cnn = DriverManager.getConnection(db, "root", "");
        } catch (Exception ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void CerrarConexion() {
        try {
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String ValidarUsuario(String usuario, String clave) {
        try {
            String sql = "select tipodeusuario from usuario where idusuario ='" + usuario + "' and clave ='" + clave + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getString("tipodeusuario");
            } else {
                return "no ok";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return "no ok";
        }
    }
    //////////Usuarios/////////////

    public Usuario getUsuario(String idusuario) {
        try {
            Usuario miusu = null;
            String sql = "select * from usuario where "
                    + "idusuario ='" + idusuario + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miusu = new Usuario(
                        rs.getString("idusuario"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("clave"),
                        rs.getString("tipodeusuario"),
                        rs.getString("foto"),
                        rs.getString("correo"),
                        rs.getString("estado"));

            }
            return miusu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Usuario getUsuarioParametros(String campo, String valor) {
        try {
            Usuario miusu = null;
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getUsuarioParametros(campo, valor));
            if (rs.next()) {
                //    idusuario,nombre,apellido,clave,tipodeusuario

                miusu = new Usuario(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));
            }
            return miusu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
       public String ListaVerUsuarios(String campo, String valor) {
        try {
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getVerUsuario(campo, valor));
            /*
             idusuario,nombre,apellido,clave,tipodeusuario  
             */
            if (rs.next()) {
                return "Existe";
            } else {
                return "no Existe";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return "no Existe";
        }
    }
    
    public List<Usuario> ListaUsuarios() {
        List<Usuario> resul = new ArrayList<Usuario>();
        try {
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getUsuario());
            /*
            
             idusuario,nombre,apellido,clave,tipodeusuario  
             */

            while (rs.next()) {
                Usuario p = new Usuario();
                p.setIdusuario(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setApellido(rs.getString(3));
                p.setTipodeusuario(rs.getString(5));
                p.setFoto(rs.getString(6));
                p.setCorreo(rs.getString(7));
                resul.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return resul;
    }

    public List<Usuario> ListaUsuarios(String campo, String valor) {
        List<Usuario> resul = new ArrayList<Usuario>();
        try {
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getUsuarioParametros(campo, valor));

            /*
             idusuario,nombre,apellido,clave,tipodeusuario  
             */
            while (rs.next()) {
                Usuario p = new Usuario();
                p.setIdusuario(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setApellido(rs.getString(3));
                p.setTipodeusuario(rs.getString(5));
                p.setFoto(rs.getString(6));
                p.setCorreo(rs.getString(7));
                resul.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return resul;
    }

    public void NewUsuario(Usuario miusu) {
        try {
            PreparedStatement st = cnn.prepareStatement("insert into usuario values(?,?,?,?,?,?,?,?)");
            st.setString(1, miusu.getIdusuario());
            st.setString(2, miusu.getNombre());
            st.setString(3, miusu.getApellido());
            st.setString(4, miusu.getClave());
            st.setString(5, miusu.getTipodeusuario());
            st.setString(6, miusu.getFoto());
            st.setString(7, miusu.getCorreo());
            st.setString(8, miusu.getEstado());
            st.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateUsuario(Usuario miusu) {
        try {
            String sql = "update usuario set "
                    + "nombre ='" + miusu.getNombre() + "',"
                    + "apellido ='" + miusu.getApellido() + "',"
                    + "clave ='" + miusu.getClave() + "',"
                    + "tipodeusuario ='" + miusu.getTipodeusuario() + "',"
                    + "foto ='" + miusu.getFoto() + "'"
                    + "correo ='" + miusu.getCorreo() + "'"
                    + "where idusuario ='" + miusu.getIdusuario() + "'";

            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void DeleteUsuario(String idusuario) {
        try {
            String sql = "delete from usuario where "
                    + "idusuario ='" + idusuario + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getUsuarios() {
        try {
            Usuario miusu = null;
            String sql = "select * from usuario";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
        public String getConseFoto() {
        try {
            String miusu = "00001";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getConsecutivoFoto());
            while (rs.next()) {
                miusu = rs.getString(1);
            }
            return miusu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    /////////////////Inmuebles///////////////////

    public Inmuebles getInmueble(String idinmueble) {
        try {
            Inmuebles miinmu = null;
            String sql = "select * from inmueble where "
                    + "idinmueble ='" + idinmueble + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miinmu = new Inmuebles(
                        rs.getString("idinmueble"),
                        rs.getString("direccion"),
                        rs.getString("imagen"),
                        rs.getString("barrio"),
                        rs.getString("nhabitaciones"),
                        rs.getString("piso"),
                        rs.getString("estado"),
                        rs.getString("descripcion"),
                        rs.getString("estrato"),
                        rs.getString("ciudad"),
                        rs.getInt("precio"),
                        rs.getString("bano"),
                        rs.getString("enchape"),
                        rs.getString("cocina"),
                        rs.getString("tipo"),
                        rs.getString("area"),
                        rs.getString("garaje"));

            }
            return miinmu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Inmuebles getInmueblesParametros(String campo, String valor) {
        try {
            Inmuebles miinmu = null;
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getInmueblesParametros(campo, valor));
            if (rs.next()) {
                //    idusuario,nombre,apellido,clave,tipodeusuario            //

                miinmu = new Inmuebles(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17));
            }
            return miinmu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public List<Inmuebles> ListaInmueble() {
        List<Inmuebles> resul = new ArrayList<Inmuebles>();
        try {
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getInmuebles());
            /*
             String idinmueble, String direccion, String imagen,
             String barrio, String nhabitaciones, String piso, String estado,
             String descripcion, String estrato, String ciudad, int precio 
             */

            while (rs.next()) {
                Inmuebles p = new Inmuebles();
                p.setIdinmueble(rs.getString(1));
                p.setDireccion(rs.getString(2));
                p.setImagen(rs.getString(3));
                p.setBarrio(rs.getString(4));
                p.setNhabitaciones(rs.getString(5));
                p.setPiso(rs.getString(6));
                p.setEstado(rs.getString(7));
                p.setDescripcion(rs.getString(8));
                p.setEstrato(rs.getString(9));
                p.setCiudad(rs.getString(10));
                p.setPrecio(rs.getInt(11));
                p.setBano(rs.getString(12));
                p.setEnchape(rs.getString(13));
                p.setCocina(rs.getString(14));
                p.setTipo(rs.getString(15));
                p.setArea(rs.getString(16));
                p.setGaraje(rs.getString(17));
                resul.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return resul;
    }

    public List<Inmuebles> ListaInmuebles(String campo, String valor) {
        List<Inmuebles> resul = new ArrayList<Inmuebles>();
        try {
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getInmueblesParametros(campo, valor));

            /*
             idusuario,nombre,apellido,clave,tipodeusuario  
             */
            while (rs.next()) {
                Inmuebles p = new Inmuebles();
                p.setIdinmueble(rs.getString(1));
                p.setDireccion(rs.getString(2));
                p.setImagen(rs.getString(3));
                p.setBarrio(rs.getString(4));
                p.setNhabitaciones(rs.getString(5));
                p.setPiso(rs.getString(6));
                p.setEstado(rs.getString(7));
                p.setDescripcion(rs.getString(8));
                p.setEstrato(rs.getString(9));
                p.setCiudad(rs.getString(10));
                p.setPrecio(rs.getInt(11));
                p.setBano(rs.getString(12));
                p.setEnchape(rs.getString(13));
                p.setCocina(rs.getString(14));
                p.setTipo(rs.getString(15));
                p.setArea(rs.getString(16));
                p.setGaraje(rs.getString(17));
                resul.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return resul;
    }

    public void NewInmueble(Inmuebles miinmu) {
        try {
            String sql = "insert into inmueble values('"
                    + miinmu.getIdinmueble() + "','"
                    + miinmu.getDireccion() + "','"
                    + miinmu.getImagen() + "','"
                    + miinmu.getBarrio() + "','"
                    + miinmu.getNhabitaciones() + "','"
                    + miinmu.getPiso() + "','"
                    + miinmu.getEstado() + "','"
                    + miinmu.getDescripcion() + "','"
                    + miinmu.getEstrato() + "','"
                    + miinmu.getCiudad() + "',"
                    + miinmu.getPrecio() + ",'"
                    + miinmu.getBano() + "','"
                    + miinmu.getEnchape() + "','"
                    + miinmu.getCocina() + "','"
                    + miinmu.getTipo() + "','"
                    + miinmu.getArea() + "','"
                    + miinmu.getGaraje() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateInmueble(Inmuebles miinmu) {
        try {
            String sql = "update inmueble set "
                    + "direccion ='" + miinmu.getDireccion() + "',"
                    + "imagen ='" + miinmu.getImagen() + "',"
                    + "barrio ='" + miinmu.getBarrio() + "',"
                    + "nhabitaciones ='" + miinmu.getNhabitaciones() + "',"
                    + "piso ='" + miinmu.getPiso() + "',"
                    + "estado ='" + miinmu.getEstado() + "',"
                    + "descripcion ='" + miinmu.getDescripcion() + "',"
                    + "estrato ='" + miinmu.getEstrato() + "',"
                    + "ciudad ='" + miinmu.getCiudad() + "',"
                    + "precio = " + miinmu.getPrecio() + ", "
                    + "bano = '" + miinmu.getBano() + "', "
                    + "enchape = '" + miinmu.getEnchape() + "', "
                    + "cocina = '" + miinmu.getCocina() + "', "
                    + "tipo = '" + miinmu.getTipo() + "', "
                    + "area = '" + miinmu.getArea() + "', "
                    + "garaje = '" + miinmu.getGaraje() + "' "
                    + "where idinmueble ='" + miinmu.getIdinmueble() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DeleteInmueble(String idinmueble) {
        try {
            String sql = "delete from inmueble where "
                    + "idinmueble='" + idinmueble + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getInmuebles() {
        try {
            Inmuebles miinmu = null;
            String sql = "select * from inmueble";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String getConseInmueble() {
        try {
            String miusu = "00001";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getConsecutivoInmueble());
            while (rs.next()) {
                miusu = rs.getString(1);
            }
            return miusu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /////////////////Multas///////////////////
    public Multas getMulta(String codigo) {
        try {
            Multas mimul = null;
            String sql = "select * from multas where "
                    + "codigo ='" + codigo + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                mimul = new Multas(
                        rs.getString("codigo"),
                        rs.getDate("fecha"),
                        rs.getString("valor"),
                        rs.getString("descripcion"));
            }
            return mimul;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void NewMulta(Multas mimul) {
        try {
            String sql = "insert into multas values('"
                    + mimul.getCodigo() + "','"
                    + Utilidades.formatDate(mimul.getFecha()) + "','"
                    + mimul.getValor() + "','"
                    + mimul.getDescripcion() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateMulta(Multas mimul) {
        try {
            String sql = "update multas set "
                    + "fecha ='" + Utilidades.formatDate(mimul.getFecha()) + "',"
                    + "valor ='" + mimul.getValor() + "',"
                    + "descripcion ='" + mimul.getDescripcion() + "'"
                    + "where codigo ='" + mimul.getCodigo() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DeleteMultas(String codigo) {
        try {
            String sql = "delete from multas where "
                    + "codigo ='" + codigo + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getMultas() {
        try {
            Multas mimul = null;
            String sql = "select * from multas";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    //////////////////Arrendatarios////////////

    public Arrendatarios getArrendatario(String idarrendatario) {
        try {
            Arrendatarios miarren = null;
            String sql = "select * from arrendatario where "
                    + "idarrendatario ='" + idarrendatario + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miarren = new Arrendatarios(
                        rs.getString("idarrendatario"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("direccion"),
                        rs.getString("telfijo"),
                        rs.getString("telcel"),
                        rs.getString("e-mail"),
                        rs.getString("profesion"),
                        rs.getString("hijos"));
            }
            return miarren;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void NewArrendatario(Arrendatarios miarren) {
        try {
            String sql = "insert into arrendatario values('"
                    + miarren.getIdarrendatario() + "','"
                    + miarren.getNombre() + "','"
                    + miarren.getApellido() + "','"
                    + miarren.getDireccion() + "','"
                    + miarren.getTelfijo() + "','"
                    + miarren.getTelcel() + "','"
                    + miarren.getEmail() + "','"
                    + miarren.getProfesion() + "','"
                    + miarren.getHijos() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdateArrendatario(Arrendatarios miusu) {
        try {
            String sql = "update arrendatario set "
                    + "nombre ='" + miusu.getNombre() + "',"
                    + "apellido ='" + miusu.getApellido() + "',"
                    + "direccion ='" + miusu.getDireccion() + "',"
                    + "telfijo ='" + miusu.getTelfijo() + "',"
                    + "telcel ='" + miusu.getTelcel() + "',"
                    + "e-mail ='" + miusu.getEmail() + "',"
                    + "profesion ='" + miusu.getProfesion() + "',"
                    + "hijos ='" + miusu.getHijos() + "' "
                    + "where idarrendatario ='" + miusu.getIdarrendatario() + "'";

            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void DeleteArrendatario(String idarrendatario) {
        try {
            String sql = "delete from arrendatario where "
                    + "idarrendatario='" + idarrendatario + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getArrendatarios() {
        try {
            Arrendatarios miarren = null;
            String sql = "select * from arrendatario";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /////////////Pagos////////////
    public ResultSet getDetallePagotmpp() {
        try {
            String sql = "select * from detallepagotmp";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getDetallePagotmp(String act) {
        try {
            DetallePagotmp mideta = null;
            String sql = "select * from detallepagotmp where IdActor='" + act + "' ";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int getTotalSaldo(String act) {
        try {
            int total = 0;
            String sql = "select sum(total) as suma from detallepagotmp where IdActor='" + act + "' ";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt("suma");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int getTotal(String act) {
        try {
            int total = 0;
            String sql = "select precio - total as resta from detallepagotmp where IdActor='" + act + "' ";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt("resta");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public void newDetalleFactura(DetallePagotmp mideta) {
        try {
            //saber si esta
            String sql = "select(1) from detallepagotmp where idInmueble ='" + mideta.getIdInmueble() + "' ";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            sql = "insert into detallepagotmp values ('"
                    + Utilidades.formatDate(mideta.getFecha()) + "','"
                    + mideta.getIdInmueble() + "','"
                    + mideta.getIdActor() + "',"
                    + mideta.getPrecio() + ",'"
                    + mideta.getDescripcion() + "',"
                    + mideta.getTotal() + ",'"
                    + mideta.getNombreBanco() + "','"
                    + mideta.getReferencia() + "')";

            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getPrecio(String idinmueble) {
        try {
            String sql = "select precio from inmueble where "
                    + "idinmueble ='" + idinmueble + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getInt("precio");
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public ResultSet getResutset(String sql) {
        try {
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String getConse() {
        try {
            String miusu = "00000001";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getConsecutivo());
            if (rs.next()) {
                miusu = rs.getString(1);
            }
            return miusu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String getConseMulta() {
        try {
            String miusu = "00001";

            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getConsecutivoMulta());
            while (rs.next()) {
                miusu = rs.getString(1);
            }
            return miusu;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    //////////////////contrato arrenda/////////////////////

    public void newContratoArrenda(ContraArrenda cona) {
        try {
            //saber si esta

            String sql = "insert into contraarrenda values ('"
                    + cona.getCodigo() + "','"
                    + cona.getInmueble() + "','"
                    + cona.getArrendat() + "','"
                    + Utilidades.formatDate(cona.getFecha()) + "','"
                    + cona.getDescripcion() + "',"
                    + cona.getValor() + ",'"
                    + Utilidades.formatDate(cona.getFechaMax()) + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    ///////////////////////////imagen///////////////////////////
    public Imagen getImagen(String inmueble) {
        try {
            Imagen miima = null;
            String sql = "select * from imagenes where "
                    + "inmueble ='" + inmueble + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miima = new Imagen(
                        rs.getString("inmueble"),
                        rs.getString("imagen"));
            }
            return miima;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void NewImagen(Imagen miima) {
        try {
            String sql = "insert into imagenes values('"
                    + miima.getInmueble() + "','"
                    + miima.getImagen() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateUImagen(Imagen miima) {
        try {
            String sql = "update imagenes set "
                    + "imagen ='" + miima.getImagen() + "',"
                    + "where inmueble ='" + miima.getInmueble() + "'";

            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    /////////////////////propietarios///////////////////////

    public Propietario getPropietarios() {
        try {
            Propietario c;
            LSL lista = new LSL();
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getPropietario());
            while (rs.next()) {
                lista.InsertarOrdenado(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
            c = lista.getCabeza();
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void Newlista(Propietario miusu) {
        try {
            String sql = "insert into propietario values('"
                    + miusu.getIdpropietario() + "','"
                    + miusu.getNombre() + "','"
                    + miusu.getApellido() + "','"
                    + miusu.getTelfijo() + "','"
                    + miusu.getTelcel() + "','"
                    + miusu.getEmail() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateLista(Propietario miusu) {
        try {
            String sql = "update propietario set "
                    + "nombre ='" + miusu.getNombre() + "',"
                    + "apellido ='" + miusu.getApellido() + "',"
                    + "telfijo ='" + miusu.getTelfijo() + "',"
                    + "telcel ='" + miusu.getTelcel() + "',"
                    + "email ='" + miusu.getEmail() + "'"
                    + "where idpropietario ='" + miusu.getIdpropietario() + "'";

            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void DeleteLista(String idpro) {
        try {
            String sql = "delete from propietario where "
                    + "idpropietario ='" + idpro + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /*
     public void DeleteUsuario(String idusuario) {
     try {
     String sql = "delete from usuario where "
     + "idusuario ='" + idusuario + "'";
     Statement st = cnn.createStatement();
     st.executeUpdate(sql);
     } catch (SQLException ex) {
     Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
     }
     }

     public ResultSet getUsuarios() {
     try {
     Usuario miusu = null;
     String sql = "select * from usuario";
     Statement st = cnn.createStatement();
     return st.executeQuery(sql);
     } catch (SQLException ex) {
     Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
     return null;
     }
     }
     */

    public ResultSet getInmueblesp(int num, int num2) {
        try {
            Inmuebles miinmu = null;
            String sql = "select * from inmueble LIMIT " + num + "," + num2;
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getInmueblescuantos() {
        try {
            String sql = " SELECT COUNT(*) FROM inmueble where estado = 'Libre' ";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
      ///////////////////////////////Visitas////////////////////////////////////////

    public Visitas getVisitas(Visitas RC) {
        try {
            LDLCRC lista = new LDLCRC();
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(Sqlhelpers.getVisitas());
            while (rs.next()) {
                lista.InsertarBD(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        RC);
            }
            lista.ImprimirLista(RC);
            return RC;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void NewVisita(Visitas mivisi) {
        try {
            String sql = "insert into visitas values('"
                    + mivisi.getCodigo() + "','"
                    + mivisi.getIdinmueble() + "','"
                    + mivisi.getDocumento() + "','"
                    + mivisi.getNombre() + "','"
                    + mivisi.getApellido() + "','"
                    + mivisi.getDireccion() + "','"
                    + mivisi.getCorreo() + "','"
                    + mivisi.getTelfijo() + "','"
                    + mivisi.getTelcel() + "','"
                    + mivisi.getFecha() + "','"
                    + mivisi.getHoraini() + "','"
                    + mivisi.getHorafin() + "','"
                    + mivisi.getObserva() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateVisita(Visitas mivisi) {
        try {
            String sql = "update visitas set "
                    + "idinmueble= '" + mivisi.getIdinmueble() + "',"
                    + "documento='" + mivisi.getDocumento() + "',"
                    + "nombre='" + mivisi.getNombre() + "',"
                    + "apellido='" + mivisi.getApellido() + "',"
                    + "direccion='" + mivisi.getDireccion() + "',"
                    + "correo='" + mivisi.getCorreo() + "',"
                    + "telfijo='" + mivisi.getTelfijo() + "',"
                    + "telcel='" + mivisi.getTelcel() + "',"
                    + "fecha='" + mivisi.getFecha() + "',"
                    + "horaini='" + mivisi.getHoraini() + "',"
                    + "horafin='" + mivisi.getHorafin() + "',"
                    + "observa='" + mivisi.getObserva() + "'"
                    + "where codigo ='" + mivisi.getCodigo() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void DeleteVisita(String codigo) {
        try {
            String sql = "delete from visitas where "
                    + "codigo ='" + codigo + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
