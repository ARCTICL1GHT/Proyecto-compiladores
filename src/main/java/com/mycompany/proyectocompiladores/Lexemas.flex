package com.mycompany.proyectocompiladores;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

%%
%class Test
%standalone
%line
%column
%standalone
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
%}

NUMERO = [0-9]+
FinLinea = \r|\n|\r\n
EspaciosBlancos = {FinLinea} | [ \t ]
CLASE = "clase"
PROPIEDADES = "propiedades"
CADENA = "cadena"
PUBLICOS = "publicos"|"publicas"
PRIVADOS = "privados"|"privadas"
ENTERO = "entero"
SENTENCIA = "si"|"entonces"|"sino"|"devolver"
CONSTRUCTOR = "constructor"
ESCRIBIR = "escribir"
LEER = "leer"
INSTACIAR = "instanciar"
BARRA = "/"
SIGNOMATE = "+","/","-","*"
DPUNTOS = ":"
PCOMA = ";"
PORCENTAJE = "%"
PARENTESISA = "("
PARENTESISC = ")"
IGUAL = "="
COMA = ","
COMILLAS = "\""
PUNTO = "."
LETRAS = [a-zA-Z]+
VARIABLEZ = {LETRAS}({NUMERO}|{LETRAS})*
/* comments */
    Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

    TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    // Comment can be the last line of the file, without line terminator.
    EndOfLineComment     = {BARRA}{BARRA}{BARRA}* {VARIABLEZ}* {EspaciosBlancos}* {FinLinea}?
    DocumentationComment = "/**" {CommentContent} "*"+ "/"
    CommentContent       = ( [^*] | \*+ [^/*] )*

%%

/* Seccion 3 */
{CLASE} {
            System.out.println("Encontré un clase: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un clase: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }


{PROPIEDADES} {
            System.out.println("Encontré que es tipo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré que es tipo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }


{CADENA} {
            System.out.println("Encontré una Cadena:  "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré una Cadena:  "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }


{PUBLICOS} {
            System.out.println("Encontré que es tipo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré que es tipo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{PRIVADOS} {
            System.out.println("Encontré que es tipo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré que es tipo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{ENTERO} {
            System.out.println("Encontré un numero: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un numero: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{SENTENCIA} {
            System.out.println("Encontré una sentencia: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré una sentencia: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }


{CONSTRUCTOR} {
            System.out.println("Encontré un constructor: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un constructor: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{ESCRIBIR} {
            System.out.println("Encontré un escribir: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un escribir: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{LEER} {
            System.out.println("Encontré un leer: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un leer: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{INSTACIAR} {
            System.out.println("Encontré un instanciar: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un instanciar: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{BARRA} {
            System.out.println("Encontré una barra: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré una barra: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{SIGNOMATE} {
            System.out.println("Encontré un signo Matematico: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un signo Matematico: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{DPUNTOS} {
            System.out.println("Encontré un dos puntos: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un dos puntos: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{PCOMA} {
            System.out.println("Encontré un punto y coma: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un punto y coma: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{PORCENTAJE} {
            System.out.println("Encontré un porcentaje: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un porcentaje: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{PARENTESISA} {
            System.out.println("Encontré un parentesis de abertura: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un parentesis de abertura: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{PARENTESISC} {
            System.out.println("Encontré un parentesis de cierre: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un parentesis de cierre: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{IGUAL} {
            System.out.println("Encontré un signo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un signo: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }


{COMILLAS} {
            System.out.println("Encontré comillas: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré comillas: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();        
        }
            
{COMA} {
            System.out.println("Encontré un coma: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un coma: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }


{PUNTO} {
            System.out.println("Encontré un punto: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un punto: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }

{LETRAS} {
            System.out.println("Encontré letras: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré letras: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }
{VARIABLEZ} {
            System.out.println("Encontré un variable: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un variable: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }
{Comment} {
            System.out.println("Encontré un comentario: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn);
            contenido=contenido+"Encontré un comentario: "+yytext()+" en linea: "+yyline+" columna: "+yycolumn+"\n";
            CrearArchivo();
        }
. { }