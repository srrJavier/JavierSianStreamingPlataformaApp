/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package org.javiersian.model.dao;

import java.util.List;

/**
 *
 * @author javie
 */
public interface CRUD<T, ID> {
    boolean insertar(T objeto);
    List<T> listar();
    T buscar(ID id);
    boolean actualizar(T objeto);
    boolean eliminar(ID id);
 }
