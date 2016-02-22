
package Clases;

public class Arrendatarios {
    private String idarrendatario;
    private String nombre;
    private String apellido;
    private String direccion;
    private String telfijo;
    private String telcel;
    private String email;
    private String profesion;
    private String hijos;
    
    public Arrendatarios(String idarrendatario, String nombre, String apellido,
            String direccion, String telfijo, String telcel, String email, String profesion, String hijos) {
        this.idarrendatario = idarrendatario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.telfijo = telfijo;
        this.telcel = telcel;
        this.email = email;
        this.profesion = profesion;
        this.hijos = hijos;
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

    public String getTelfijo() {
        return telfijo;
    }

    public void setTelfijo(String telfijo) {
        this.telfijo = telfijo;
    }

    public String getIdarrendatario() {
        return idarrendatario;
    }

    public void setIdarrendatario(String idarrendatario) {
        this.idarrendatario = idarrendatario;
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

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
}
     public String getHijos() {
        return hijos;
    }

    public void setHijos(String hijos) {
        this.hijos = hijos;
    }
    }
