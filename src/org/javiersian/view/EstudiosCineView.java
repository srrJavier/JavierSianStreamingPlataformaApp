
package org.javiersian.view;

import java.util.List;
import java.util.Scanner;
import org.javiersian.model.EstudiosCine;

public class EstudiosCineView {
private final Scanner scanner = new Scanner(System.in);

    public int mostrarMenu() {
        System.out.println("\n--- MÓDULO: GESTIÓN DE CATEGORÍAS ---");
        System.out.println("1. Registrar nuevo Estudios");
        System.out.println("2. Listar todos los Estudios");
        System.out.println("3. Buscar Estudio por sede");
        System.out.println("4. Actualizar un Estudio");
        System.out.println("5. Eliminar un Estudio");
        System.out.println("6. Regresar al Menú Principal");
        System.out.print("Seleccione una opción: ");
        return scanner.nextInt();
    }

    public String solicitarNombre() {
        System.out.print("Ingrese el nombre del Estudio: ");
        scanner.nextLine(); // Limpiar buffer
        return scanner.nextLine();
    }

    public int solicitarId() {
        System.out.print("Ingrese el ID del Estudio: ");
        return scanner.nextInt();
    }

    public void desplegarLista(List<EstudiosCine> estudiosCine) {
        System.out.println("\n=== LISTADO DE ESTUDIOS ===");
        System.out.printf("%-10s %-30s\n", "ID", "NOMBRE ESTUDIOS");
        System.out.println("----------------------------------------");
        for (EstudiosCine cat : estudiosCine) {
            System.out.printf("%-10d %-30s\n", cat.getIdEstudiosCine(), cat.getNombreEstudiosCine());
        }
    }

    public void desplegarCategoria(EstudiosCine cat) {
        System.out.println("\n=== DETALLE DE ESTUDIO ===");
        System.out.println("ID: " + cat.getIdEstudiosCine());
        System.out.println("Nombre: " + cat.getNombreEstudiosCine());
    }

    public void mostrarMensaje(String mensaje) {
        System.out.println(mensaje);
    }    

    public void desplegarEstudiosCine(EstudiosCine cat) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
