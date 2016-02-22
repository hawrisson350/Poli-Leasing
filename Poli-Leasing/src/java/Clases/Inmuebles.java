/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

public class Inmuebles {

    private String idinmueble;
    private String direccion;
    private String imagen;
    private String barrio;
    private String nhabitaciones;
    private String piso;
    private String estado;
    private String descripcion;
    private String estrato;
    private String ciudad;
    private int precio;
    private String bano;
    private String enchape;
    private String cocina;
    private String tipo;
    private String area;
    private String garaje;

    public Inmuebles() {
    }

    public Inmuebles(String idinmueble, String direccion, String imagen,
            String barrio, String nhabitaciones, String piso, String estado,
            String descripcion, String estrato, String ciudad, int precio,
            String bano, String enchape, String cocina, String tipo, String area, String garaje) {
        this.idinmueble = idinmueble;
        this.direccion = direccion;
        this.imagen = imagen;
        this.barrio = barrio;
        this.nhabitaciones = nhabitaciones;
        this.piso = piso;
        this.estado = estado;
        this.descripcion = descripcion;
        this.estrato = estrato;
        this.ciudad = ciudad;
        this.precio = precio;
        this.bano = bano;
        this.enchape = enchape;
        this.cocina = cocina;
        this.tipo = tipo;
        this.area = area;
        this.garaje = garaje;
    }

    public String getBano() {
        return bano;
    }

    public void setBano(String bano) {
        this.bano = bano;
    }

    public String getEnchape() {
        return enchape;
    }

    public void setEnchape(String enchape) {
        this.enchape = enchape;
    }

    public String getCocina() {
        return cocina;
    }

    public void setCocina(String cocina) {
        this.cocina = cocina;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getGaraje() {
        return garaje;
    }

    public void setGaraje(String garaje) {
        this.garaje = garaje;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEstrato() {
        return estrato;
    }

    public void setEstrato(String estrato) {
        this.estrato = estrato;
    }

    public String getIdinmueble() {
        return idinmueble;
    }

    public void setIdinmueble(String idinmueble) {
        this.idinmueble = idinmueble;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getNhabitaciones() {
        return nhabitaciones;
    }

    public void setNhabitaciones(String nhabitaciones) {
        this.nhabitaciones = nhabitaciones;
    }

    public String getPiso() {
        return piso;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

}
