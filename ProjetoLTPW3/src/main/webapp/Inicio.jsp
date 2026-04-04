<%@page import="com.controle.Usuario"%>
<%@page import="com.model.LoginDAO"%>
<%@page import="com.bean.LoginServlet"%>

<%
    boolean logado = session.getAttribute("email") == null ? false : true;
    String idUsuarioLogado = String.valueOf(session.getAttribute("id"));
%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bem-vindo - LanguageDuo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">   
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Quintessential&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
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
                font-family: 'Poppins', sans-serif;
                color: var(--dark);
                background-color: var(--light);
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            
            /* Navbar Modernizada */
            .navbar {
                background: linear-gradient(135deg, var(--primary) 0%, #FF8C42 100%);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                padding: 0.8rem 1rem;
            }
            
            .navbar-brand {
                font-family: 'Quintessential', cursive;
                font-weight: 700;
                font-size: 1.8rem;
                color: white !important;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            
            .navbar-brand img {
                height: 40px;
                transition: transform 0.3s ease;
            }
            
            .navbar-brand:hover img {
                transform: rotate(-10deg);
            }
            
            .nav-link {
                color: rgba(255, 255, 255, 0.9) !important;
                font-weight: 500;
                padding: 0.5rem 1rem;
                margin: 0 0.2rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }
            
            .nav-link:hover, .nav-link:focus {
                color: white !important;
                background-color: rgba(255, 255, 255, 0.15);
                transform: translateY(-2px);
            }
            
            .dropdown-menu {
                border: none;
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
                padding: 0.5rem;
            }
            
            .dropdown-item {
                border-radius: 8px;
                padding: 0.5rem 1rem;
                transition: all 0.2s ease;
            }
            
            .dropdown-item:hover {
                background-color: var(--primary);
                color: white !important;
                transform: translateX(5px);
            }
            
            /* Hero Section Aprimorada */
            .hero-section {
                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('./assets/img/CapivaraSentada.jpg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                min-height: 100vh;
                display: flex;
                align-items: center;
                text-align: center;
                color: white;
                padding: 6rem 0;
                position: relative;
                overflow: hidden;
            }
            
            .hero-section::after {
                content: "";
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 100px;
                background: linear-gradient(to bottom, transparent 0%, var(--light) 100%);
            }
            
            .hero-content {
                max-width: 800px;
                margin: 0 auto;
                position: relative;
                z-index: 1;
            }
            
            .hero-title {
                font-family: 'Quintessential', cursive;
                font-size: 3.5rem;
                font-weight: 700;
                margin-bottom: 1.5rem;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
                animation: fadeInDown 1s ease;
            }
            
            .hero-subtitle {
                font-size: 1.8rem;
                margin-bottom: 2rem;
                font-weight: 300;
                opacity: 0.9;
                animation: fadeInUp 1s ease 0.3s both;
            }
            
            .hero-text {
                font-size: 1.2rem;
                line-height: 1.8;
                margin-bottom: 3rem;
                animation: fadeInUp 1s ease 0.6s both;
            }
            
            .btn-hero {
                background-color: var(--accent);
                color: white;
                border: none;
                border-radius: 50px;
                padding: 0.8rem 2.5rem;
                font-weight: 600;
                font-size: 1.1rem;
                text-transform: uppercase;
                letter-spacing: 1px;
                box-shadow: 0 8px 20px rgba(0, 168, 150, 0.3);
                transition: all 0.3s ease;
                animation: fadeIn 1s ease 0.9s both;
            }
            
            .btn-hero:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 25px rgba(0, 168, 150, 0.4);
                background-color: #00c2a8;
            }
            
            /* Se??o de Recursos */
            .features-section {
                padding: 5rem 0;
                background-color: var(--light);
            }
            
            .section-title {
                font-family: 'Quintessential', cursive;
                color: var(--primary);
                font-size: 2.5rem;
                margin-bottom: 3rem;
                text-align: center;
                position: relative;
            }
            
            .section-title::after {
                content: "";
                position: absolute;
                bottom: -15px;
                left: 50%;
                transform: translateX(-50%);
                width: 80px;
                height: 4px;
                background: linear-gradient(to right, var(--primary), var(--accent));
                border-radius: 2px;
            }
            
            .feature-card {
                background: white;
                border-radius: 16px;
                padding: 2rem;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
                height: 100%;
                border: 1px solid rgba(0, 0, 0, 0.05);
            }
            
            .feature-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
                border-color: rgba(255, 107, 53, 0.3);
            }
            
            .feature-icon {
                font-size: 2.5rem;
                color: var(--primary);
                margin-bottom: 1.5rem;
            }
            
            .feature-title {
                font-weight: 600;
                margin-bottom: 1rem;
                color: var(--dark);
            }
            
            .feature-text {
                color: var(--text);
                line-height: 1.7;
            }
            
            /* Rodap? */
            .footer {
                background: linear-gradient(135deg, var(--dark) 0%, black 100%);
                color: white;
                padding: 3rem 0;
                margin-top: auto;
            }
            
            .footer-title {
                font-family: 'Quintessential', cursive;
                font-size: 1.8rem;
                margin-bottom: 1.5rem;
            }
            
            .footer-links a {
                color: rgba(255, 255, 255, 0.7);
                text-decoration: none;
                transition: color 0.3s ease;
                display: block;
                margin-bottom: 0.5rem;
            }
            
            .footer-links a:hover {
                color: white;
                transform: translateX(5px);
            }
            
            .social-icons a {
                color: white;
                font-size: 1.5rem;
                margin-right: 1rem;
                transition: all 0.3s ease;
            }
            
            .social-icons a:hover {
                color: var(--accent);
                transform: translateY(-5px);
            }
            
            /* Anima??es */
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }
            
            @keyframes fadeInDown {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            
            /* Responsividade */
            @media (max-width: 768px) {
                .hero-title {
                    font-size: 2.5rem;
                }
                
                .hero-subtitle {
                    font-size: 1.4rem;
                }
                
                .navbar-brand {
                    font-size: 1.5rem;
                }
                
                .section-title {
                    font-size: 2rem;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navbar Modernizada -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="Inicio.jsp">
                    <img src="./assets/img/DandoTchau.png" alt="Mascote LanguageDuo">
                    LanguageDuo
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="Inicio.jsp">Início</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Cursos
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Ingles.jsp"><i class="fas fa-language me-2"></i> Inglês</a></li>
                                <li><a class="dropdown-item" href="Espanhol.jsp"><i class="fas fa-language me-2"></i> Espanhol</a></li>
                                <li><a class="dropdown-item" href="Frances.jsp"><i class="fas fa-language me-2"></i> Francês</a></li>
                                <li><a class="dropdown-item" href="Alemao.jsp"><i class="fas fa-language me-2"></i> Alemão</a></li>
                                <li><a class="dropdown-item" href="Portugues.jsp"><i class="fas fa-language me-2"></i> Português</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Professor.jsp"><i class="fas fa-chalkboard-teacher me-1"></i> Professores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MeuPerfil.jsp"><i class="bi bi-person-circle me-1"></i> <%= session.getAttribute("nome") %></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section Aprimorada -->
        <section class="hero-section">
            <div class="container">
                <div class="hero-content">
                    <h1 class="hero-title">Bem-vindo ao LanguageDuo</h1>
                    <h2 class="hero-subtitle">Aprenda idiomas de forma natural e divertida</h2>
                    <p class="hero-text">
                        Transforme sua maneira de aprender idiomas com nossa plataforma interativa. Conecte-se com professores 
                        experientes, pratique com nativos e alcance fluencia no seu pr?prio ritmo. Tudo isso com a ajuda do 
                        nosso mascote capivara, que vai te acompanhar nessa jornada!
                    </p>
                    <a href="#features" class="btn btn-hero">
                        <i class="fas fa-arrow-down me-2"></i> Conheça mais
                    </a>
                </div>
            </div>
        </section>

        <!-- Se??o de Recursos -->
        <section class="features-section" id="features">
            <div class="container">
                <h2 class="section-title">Por que escolher o LanguageDuo?</h2>
                
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-chalkboard-teacher"></i>
                            </div>
                            <h3 class="feature-title">Professores Qualificados</h3>
                            <p class="feature-text">
                                Aprenda com os melhores professores nativos e especialistas em ensino de idiomas, 
                                selecionados cuidadosamente para oferecer a melhor experi?ncia de aprendizado.
                            </p>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h3 class="feature-title">Comunidade Ativa</h3>
                            <p class="feature-text">
                                Conecte-se com outros alunos, participe de grupos de conversação e pratique 
                                o idioma em situa??es reais com nossa comunidade global de aprendizes.
                            </p>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-gamepad"></i>
                            </div>
                            <h3 class="feature-title">Aprendizado Lúdico</h3>
                            <p class="feature-text">
                                Nossa abordagem gamificada torna o aprendizado divertido e viciante. 
                                Desbloqueie conquistas, suba de n?vel e acompanhe seu progresso de forma visual.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Rodap? -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h3 class="footer-title">LanguageDuo</h3>
                        <p>Aprenda idiomas de forma natural, eficiente e divertida com nossa plataforma inovadora.</p>
                        <div class="social-icons mt-3">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h4 class="mb-3">Links Rápidos</h4>
                        <div class="footer-links">
                            <a href="Inicio.jsp"><i class="fas fa-chevron-right me-2"></i> Início</a>
                            <a href="Professor.jsp"><i class="fas fa-chevron-right me-2"></i> Professores</a>
                            <a href="MeuPerfil.jsp"><i class="fas fa-chevron-right me-2"></i> Meu Perfil</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h4 class="mb-3">Cursos</h4>
                        <div class="footer-links">
                            <a href="Ingles.jsp"><i class="fas fa-chevron-right me-2"></i> Inglês</a>
                            <a href="Espanhol.jsp"><i class="fas fa-chevron-right me-2"></i> Espanhol</a>
                            <a href="Frances.jsp"><i class="fas fa-chevron-right me-2"></i> Francês</a>
                            <a href="Alemao.jsp"><i class="fas fa-chevron-right me-2"></i> Alemão</a>
                            <a href="Portugues.jsp"><i class="fas fa-chevron-right me-2"></i> Português</a>
                        </div>
                    </div>
                </div>
                <hr class="my-4 bg-light opacity-25">
                <div class="text-center">
                    <p class="mb-0">@ 2025 LanguageDuo. Todos os direitos reservados.</p>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Efeito de scroll suave
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
            
            // Anima??o quando os elementos aparecem na tela
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                    }
                });
            }, { threshold: 0.1 });
            
            document.querySelectorAll('.feature-card').forEach(card => {
                observer.observe(card);
            });
        </script>
    </body>
</html>