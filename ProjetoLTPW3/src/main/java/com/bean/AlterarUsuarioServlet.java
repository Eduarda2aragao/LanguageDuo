/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template

package com.bean;


import com.controle.Usuario;
import com.model.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author CASA
 
public class AlterarUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String nome = request.getParameter("nome");
            String data_nacimento = request.getParameter("data_nacimento");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            
     
            Usuario  usuario = new Usuario(); 
            usuario.setNome(nome);
            usuario.setData_nascimento(data_nacimento);
            usuario.setEmail(email);
            usuario.setTelefone(telefone);
            

            LoginDAO loginDAO = new LoginDAO();
            loginDAO.pesquisarUsuario(usuario);
            request.getRequestDispatcher("MeuPerfil.jsp").forward(request, response);
        }
    }
}
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
  @throws IOException if an I/O error occurs
     */
   