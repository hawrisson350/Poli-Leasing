package Clases;

/*
 * @author Hawrisson Avendaño
 * 
 * Creación del nodo Visitas

 * idinmueble
 * documento
 * nombre
 * apellido
 * direccion
 * correo
 * telfijo
 * telcel
 * fecha
 * horaini
 * horafin
 * observa
 */

public class Visitas {
    
    public String codigo;
    public String idinmueble;
    public String documento;
    public String nombre;
    public String apellido;
    public String direccion;
    public String correo;
    public String telfijo;
    public String telcel;
    public String fecha;
    public String horaini;
    public String horafin;
    public String observa;
    public String esta;
    public Visitas LD;
    public Visitas LI;
    
    /*
     * Contructores queinicializa los atributos de una visita.
    
     * @param codigo          se le asigna a la visita un codigo
     * @param idinmueble      se le asigna a la visita la identificacion de un inmueble
     * @param documento       se le asigna la identificación, al visitante que se esta creando
     * @param nombre          se le asigna el nombre, al visitante que se esta creando
     * @param apellido        se le asigna el apellido, al visitante que se esta creando
     * @param direccion       se le asigna el direccion, al visitante que se esta creando
     * @param correo          se le asigna el correo, al visitante que se esta creando
     * @param telfijo         se le asigna el telfijo, al visitante que se esta creando
     * @param telcel          se le asigna el telcel, al visitante que se esta creando
     * @param fecha           se le asigna de fecha, al visitante que se esta creando
     * @param horaini         se le asigna de fecha, al visitante que se esta creando
     * @param horafin         se le asigna de fecha, al visitante que se esta creando
     * @param observa         se le asigna de fecha, al visitante que se esta creando
     * @param esta            se le asigna un estado al nodo que se esta creando
     * @return                no retorna.
     */

    public Visitas(String codigo,String idinmueble, String documento, String nombre, String apellido, String direccion, String correo, String telfijo, String telcel, String fecha, String horaini, String horafin, String observa, String esta) {
        this.codigo = codigo;
        this.idinmueble = idinmueble;
        this.documento = documento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.correo = correo;
        this.telfijo = telfijo;
        this.telcel = telcel;
        this.fecha = fecha;
        this.horaini = horaini;
        this.horafin = horafin;
        this.observa = observa;
        this.esta = esta;
    }
    
    /*
     * Este contructor inicializa el nodo.
     * 
     * @return                  no retorna.
     */

    public Visitas() {
        this.codigo = "";
        this.idinmueble = "";
        this.documento = "";
        this.nombre = "";
        this.apellido = "";
        this.direccion = "";
        this.correo = "";
        this.telfijo = "";
        this.telcel = "";
        this.fecha = "";
        this.horaini = "";
        this.horafin = "";
        this.observa = "";
        this.esta = "";
        this.LD = null;
        this.LI = null;
    }
    
    /*
     * Los siguientes metodos asignan y devuelven cada uno de los campos del nodo Visitas.
     */
    
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getIdinmueble() {
        return idinmueble;
    }

    public void setIdinmueble(String idinmueble) {
        this.idinmueble = idinmueble;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelfijo() {
        return telfijo;
    }

    public void setTelfijo(String telfijo) {
        this.telfijo = telfijo;
    }

    public String getTelcel() {
        return telcel;
    }

    public void setTelcel(String telcel) {
        this.telcel = telcel;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraini() {
        return horaini;
    }

    public void setHoraini(String horaini) {
        this.horaini = horaini;
    }

    public String getHorafin() {
        return horafin;
    }

    public void setHorafin(String horafin) {
        this.horafin = horafin;
    }

    public String getObserva() {
        return observa;
    }

    public void setObserva(String observa) {
        this.observa = observa;
    }

    public String getEsta() {
        return esta;
    }

    public void setEsta(String esta) {
        this.esta = esta;
    }

    public Visitas getLD() {
        return LD;
    }

    public void setLD(Visitas LD) {
        this.LD = LD;
    }

    public Visitas getLI() {
        return LI;
    }

    public void setLI(Visitas LI) {
        this.LI = LI;
    }

    
}
