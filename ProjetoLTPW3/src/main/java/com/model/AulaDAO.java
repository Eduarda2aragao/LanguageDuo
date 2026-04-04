/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import com.controle.Aula;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 *
 * @author CASA
 */
public class AulaDAO  extends DAO{
    public void inserir(Aula aula) {
      try {
            abrirBanco();
            String query = "INSERT INTO aula(data_,hora, curso, duracao) VALUES(?, ?, ?, ?)";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setString(1,aula.getData());
            pst.setString(2,aula.getHora());
            pst.setString(3,aula.getCurso());
            pst.setString(4,aula.getDuracao());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
            e.printStackTrace();
        }
}

   
    public ArrayList<Aula> pesquisarTudo() {
        ArrayList<Aula> listaAula= new ArrayList<Aula>();
        try {
            abrirBanco();
            String query = "SELECT data_, hora ,curso, duracao FROM aula";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            Aula aula;
            while (rs.next()) {
                aula = new Aula();
                aula.setData(rs.getString("data_"));
                aula.setHora(rs.getString("hora"));
                aula.setCurso(rs.getString("curso"));
                aula.setDuracao(rs.getString("duracao"));
                listaAula.add(aula);
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return listaAula;
    }

    
   /* public Curso pesquisarCurso(int id) {
        try {
            Curso curso = new Curso();
            abrirBanco();
            String query = "SELECT nome FROM curso WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                curso.setId_curso(rs.getInt("id_curso"));
                curso.set(rs.getString("nome"));
                return curso;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return null;
    }
    /**/
    
    
    public void deletar(Aula aula) {
          try {
            abrirBanco();
            String query = "DELETE FROM aula WHERE id = ?";
            pst = (PreparedStatement) con.prepareStatement(query);
            pst.setInt(1, aula.getId());
            pst.execute();
            fecharBanco();
            
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public void alterar(Aula aula) {
        try {
            abrirBanco();
            String query = "UPDATE aula SET data_ = ?, hora = ?, curso = ?, duracao = ? WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, aula.getData());
            pst.setString(2, aula.getHora());
            pst.setString(3, aula.getCurso());
            pst.setString(4, aula.getDuracao());
            pst.setInt(5, aula.getId());
            pst.executeUpdate();
            fecharBanco();

        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }

    public Aula pesquisar(int id) {
       try {
            Aula aula = new Aula();
            abrirBanco();
            String query = "SELECT * FROM aula WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                aula.setId(rs.getInt("id"));
                aula.setData(rs.getString("data"));
                aula.setHora(rs.getString("hora"));
                aula.setCurso(rs.getString("curso"));
                aula.setDuracao(rs.getString("duracao"));
                return aula;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
        return null;
    }
}
