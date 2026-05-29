/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.javiersian.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.javiersian.model.EstudiosCine;
import org.javiersian.model.conexion.Conexion;

public class EstudiosCineDAOImpl implements EstudiosCineDAO {

    public EstudiosCineDAOImpl() {
        // Constructor vacío limpio
    }

    @Override
    public boolean insertar(EstudiosCine objeto) {
        String sql = "{call sp_insertarestudio(?)}";
        try (Connection con = Conexion.getInstancia().conectar();
             CallableStatement cs = con.prepareCall(sql)) {
            
            cs.setString(1, objeto.getNombre());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error [Insertar Estudio ]: " + e.getMessage());
            return false;
        }
    }

    @Override
    public List<EstudiosCine> listar() {
        List<EstudiosCine> lista = new ArrayList<>();
        String sql = "{call sp_listarestudio()}";
        try (Connection con = Conexion.getInstancia().conectar();
             CallableStatement cs = con.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {
            
            while (rs.next()) {
                lista.add(new EstudiosCine(
                    rs.getInt("id_estudio"), 
                    rs.getString("nombre_estudio")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error [Listar Estudio ]: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public EstudiosCine buscar(Integer id) {
        String sql = "{call sp_buscarestudio(?)}";
        try (Connection con = Conexion.getInstancia().conectar();
             CallableStatement cs = con.prepareCall(sql)) {
            
            cs.setInt(1, id);
            try (ResultSet rs = cs.executeQuery()) {
                if (rs.next()) {
                    return new EstudiosCine(
                        rs.getInt("id_estudio"), 
                        rs.getString("nombre_estudio")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Error [Buscar Estudio ]: " + e.getMessage());
        }
        return null;
    }

    @Override
    public boolean actualizar(EstudiosCine objeto) {
        String sql = "{call sp_actualizarestudio(?, ?)}";
        try (Connection con = Conexion.getInstancia().conectar();
             CallableStatement cs = con.prepareCall(sql)) {
            
            cs.setInt(1, objeto.getId());
            cs.setString(2, objeto.getNombre());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error [Actualizar Estudio]: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean eliminar(Integer id) {
        String sql = "{call sp_eliminarEstudio(?)}";
        try (Connection con = Conexion.getInstancia().conectar();
             CallableStatement cs = con.prepareCall(sql)) {
            
            cs.setInt(1, id);
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error [Eliminar Estudio]: " + e.getMessage());
            return false;
        }
    }
}