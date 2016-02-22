package Clases;

import javax.swing.JOptionPane;

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
public class LDLCRC {

    static Visitas cabeza;

    /*
     * Este es el constructructor de la clase, el cual permite inicializar la cabeza de la lista en null.
     * 
     * @return                  no retorna.
     */
    /*
     * Este es el constructructor de la clase, el cual permite crear el registro cabeza de la lista
     * 
     * @return                  no retorna.
     */
    public Visitas RC() {
        cabeza = new Visitas("","", "", "", "", "", "", "", "", "", "", "", "", "RC");
        cabeza.LD = cabeza;
        cabeza.LI = cabeza;
        setCabeza(cabeza);
        return cabeza;
    }

    /*
     * Este metodo permite realizar la insercion ordenada en la lista, asignando los respectivos atributos.
     * 
     * @param idpropietario      se le asigna la identificación, al propietario que se esta creando
     * @param nombre             se le asigna el nombre, al propietario que se esta creando
     * @param apellido              se le asigna el apellido, al propietario que se esta creando
     * @param direccion              se le asigna el direccion, al propietario que se esta creando
     * @param direccion              se le asigna el direccion, al propietario que se esta creando
     * @param telfijo              se le asigna el telfijo, al propietario que se esta creando
     * @param telcel              se le asigna el telcel, al propietario que se esta creando
     * @param email              se le asigna el email, al propietario que se esta creando
     * @param esta              se le asigna un estado al nodo que se esta creando
     * @return                  no retorna.
     */
    public void InsertarBD(String codigo, String idinmueble, String documento, String nombre, String apellido, String direccion, String correo, String telfijo, String telcel, String fecha, String horaini, String horafin, String observa, Visitas RC) {
        Visitas V = new Visitas(codigo,idinmueble, documento, nombre, apellido, direccion, correo, telfijo, telcel, fecha, horaini, horafin, observa, "BD");
        V.LD = RC.LD;
        V.LI = RC;
        (RC.LD).LI = V;
        RC.LD = V;
    }

    /*
     * Este metodo permite realizar la insercion ordenada en la lista, asignando los respectivos atributos.
     * 
     * @param idpropietario      se le asigna la identificación, al propietario que se esta creando
     * @param nombre             se le asigna el nombre, al propietario que se esta creando
     * @param apellido              se le asigna el apellido, al propietario que se esta creando
     * @param direccion              se le asigna el direccion, al propietario que se esta creando
     * @param direccion              se le asigna el direccion, al propietario que se esta creando
     * @param telfijo              se le asigna el telfijo, al propietario que se esta creando
     * @param telcel              se le asigna el telcel, al propietario que se esta creando
     * @param email              se le asigna el email, al propietario que se esta creando
     * @param esta              se le asigna un estado al nodo que se esta creando
     * @return                  no retorna.
     */
    public Visitas Insertar(String codigo, String idinmueble, String documento, String nombre, String apellido, String direccion, String correo, String telfijo, String telcel, String fecha, String horaini, String horafin, String observa, Visitas RC) {
        Visitas V = new Visitas(codigo,idinmueble, documento, nombre, apellido, direccion, correo, telfijo, telcel, fecha, horaini, horafin, observa, "NUEVO");
        V.LD = RC.LD;
        V.LI = RC;
        (RC.LD).LI = V;
        RC.LD=V;
        return V;
    }

    /*
     * Este metodo permite realizar una busqueda en la lista por codigo.
     * 
     * @param codigo             Es el codigo que se desea buscar en la lista
     * 
     * @return                  Retorna el Nodo o articulo que se desea buscar, en caso de no encontrarce, se retorna null.
     */
    public Visitas Buscar(String codigo, Visitas RC) {
        Visitas B = RC.LD;
        while (B != RC) {
            if (!B.getCodigo().equals(codigo)) {
                B = B.getLD();
            } else {
                return B;
            }
        }
        return null;
    }

    /*
     * Este metodo permite eliminar un Nodo o articulo de la lista.
     * 
     * @param codigo             Es el codigo que se desea buscar y eliminar
     * 
     * @return                  Retorna una valor logicico (boolean). True si el elmento fue elimnado, de otro modo retorna False.
     */
    /*public Propietario Eliminar(String idpropietario,Propietario c){
     Propietario Q,T = null;
     boolean bandera = true;
     Q = c;
     while(Q.getIdpropietario()!=idpropietario && bandera){
     if(Q.getLiga()!=null){
     T = Q;
     Q = Q.getLiga();
     }else{
     bandera = false;
     }
     }
        
     if(!bandera){
     return c;
     }else if(c==Q){
     c = Q.getLiga();
     }else{
     T.setLiga(Q.getLiga());
     }
     Q = null;
     System.gc();//Metodo garbage collector
     return c;
     }*/
    /*
     * Este metodo permite eliminar un Nodo o articulo de la lista.
     * 
     * @param codigo             Es el codigo que se desea buscar y eliminar
     * 
     * @return                  Retorna una valor logicico (boolean). True si el elmento fue elimnado, de otro modo retorna False.
     */
    public boolean EliminarLogico(String codigo, Visitas P) {
        Visitas B = null;
        int y = 0;
        while (P != null && y == 0) {
            B = P;
            if (!P.getCodigo().equals(codigo)) {
                P = P.getLD();
            } else {
                B.setEsta("BORRAR");
                y = 1;
            }
        }
        if (P == null && y == 0) {
            JOptionPane.showMessageDialog(null, "El dato no se encuentra");
            return false;
        } else {
            return true;
        }
    }

    /*
     * Este metodo permite modificar un Nodo especifico en la lista.
     * 
     * @param Nodo               este parametro es de tipo Nodo. Representa el articulo al cual se le desea realizar la modificación.
     * @param nombre             se le asigna el nombre enviado, al nombre del articulo que se desea modificar.
     * @param costo              se le asigna el costo enviado, al costo del articulo que se desea modificar.
     * @param valor              se le asigna el valor enviado, al valor del articulo que se desea modificar.
     * 
     * @return                   no retorna.
     */
    public void Modificar(Visitas N, String idinmueble, String documento, String nombre,
            String apellido, String direccion, String correo, String telfijo, String telcel,
            String fecha, String horaini, String horafin, String observa) {
        
        N.setIdinmueble(idinmueble);
        N.setDocumento(documento);
        N.setNombre(nombre);
        N.setApellido(apellido);
        N.setDireccion(direccion);
        N.setCorreo(correo);
        N.setTelfijo(telfijo);
        N.setTelcel(telcel);
        N.setFecha(fecha);
        N.setHoraini(horaini);
        N.setHorafin(horafin);
        N.setObserva(observa);
        N.setEsta("UPDATE");
    }

    /*
     * Este metodo permite imprimir toda la lista, con cada uno de sus atributos.
     *  
     * @return                   no retorna.
     */
    public void ImprimirLista(Visitas P) {
        Visitas R = P.LD;
        System.out.println("-----------inicio----------------");
        while (R != P) {
                System.out.println("---------------------------");
                System.out.println("Codigo:" + R.getCodigo());
                System.out.println("Codigoinmu:" + R.getIdinmueble());
                System.out.println("Codigo:" + R.getDocumento());
                System.out.println("Nombre:" + R.getNombre());
                System.out.println("Apellido:" + R.getApellido());
                System.out.println("Dirección:" + R.getDireccion());
                System.out.println("Telefono Fijo:" + R.getTelfijo());
                System.out.println("Telefono Celular:" + R.getTelcel());
                System.out.println("Correo:" + R.getCorreo());
                System.out.println("Fecha:" + R.getFecha());
                System.out.println("Horaini:" + R.getHoraini());
                System.out.println("Horafin:" + R.getHorafin());
                System.out.println("Observa:" + R.getObserva());
                System.out.println("Esta:" + R.getEsta());
                System.out.println("LD:" + R.getLD());
                System.out.println("LI:" + R.getLI());
                System.out.println(cabeza);
                System.out.println("---------------------------");
            R = R.getLD();
        }
        JOptionPane.showMessageDialog(null, "lista Impresa", "Mensaje Advertencia", JOptionPane.INFORMATION_MESSAGE);
    }

    /*  
     * Este metodo permite permite buscar un Nodo o articulo anterior al que se esta haciendo referencia, este metodo es muy util para buscar o eliminar.
     * 
     * @param codigo               Este parametro especifica el codigo al Nodo que estoy buscando.
     * 
     * @return                   Retorna el Nodo Anterior al que estoy buscando, en caso de no enontarlo retorna Null.
     */
    public Propietario BuscarUltimo(Propietario c) {
        Propietario A = c;

        while (A.liga != null) {
            A = A.getLiga();
        }
        return A;
    }

    public static void GuardarLDLCRC(LDLCRC lista) {
        Datos dat = new Datos();
        try {
            Visitas P = lista.getCabeza();
            Visitas A = null;
            P=P.LD;
            while (P != lista.getCabeza() ) {
                if (P.getEsta().equals("BD")||P.getEsta().equals("UPDATE")) {
                    dat.UpdateVisita(P);
                }
                if (P.getEsta().equals("BORRAR")) {
                    A.LD = P.LD;
                    (P.LD).LI = P.LD;
                    dat.DeleteVisita(P.getCodigo());
                }
                if (P.getEsta().equals("NUEVO")) {
                    dat.NewVisita(P);
                }
                A = P;
                P = P.getLD();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /*  
     * Este metodo permite conocer la cabeza de la lista.
     * 
     * 
     * @return                   Retorna el Nodo o articulo que esta de 1ro o es la cabeza.
     */
    public Visitas getCabeza() {
        return cabeza;
    }

    /*  
     * Este metodo permite asignar el Nodo inicial a cabeza de la lista.
     * 
     * 
     * @return                   No retorna.
     */
    public void setCabeza(Visitas cabeza) {
        this.cabeza = cabeza;
    }

}
