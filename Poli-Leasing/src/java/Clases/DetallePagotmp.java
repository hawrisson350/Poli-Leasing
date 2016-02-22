package Clases;

import java.util.Date;

public class DetallePagotmp {
    private Date fecha;
    private String idInmueble;
    private String idActor;
    private int precio;
    private String descripcion;
    private int total;
    private String nombreBanco;
    private String referencia;
    
    public DetallePagotmp() {
    }
    
    public DetallePagotmp(Date fecha,String idInmueble, String idActor, int precio,
            String descripcion,int total,String nombreBanco, String referencia) {
        this.fecha = fecha;
        this.idInmueble = idInmueble;
        this.idActor = idActor;
        this.precio = precio;
        this.descripcion = descripcion;
        this.total = total;
        this.nombreBanco = nombreBanco;
        this.referencia = referencia;
    }

    public String getNombreBanco() {
        return nombreBanco;
    }

    public void setNombreBanco(String nombreBanco) {
        this.nombreBanco = nombreBanco;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getIdInmueble() {
        return idInmueble;
    }

    public void setIdInmueble(String idInmueble) {
        this.idInmueble = idInmueble;
    }

    public String getIdActor() {
        return idActor;
    }

    public void setIdActor(String idActor) {
        this.idActor = idActor;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
