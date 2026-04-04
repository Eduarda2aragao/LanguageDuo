package com.bean;

import com.controle.Usuario;
import com.model.LoginDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try {
            // Validação dos campos
            if (email == null || email.trim().isEmpty()) {
                request.setAttribute("erro", "Por favor, informe seu email");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            if (senha == null || senha.trim().isEmpty()) {
                request.setAttribute("erro", "Por favor, informe sua senha");
                request.setAttribute("emailDigitado", email);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            }

            // Log para depuração
            System.out.println("Tentativa de login - Email: " + email);

            // Busca o usuário no banco
            LoginDAO cadastroD = new LoginDAO();
            Usuario usuarioEncontrado = cadastroD.buscarPorEmail(email.trim());

            // Log do resultado da busca
            System.out.println("Usuário encontrado: " + (usuarioEncontrado != null));

            if (usuarioEncontrado == null) {
                request.setAttribute("erro", "Email não cadastrado");
                request.setAttribute("emailDigitado", email);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
                return;
            } else {
                // Log para depuração de senha
                System.out.println("Senha digitada: " + senha);
                System.out.println("Senha no banco: " + usuarioEncontrado.getSenha());

                // Verifica a senha
                if (!senha.equals(usuarioEncontrado.getSenha())) {
                    request.setAttribute("erro", "Senha incorreta");
                    request.setAttribute("emailDigitado", email);
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                    return;
                } else {
                    // Log de login bem-sucedido
                    System.out.println("Login bem-sucedido para: " + email);

                    // Login bem-sucedido - cria a sessão
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usuarioEncontrado);
                    session.setAttribute("nome", usuarioEncontrado.getNome());
                    session.setAttribute("email", usuarioEncontrado.getEmail());
                    session.setAttribute("senha", usuarioEncontrado.getSenha());
                    

                    // Define o tempo de vida da sessão (30 minutos)
                    session.setMaxInactiveInterval(30 * 60);

                    // Redireciona com caminho absoluto
                    response.sendRedirect(request.getContextPath() + "/Inicio.jsp");
                    return;
                }
            }
        } catch (Exception e) {
            // Log do erro no servidor
            System.err.println("Erro no processo de login: " + e.getMessage());
            e.printStackTrace();

            // Mensagem genérica para o usuário
            request.setAttribute("erro", "Ocorreu um erro durante o login. Por favor, tente novamente.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redireciona para a página de login se acessar via GET
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
    }
}
