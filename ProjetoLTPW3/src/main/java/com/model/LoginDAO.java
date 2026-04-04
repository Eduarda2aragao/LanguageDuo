/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import com.controle.Aula;
import com.controle.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends DAO {

    public void inserir(Usuario login) throws SQLException, Exception {
    abrirBanco();
    String query = "INSERT INTO Usuario (nome, email, senha) VALUES (?, ?, ?)";
    try (PreparedStatement pst = con.prepareStatement(query)) {
        pst.setString(1, login.getNome());
        pst.setString(2, login.getEmail());
        pst.setString(3, login.getSenha());
        
        pst.executeUpdate();
    } finally {
        fecharBanco();
    }
}
    
     public Usuario buscarPorEmail(String email) throws Exception {
        String sql = "SELECT id, nome,email,senha FROM Usuario WHERE email = ?";
        Usuario usuario = null;

        try {
            abrirBanco();
            pst = con.prepareStatement(sql);
            pst.setString(1, email.trim());
  

            rs = pst.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));

                // Log para depuração
                System.out.println("Usuário recuperado do banco: " + usuario.getEmail());
            }
        } catch (Exception e) {
            System.err.println("Erro ao buscar usuário por email: " + e.getMessage());
            e.printStackTrace();
        } finally {
            fecharBanco();
        }

        return usuario;
    }

     
       public Usuario pesquisar(Usuario login) throws SQLException, Exception {
        Usuario loginBuscar = null;
        ResultSet rs = null;

        try {
            abrirBanco();
            String query = "SELECT id, nome, email FROM Usuario WHERE email = ? AND senha = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, login.getEmail());
            pst.setString(2, login.getSenha());

            rs = pst.executeQuery();

            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                return usuario;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            fecharBanco();
        }

        return loginBuscar;
    }

     
}


