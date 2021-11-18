package com.mycompany.proyectocompiladores;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java_cup.runtime.Symbol;

%%
%class Testeo
%line
%column
%cup

%eofval{
  return new Symbol(sym.EOF);
%eofval}

%{
String contenido="";
    Boolean flag=true;
    private void ArchivoNuevo(){
        if(flag)
        {
            try {
                String ruta = "src/main/java/com/mycompany/proyectocompiladores/Salida.txt/";
                File file = new File(ruta);
                // Si el archivo no existe es creado
                if (!file.exists()) {
                    file.createNewFile();
                }
                FileWriter fw = new FileWriter(file);
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write("");
                bw.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            flag=false;
        }    
    }
    private void CrearArchivo(){
        ArchivoNuevo();
        try {
            String ruta = "src/main/java/com/mycompany/proyectocompiladores/Salida.txt/";
            File file = new File(ruta);
            // Si el archivo no existe es creado
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.append(contenido+"\n");
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
public int tabulaciones;
public static ArrayList<Simbolos> sim;

public void add(String nuevo) {
        boolean bandera = false;
        String a = nuevo;
       
        int numero = 0;
        if (sim.size() == 0) {
            Simbolos sim2 = new Simbolos();
            sim2.setCantidad(1);
            sim2.setValor(a);
            sim.add(sim2);
        } else {
            
            for (int x = 0; x < sim.size(); x++) {
                    
                Simbolos sim1 = sim.get(x);

                if (sim1.getValor().equals(a)) {
                    bandera = true;
                    numero = x;

                    x = sim.size();
                } else {
                    bandera = false;
                }
            }

            if (bandera == true) {
               
                Simbolos val = sim.get(numero);
                int n = val.getCantidad();
                n = n + 1;
                val.setCantidad(n);
                sim.remove(numero);
                sim.add(val);
                   
            } else {
              
                Simbolos sim2 = new Simbolos();
                sim2.setCantidad(1);
                sim2.setValor(a);
                sim.add(sim2);
            }
        }  
    }
%}
%init{
    this.sim = new ArrayList<>();
    this.tabulaciones = 0;
%init}


//Reservadas
    
    Comentarios = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
    TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    EndOfLineComment     = "//" {ENTRADA}* {FinLinea}?
    DocumentationComment = "/**" {CommentContent} "*"+ "/"
    CommentContent       = ( [^*] | \*+ [^/*] )*
    If = "si"
    Entonces = "entonces"
    Sino = "sino"
    Leer = "leer"
    Escribir = "escribir"
    Devolver = "devolver"
    Constructor = "Constructor"
    Destructor = "Destructor"
    Principal = "Principal"
    Instanciar = "instanciar"
    Desde = "desde"
    Clase = "clase" | "Clase"
    Caracter_especial = "á"
    NumeroDecimal = [1-9][0-9]* | 0
    NumeroReal = [0-9]*[.][0-9]+[1-9]
    Booleano = [Verdadero|Falso]
    Cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    Tabulacion = ["\ "]{4}|\t
    Variables = [a-z]+{Reglas_variablesextra} | [a-z]
    Propiedades = "Propiedades"|"propiedades"
    Metodos = "Metodos"
    Tipo_de_metodos = "Publica"|"Publico"|"Privada"|"Privados"|"Protegidos"|"Protegidas"
    Tipo_clase = "Impar"|"Par"
    Tipo_entero = "entero" 
    Tipo_cadena = "cadena"
    Tipo_real = "real"
    Tipo_booleano = "booleano"
    Tipo_nulo = "nulo"
    Mientras = "mientras"
    Incrementar = "incrementar"
    Decrementar = "decrementar"
    Hacer = "hacer"
    Extiende = "extiende"
    Eliminar ="Eliminar"
    Incluir = "incluir"
    Nuevo = "nuevo"
    Ejecutar = "ejecutar"|"Ejecutar"
    Verdadero = "verdadero"
    Falso = "falso"
    Parentesis1 = "("
    Parentesis2 = ")"
    Coma = ","
    Reglas_variablesextra = [[a-z]|[0-9]|[A-Z]]*|[[a-z]|[0-9]|[A-Z]]* "_" [[a-z]|[0-9]|[A-Z]]+
    Excepciones_variables = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"  | [A-Z]+ {Variables}
    Variables_clase = [A-Z]+{Reglas_variablesextra}
    Excepciones_variables_clase = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"
    Suma = "+"
    Resta = "-"
    Multiplicacion = "*"
    Division = "/"
    Modulo = "%"
    Exponente = "ˆ"
    Igual = "="
    Incremento = "++"
    Decremento = "--"
    And = "AND" 
    Or = "OR"
    MayorQue = ">"
    MenorQue = "<"
    IgualQue = "=="
    DistintoQue = "!="
    DosPuntos = ":"
    Corchete1 = "["
    Corchete2 = "]"
    Punto = "."
    CadenaEntero = "cadenaAEntero"
    CadenaReal = "cadenaAReal"
    CadenaBooleano = "cadenaABoleano"
    Seno = "seno"
    Coseno = "coseno"
    Tangente = "tangente"
    Logaritmo = "logaritmo"
    Raiz = "raiz"
    FinLinea = \r|\n|\r\n
    ENTRADA = [^\r\n]
    Ignorar = \n|\r\n|\r\n|"\ "
    
%%
{Comentarios}
        {   
            this.add("COMENTARIO");
            
        }

    {Punto}
        {   
            this.add("PUNTO");
            return new Symbol(sym.SIGNOS);
        }

    {Nuevo}
        {   
          this.add("NUEVO");  
          return new Symbol(sym.NEW);
        }

    {Tipo_booleano}
        {   
          this.add("TIPO BOOLEANO ");
          return new Symbol(sym.TIPO_DATO);
        }

    {Tipo_cadena}
        {   
            this.add("TIPO CADENA");
            return new Symbol(sym.TIPO_DATO);
        }

    {Tipo_entero}
        {   
            this.add("TIPO ENTERO");
            return new Symbol(sym.TIPO_DATO);
        }

    {Tipo_real}
        {   
            this.add("TIPO REAL");
            return new Symbol(sym.TIPO_DATO);
        }

    {Tipo_nulo}
        {   
            this.add("TIPO NULO");
            
        }

   {Raiz} 
        {   
            this.add("RAIZ");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {Logaritmo}
        {   
            this.add("LOGARTIMO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {Tangente}
        {   
            this.add("TANGENTE");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {Coseno}
        {  
            this.add("COSENO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {Seno}
        {  
            this.add("SENO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {CadenaBooleano}
        {   
            this.add("CADENA:BOOLEANO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {CadenaReal}
        {   
            this.add("CADENA:REAL");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {CadenaEntero}
        {   
            this.add("CADENA:ENTERO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {Corchete2}
        {   
            this.add("CORCHETE 2");
            return new Symbol(sym.SIGNOS);
        }

    {Corchete1}
        { 
           this.add("CORCHETE 1");
           return new Symbol(sym.SIGNOS);
        }

    {DosPuntos}
        {   
            this.add("DOS PUNTOS");
            return new Symbol(sym.DOS_PUNTOS);
        }

    {DistintoQue}
        {   
            this.add("DISTINTO QUE");
            return new Symbol(sym.SIGNOS);
        }

    {IgualQue}
        {   
            this.add("IGUAL QUE");
            return new Symbol(sym.SIGNOS);
        }

    {MenorQue}
        {   
            this.add("MENOR QUE");
            return new Symbol(sym.SIGNOS);
        }

    {MayorQue}
        {   
            this.add("MAYOR QUE");
            return new Symbol(sym.SIGNOS);
        }

    {Or}
        {  
            this.add("OR");
            return new Symbol(sym.SIGNOS);
        }

    {And}
        {   
            this.add("AND");
            return new Symbol(sym.SIGNOS);
        }

    {Decremento}
        {   
            this.add("DECREMENTO");
            return new Symbol(sym.SIGNOS);
        }

    {Incremento}
        {   
            this.add("INCREMENTO");
            return new Symbol(sym.SIGNOS);
        }

    {Igual}
        {   
            this.add("IGUAL");
            return new Symbol(sym.IGUAL);
        }

    {Exponente}
        {   
            this.add("EXPONENTE");
            return new Symbol(sym.SIGNOS);
        }

    {Modulo}
        {   
            this.add("MODULO");
            return new Symbol(sym.MODULO);
        }

    {Division}
        {   
            this.add("DIVISION");
            return new Symbol(sym.DIVISION);
        }

    {Multiplicacion}
        {   
            this.add("MULTIPLICACION");
            return new Symbol(sym.MULTIPLICACION);
        }

    {Resta}
        {   
            this.add("RESTA");
            return new Symbol(sym.RESTA);
        }

    {Suma}
        {   
            this.add("SUMA");
           return new Symbol(sym.SUMA);
        }

    {Coma}
        {   
            this.add("COMA");
            return new Symbol(sym.COMA);
        }

    {Parentesis1}
        {   
            this.add("PARENTESIS (");
            return new Symbol(sym.PARENTESIS1);
        }

    {Parentesis2}
        {   
            this.add("PARENTESIS )");
            return new Symbol(sym.PARENTESIS2);
        }
    {Falso} 
        {
            this.add("FALSO");
            return new Symbol(sym.FALSO);
        }
    {Verdadero} 
        {
           this.add("VERDADERO");
           return new Symbol(sym.VERDADERO);
        }

    {Tabulacion}
        {   
           this.tabulaciones++; 
        }

    {Incluir}
        {  
            this.add("INCLUIR");
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }
    {Eliminar}
        {   
            this.add("ELIMINAR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {Extiende}
        {  
            this.add("EXTIENDE"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {Hacer}
        {  
            this.add("HACER"); 
            return new Symbol(sym.HACER);
        }

    {Decrementar}
        {  
            this.add("DECREMAR"); 
            return new Symbol(sym.DECREMENTAR);
        }

    {Incrementar}
        {  
            this.add("INCREMENTAR"); 
            return new Symbol(sym.INCREMENTAR);
        }

    {Mientras}
        {  
            this.add("MIENTRAS"); 
            return new Symbol(sym.MIENTRAS);
        }

    {Desde}
        {  
            this.add("DESDE"); 
            return new Symbol(sym.DESDE);
        }

    {Instanciar}
        {  
            this.add("INSTANCIAR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {Principal}
        {  
            this.add("PRINCIPAL"); 
            return new Symbol(sym.PRINCIPAL);
        }

    {Destructor}
        {  
            this.add("DESTRUCTOR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {Constructor}
        {  
            this.add("CONSTRUCTOR"); 
            return new Symbol(sym.TIPO_DATO);
        }

    {Devolver}
        {  
            this.add("DEVOLVER"); 
            return new Symbol(sym.DEVOLVER);
        }

    {Escribir}
        {  
            this.add("ESCRIBIR"); 
            return new Symbol(sym.ESCRIBIR);
        }

    {Leer}
        {  
            this.add("LEER"); 
            return new Symbol(sym.LEER);
        }

    {Sino}
        {  
            this.add("SINO");
            return new Symbol(sym.SINO);
        }

    {Entonces}
        {  
            this.add("ENCONCES"); 
            return new Symbol(sym.ENTONCES);
        }

    {If}
        {  
            this.add("IF");
            return new Symbol(sym.IF);
        }

    {Clase}
        {  
            this.add("CLASE");
            return new Symbol(sym.CLASE);
        }

    {Propiedades}
        {  
            this.add("PROPIEDADES"); 
            return new Symbol(sym.PROPIEDADES);
        }

    {Metodos}
        {  
            this.add("METODOS");
            return new Symbol(sym.METODOS);
        }

    {Tipo_de_metodos}
        {  
            this.add("TIPO DE PROPIEDAD");
            return new Symbol(sym.TIPO_DE_METODOS);
            
        }
    {Ejecutar}
        {
           this.add("METODO EJECUTAR");
           return new Symbol(sym.EJECUTAR);
        }
    {Tipo_clase} 
        { 
          this.add("PAR O IMPAR");
          return new Symbol(sym.TIPO_DATO);
        }
    {Booleano}
        {  
            this.add("TIPO BOOLEANO"); 
        }

    {NumeroReal}
        {  
            this.add("NUMEROS REALES"); 
        }

    {NumeroDecimal}
        {  
            this.add("NUMEROS DECIMALES"); 
            return new Symbol(sym.NUMERO_DECIMAL);
        }

    {Cadena}
        {  
            this.add("TIPO_DATO_CUP"); 
            return new Symbol(sym.CADENA);
        }

    {Excepciones_variables_clase}
        {  
            this.add("ERROR"); 
            
        }

    {Variables_clase}
        {  
            this.add("VARIABLE CLASE");
            return new Symbol(sym.VARIABLE_CLASE);
        }

    {Excepciones_variables}
        {  
            this.add("ERROR"); 
        }

    {Variables}
        {  
            this.add("VARIABLE"); 
            return new Symbol(sym.VARIABLE);
        }

    {FinLinea}     
        {  
          this.add("FIN DE LINEA");
        }

    {Ignorar}     
        {  
        }
    
. {
      System.err.println("Error Léxico \"" + yytext() + "\" ["+"LINEA: "+ (yyline+1) + ": COLUMNA"+ (yycolumn+1) + "]");
   }