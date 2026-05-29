package org.javiersian.view;

import java.util.Scanner;
import org.javiersian.controller.EstudiosCineController;

public class MenuPrincipal {
    private final Scanner scanner = new Scanner(System.in);

    public void arrancarSistema() {
        int opcion;
        do {
            System.out.println("\n==============================================");
            System.out.println("     SISTEMA CENTRAL - STREAMINPLATAFORMA IN4CM       ");
            System.out.println("==============================================");
            // Actualizamos el texto para reflejar el módulo correcto
            System.out.println("1. Entrar al Módulo de Estudios de Cine"); 
            System.out.println("2. Salir del Sistema");
            System.out.print("Seleccione una opción de navegación: ");
            opcion = scanner.nextInt();

            switch (opcion) {
                case 1 -> {     
                    EstudiosCineView vistaEstudios = new EstudiosCineView();
                    EstudiosCineController controlEstudios = new EstudiosCineController(vistaEstudios);
                    controlEstudios.iniciarModulo();
                } 
                case 2 -> System.out.println("\nCerrando conexiones... ¡Sistema finalizado con éxito!");
                default -> System.out.println("\nOpción inválida en el menú raíz.");
            }
        } while (opcion != 2);
    }
}

