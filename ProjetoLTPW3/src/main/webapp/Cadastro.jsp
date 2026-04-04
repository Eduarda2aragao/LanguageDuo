<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - LanguageDuo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Quintessential&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #FF6B35;
            --secondary: #004E89;
            --accent: #00A896;
            --light: #F7F9FC;
            --dark: #2D3748;
            --text: #4A5568;
        }
        
        body {
            background: linear-gradient(135deg, #F7F9FC 0%, #E2E8F0 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            color: var(--text);
        }

        /* Estilos para as mensagens de alerta */
        .alert-message {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 15px 25px;
            border-radius: 12px;
            font-size: 0.95rem;
            font-weight: 500;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.3s ease-out;
            max-width: 90%;
            width: max-content;
        }
        
        .alert-error {
            background-color: #FFF5F5;
            color: #E53E3E;
            border: 1px solid #FEB2B2;
        }
        
        .alert-success {
            background-color: #F0FFF4;
            color: #38A169;
            border: 1px solid #9AE6B4;
        }
        
        @keyframes slideIn {
            from { top: -100px; opacity: 0; }
            to { top: 20px; opacity: 1; }
        }
        
        .alert-message i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .close-alert {
            margin-left: 15px;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.2s;
        }
        
        .close-alert:hover {
            opacity: 1;
        }

        .main-container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-card {
            display: flex;
            width: 800px;
            max-width: 95%;
            border-radius: 24px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background: white;
            transition: transform 0.3s ease;
            margin: 0 auto;
        }

        .main-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .form-section {
            padding: 50px;
            width: 55%;
            position: relative;
            overflow: hidden;
        }

        .form-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
        }

        .image-section {
            background: linear-gradient(135deg, var(--primary) 0%, #FF8C42 100%);
            padding: 50px 30px;
            width: 45%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .image-section::after {
            content: "";
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            transform: rotate(30deg);
        }

        .card h1 {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 2rem;
            color: var(--dark);
            position: relative;
            display: inline-block;
        }

        .card h1::after {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 4px;
            background: var(--primary);
            border-radius: 2px;
        }

        .label-input {
            display: flex;
            align-items: center;
            width: 100%;
            margin-bottom: 1.5rem;
            border: 1px solid #E2E8F0;
            border-radius: 12px;
            padding: 15px 20px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            background: #F8FAFC;
        }

        .label-input:hover {
            border-color: var(--primary);
            box-shadow: 0 5px 15px rgba(255, 107, 53, 0.1);
        }

        .label-input i {
            margin-right: 12px;
            color: var(--primary);
            font-size: 1.1rem;
        }

        .label-input input {
            border: none;
            outline: none;
            flex: 1;
            font-size: 1rem;
            background: transparent;
            color: var(--dark);
            font-family: 'Poppins', sans-serif;
        }

        .label-input input::placeholder {
            color: #A0AEC0;
            font-weight: 300;
        }

        .btn.btn-second {
            width: 100%;
            padding: 16px;
            background: linear-gradient(90deg, var(--primary) 0%, var(--accent) 100%);
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            margin-top: 1.5rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            box-shadow: 0 4px 15px rgba(0, 168, 150, 0.3);
        }

        .btn.btn-second:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 168, 150, 0.4);
        }

        .welcome-message {
            color: white;
            font-size: 2rem;
            font-weight: 700;
            font-family: "Quintessential", cursive;
            margin-bottom: 2rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
        }

        .capivara-img {
            max-width: 220px;
            height: auto;
            filter: drop-shadow(0 5px 15px rgba(0, 0, 0, 0.2));
            transition: transform 0.5s ease;
            position: relative;
            z-index: 1;
        }

        .capivara-img:hover {
            transform: scale(1.05) rotate(-5deg);
        }

        /* Estilos para as redes sociais */
        .social-media {
            margin: 2rem 0 1rem;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .social-title {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 1.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
        }

        .social-title::before,
        .social-title::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 30%;
            height: 1px;
            background: rgba(255, 255, 255, 0.3);
        }

        .social-title::before {
            left: 0;
        }

        .social-title::after {
            right: 0;
        }

        .list-social-media {
            display: flex;
            justify-content: center;
            gap: 20px;
            padding: 0;
            list-style: none;
        }

        .link-social-media {
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .link-social-media:hover {
            color: var(--accent);
            transform: translateY(-3px);
        }

        .item-social-media {
            width: 45px;
            height: 45px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
        }

        .item-social-media:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: var(--accent);
            box-shadow: 0 5px 15px rgba(0, 168, 150, 0.3);
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            color: var(--text);
            font-size: 0.95rem;
        }

        .login-link a {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: var(--secondary);
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .main-card {
                flex-direction: column;
                width: 90%;
            }
            
            .form-section, .image-section {
                width: 100%;
                padding: 40px 30px;
            }
            
            .image-section {
                order: -1;
                padding-bottom: 60px;
            }
            
            .card h1 {
                font-size: 1.8rem;
            }
            
            .welcome-message {
                font-size: 1.6rem;
            }
            
            .capivara-img {
                max-width: 180px;
            }

            .alert-message {
                width: 90%;
                text-align: center;
                padding: 12px 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Mensagens de alerta no topo da p?gina -->
    <% if(request.getAttribute("erro") != null) { %>
        <div class="alert-message alert-error">
            <i class="fas fa-exclamation-circle"></i>
            <%= request.getAttribute("erro") %>
            <span class="close-alert" onclick="this.parentElement.remove()">
                <i class="fas fa-times"></i>
            </span>
        </div>
    <% } %>
    
    <% if(request.getAttribute("sucesso") != null) { %>
        <div class="alert-message alert-success">
            <i class="fas fa-check-circle"></i>
            <%= request.getAttribute("sucesso") %>
            <span class="close-alert" onclick="this.parentElement.remove()">
                <i class="fas fa-times"></i>
            </span>
        </div>
    <% } %>

    <div class="main-container">
        <div class="main-card">
            <!-- Se??o do Formul?rio -->
            <div class="form-section">
                <h1>Cadastre-se</h1>
                <form class="form" method="post" action="CadastroServlet.do">
                    <div class="label-input">
                        <i class="far fa-user"></i>
                        <input type="text" id="nome" name="nome" placeholder="Seu nome completo" required>
                    </div>

                    <div class="label-input">
                        <i class="far fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Seu melhor e-mail" required>
                    </div>

                    <div class="label-input">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="senha" name="senha" placeholder="Crie uma senha segura" required>
                    </div>

                    <button class="btn btn-second" type="submit">
                        <i class="fas fa-user-plus" style="margin-right: 8px;"></i> Criar conta
                    </button>
                    
                    <p class="login-link">Já tem uma conta? <a href="Login.jsp">Faça login</a></p>
                    
                    <!-- Redes Sociais -->
                    <div class="social-media">
                        <p class="social-title">Cadastre-se com</p>
                        <ul class="list-social-media">
                            <a class="link-social-media" href="#" target="_blank">
                                <li class="item-social-media">
                                    <i class="fab fa-facebook-f"></i>
                                </li>
                            </a>
                            <a class="link-social-media" href="#" target="_blank">
                                <li class="item-social-media">
                                    <i class="fab fa-google"></i>
                                </li>
                            </a>
                            <a class="link-social-media" href="#" target="_blank">
                                <li class="item-social-media">
                                    <i class="fab fa-linkedin-in"></i>
                                </li>
                            </a>
                        </ul>
                    </div>
                </form>
            </div>

            <!-- Se??o da Capivara -->
            <div class="image-section">
                <h2 class="welcome-message">Bem-vindo ao LanguageDuo!</h2>
                <img src="./assets/img/CapivaraRede.png" alt="Capivara LanguageDuo" class="capivara-img">
                
                <div class="social-media" style="margin-top: 3rem;">
                    <p style="color: rgba(255,255,255,0.8); font-size: 1rem; line-height: 1.5;">
                        Descubra uma nova forma de aprender idiomas e conecte-se com pessoas ao redor do mundo
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Fecha automaticamente as mensagens ap?s 5 segundos
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert-message');
            alerts.forEach(alert => {
                alert.style.transition = 'all 0.3s ease';
                alert.style.top = '-100px';
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 300);
            });
        }, 5000);
    </script>
</body>
</html>