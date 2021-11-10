/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectocompiladores;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Scanner;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */

public class Principal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        try {
            // TODO code application logic heretry {
            Testeo lexico = new Testeo(new FileReader("src/main/java/com/mycompany/proyectocompiladores/Texto.loop"));
            Sintactico sintactico = new Sintactico((Scanner) lexico);
            sintactico.parse();
            ArrayList<Tablas> sim = lexico.sim;
            EscribirenFichero es = new EscribirenFichero();
            es.escribir(sim);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
    
}
class EscribirenFichero {

    public void escribir(ArrayList<Tablas> sim) {
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("src/main/java/com/mycompany/proyectocompiladores/Salida.txt");
            pw = new PrintWriter(fichero);

            for (int x = 0; x < sim.size(); x++) {
                Tablas sim1 = sim.get(x);
                pw.println(sim1.cantidad + "   " + sim1.getValor() );
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != fichero) {
                    fichero.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
