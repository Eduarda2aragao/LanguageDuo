/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import com.controle.Usuario;
import java.sql.SQLException;

public class teste {
    public static void main(String[] args) throws SQLException{
        DAO c = new  DAO();
        c.abrirBanco();
    }
}
