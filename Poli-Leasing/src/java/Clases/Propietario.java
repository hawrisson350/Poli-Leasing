/**
 * @author Hawrisson Avendaño
 * 
 * Creación del nodo Propietarios

 * idpropietario
 * nombre
 * apellido
 * direccion
 * telfijo
 * telcel
 * email
 */

package Clases;

public class Propietario {
    private String idpropietario;
    private String nombre;
    private String apellido;
    private String telfijo;
    private String telcel;
    private String email;
    private String esta;
    Propietario liga;

     /**
     * Contructores queinicializa los atributos de un propietario.
     * 
     * @param idpropietario      se le asigna la identificación, al propietario que se esta creando
     * @param nombre             se le asigna el nombre, al propietario que se esta creando
     * @param apellido              se le asigna el apellido, al propietario que se esta creando
     * @param telfijo              se le asigna el telfijo, al propietario que se esta creando
     * @param telcel              se le asigna el telcel, al propietario que se esta creando
     * @param email              se le asigna el email, al propietario que se esta creando
     * @param esta              se le asigna un estado al nodo que se esta creando
     * @noreturn                  no retorna.
     */
           
    public Propietario(String idpropietario, String nombre, String apellido, String telfijo, String telcel, String email,String esta) {
        this.idpropietario = idpropietario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telfijo = telfijo;
        this.telcel = telcel;
        this.email = email;
        this.esta = esta;
    }
    
    /*
     * Este contructor inicializa el nodo.
     * 
     * @return                  no retorna.
     */
    
    public Propietario(){
        this.idpropietario = "";
        this.nombre = "";
        this.apellido = "";
        this.telfijo = "";
        this.telcel = "";
        this.email = "";
        this.esta = "";
        this.liga = null;
    }

    /*
     * Los siguientes metodos asignan y devuelven cada uno de los campos del nodo Propietario.
     */
    
    public String getEsta() {
        return esta;
    }

    public void setEsta(String esta) {
        this.esta = esta;
    }
    
    
    public String getIdpropietario() {
        return idpropietario;
    }

    public void setIdpropietario(String idpropietario) {
        this.idpropietario = idpropietario;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Propietario getLiga() {
        return liga;
    }

    public void setLiga(Propietario liga) {
        this.liga = liga;
    }
    
}
