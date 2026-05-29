package org.javiersian.controller;

import java.util.List;
import org.javiersian.model.EstudiosCine;
import org.javiersian.model.dao.EstudiosCineDAO;
import org.javiersian.model.dao.EstudiosCineDAOImpl;
import org.javiersian.view.EstudiosCineView;

public class EstudiosCineController {
    private final EstudiosCineView vista;
    private final EstudiosCineDAO dao;

    public EstudiosCineController(EstudiosCineView vista) {
        this.vista = vista;
        this.dao = new EstudiosCineDAOImpl(); 
    }

    public void iniciarModulo() {
        int opcion;
        do {
            opcion = vista.mostrarMenu();
            switch (opcion) {
                case 1 -> registrar();
                case 2 -> listar();
                case 3 -> buscar();
                case 4 -> actualizar();
                case 5 -> eliminar();
                case 6 -> vista.mostrarMensaje("Saliendo del módulo de Estudios..."); 
                default -> vista.mostrarMensaje("Opción inválida.");
            }
        } while (opcion != 6);
    }

    private void registrar() {
        String nombre = vista.solicitarNombre();
        EstudiosCine nueva = new EstudiosCine(nombre);
        if (dao.insertar(nueva)) {
            vista.mostrarMensaje("¡Estudio registrado con éxito via SP!");
        } else {
            vista.mostrarMensaje("No se pudo registrar el estudio.");
        }
    }

    private void listar() {
        List<EstudiosCine> lista = dao.listar();
        if (lista.isEmpty()) {
            vista.mostrarMensaje("No hay estudios registradas.");
        } else {
            vista.desplegarLista(lista);
        }
    }

    private void buscar() {
        int id = vista.solicitarId();
        EstudiosCine sede = dao.buscar(id); 
        if (sede != null) {
            vista.desplegarEstudiosCine(sede);
        } else {
            vista.mostrarMensaje("Estudio no encontrada con la Sede: " + id);
        }
    }

    private void actualizar() {
        int id = vista.solicitarId();
        EstudiosCine existente = dao.buscar(id);
        if (existente != null) {
            String nuevoNombre = vista.solicitarNombre();
            EstudiosCine actualizada = new EstudiosCine(id, nuevoNombre);
            if (dao.actualizar(actualizada)) {
                vista.mostrarMensaje("¡Estudio actualizado con éxito via SP!");
            } else {
                vista.mostrarMensaje("Error al actualizar el estudio.");
            }
        } else {
            vista.mostrarMensaje("Estudio no encontrada.");
        }
    }

    private void eliminar() {
        int id = vista.solicitarId();
        EstudiosCine existente = dao.buscar(id);
        if (existente != null) {
            if (dao.eliminar(id)) {
                vista.mostrarMensaje("¡¿Estudio eliminada con éxito via SP!");
            } else {
                vista.mostrarMensaje("No se pudo eliminar el Estudio.");
            }
        } else {
            vista.mostrarMensaje("Estudio no encontrada.");
        }
    }
}