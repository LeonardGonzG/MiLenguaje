/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalyzerLexer;

import java.io.File;

/**
 *
 * @author Usuario
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         String ruta = "C:/Users/Usuario/Documents/NetBeansProjects/GrammarReceipt/src/AnalyzerLexer/Lexer.flex";
         generarLexer(ruta);
    }
    
     public static void generarLexer(String ruta) {
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }

    
}
