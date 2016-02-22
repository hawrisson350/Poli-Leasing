package Clases;

import javax.swing.JOptionPane;

/*
 * @author Hawrisson Avendaño
 * 
 * Creación del nodo Propietarios

 * idpropietario
 * nombre
 * apellido
 * telfijo
 * telcel
 * email
 */

public class LSL {
    
    static Propietario cabeza;

    /*
     * Este es el constructructor de la clase, el cual permite inicializar la cabeza de la lista en null.
     * 
     * @return                  no retorna.
     */    
    
    public LSL() {
        
    }

    /*
     * Este metodo permite realizar la insercion ordenada en la lista, asignando los respectivos atributos.
     * 
     * @param idpropietario      se le asigna la identificación, al propietario que se esta creando
     * @param nombre             se le asigna el nombre, al propietario que se esta creando
     * @param apellido              se le asigna el apellido, al propietario que se esta creando
     * @param telfijo              se le asigna el telfijo, al propietario que se esta creando
     * @param telcel              se le asigna el telcel, al propietario que se esta creando
     * @param email              se le asigna el email, al propietario que se esta creando
     * @param esta              se le asigna un estado al nodo que se esta creando
     * @return                  no retorna.
     */
    public void InsertarOrdenado(String idpropietario, String nombre, String apellido, String telfijo, String telcel, String email){
        Propietario N = new Propietario(idpropietario, nombre, apellido,  telfijo, telcel, email,"BD");
        if(cabeza==null){
            setCabeza(N);
        }else{
            Propietario U = BuscarUltimo(cabeza);
            U.setLiga(N);
            N.liga=null;
        }
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
    
    public Propietario Insertar(String idpropietario, String nombre, String apellido, String telfijo, String telcel, String email,Propietario c){
        Propietario N = new Propietario(idpropietario, nombre, apellido, telfijo, telcel, email,"NUEVO");
        if(c==null){
            setCabeza(N);
        }else{
            Propietario U = BuscarUltimo(c);
            U.setLiga(N);
            N.liga=null;
        }
        return N;
    }
    
    /*
     * Este metodo permite realizar una busqueda en la lista por codigo.
     * 
     * @param codigo             Es el codigo que se desea buscar en la lista
     * 
     * @return                  Retorna el Nodo o articulo que se desea buscar, en caso de no encontrarce, se retorna null.
     */    
    public Propietario Buscar(String idpropietario,Propietario P){
        Propietario B = null;
        while(P != null){
            B = P;
            if(!P.getIdpropietario().equals(idpropietario)){
                P = P.getLiga();
            }else{
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
    public Propietario Eliminar(String idpropietario,Propietario c){
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
    }
    
    /*
     * Este metodo permite eliminar un Nodo o articulo de la lista.
     * 
     * @param codigo             Es el codigo que se desea buscar y eliminar
     * 
     * @return                  Retorna una valor logicico (boolean). True si el elmento fue elimnado, de otro modo retorna False.
     */    
    public boolean EliminarLogico(String idpropietario,Propietario P){
        Propietario B = null;
        int y=0;
        while(P != null && y==0 ){
            B = P;
            if(!P.getIdpropietario().equals(idpropietario)){
                P = P.getLiga();
            }else{
               B.setEsta("BORRAR");
               y=1;
            }
        }
        if (P==null && y==0){
            JOptionPane.showMessageDialog(null, "El dato no se encuentra");
            return false;
        }else{
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
    
    public void Modificar(Propietario N, String nombre, String apellido, String telfijo, String telcel, String email){
        N.setNombre(nombre);
        N.setApellido(apellido);
        N.setTelfijo(telfijo);
        N.setTelcel(telcel);
        N.setEmail(email);
        N.setEsta("UPDATE");
    }
    
     /*
     * Este metodo permite imprimir toda la lista, con cada uno de sus atributos.
     *  
     * @return                   no retorna.
      
    
    public void ImprimirLista(Propietario P){
        System.out.println("-----------inicio----------------");
        while(P!=null){
            if(P.getEsta()!="BORRAR"){
            System.out.println("---------------------------");
            System.out.println("Codigo:"+P.getIdpropietario());
            System.out.println("Nombre:"+P.getNombre());
            System.out.println("Apellido:"+P.getApellido());
            System.out.println("Dirección:"+P.getDireccion());
            System.out.println("Telefono Fijo:"+P.getTelfijo());
            System.out.println("Telefono Celular:"+P.getTelcel());
            System.out.println("E-mail:"+P.getEmail());
            System.out.println("E-mail:"+P.getLiga());
            System.out.println(cabeza);
            System.out.println("---------------------------");
            }
            P = P.getLiga();
        }
        JOptionPane.showMessageDialog(null,"lista Impresa","Mensahe Advertencia",JOptionPane.INFORMATION_MESSAGE);
    }

    /*  
     * Este metodo permite permite buscar un Nodo o articulo anterior al que se esta haciendo referencia, este metodo es muy util para buscar o eliminar.
     * 
     * @param codigo               Este parametro especifica el codigo al Nodo que estoy buscando.
     * 
     * @return                   Retorna el Nodo Anterior al que estoy buscando, en caso de no enontarlo retorna Null.
     */ 
    
    public Propietario BuscarUltimo(Propietario c) {
        Propietario A =c;
            
        while(A.liga!=null){
                A = A.getLiga();
        }
        return A;
    }
    
    
    public static void GuardarLSL(LSL lista) {
        Datos dat =new Datos();
        try {
            Propietario c=lista.getCabeza();
            Propietario P = c;
            Propietario A=null;
            while (P != null) {
                if(P.getEsta().equals("BD")){
                    dat.UpdateLista(P);
                }
                if(P.getEsta().equals("BORRAR")){
                    dat.DeleteLista(P.getIdpropietario());
                    A=Anterior(P,c);
                    A.liga=P.liga;
                }
                if(P.getEsta().equals("NUEVO")){
                    dat.Newlista(P);
                }
                if(P.getEsta().equals("UPDATE")){
                    dat.UpdateLista(P);
                }
                A=P;
                P = P.getLiga();
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
    

    public Propietario getCabeza() {
        return cabeza;
    }

     /*  
     * Este metodo permite asignar el Nodo inicial a cabeza de la lista.
     * 
     * 
     * @return                   No retorna.
     */ 
    public void setCabeza(Propietario cabeza) {
        this.cabeza = cabeza;
    }
    
    public static Propietario Anterior(Propietario b,Propietario c){
        Propietario P =c,A=null;
        if(c==b){
         P=c.getLiga();
        }
        while(P!=b){
                A = P;
                P=P.getLiga();
        }
        return A;
    }
    
}
