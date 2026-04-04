<%@page import="java.util.ArrayList"%>
<%@page import="com.controle.Aula"%>
<%@page import="com.model.LoginDAO"%>
<%@page import="com.model.AulaDAO"%>
<%@ page import="com.controle.Usuario" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Meu Perfil - LanguageDuo</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Quintessential&display=swap" rel="stylesheet"/>
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
                background-color: #f8f9fa;
                padding-top: 0px;
                font-family: 'Poppins', sans-serif;
                color: var(--dark);
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
                padding-top: 0;
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

            .profile-header {
                background: linear-gradient(135deg, var(--primary) 0%, #FF8C42 100%);
                color: white;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 30px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }
            .profile-img {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                border: 4px solid white;
            }
            .info-card {
                background-color: white;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            }
            .progress-bar-custom {
                background-color: var(--primary);
            }
            .badge-language {
                background-color: var(--primary);
                color: white;
                font-weight: normal;
            }
            .nav-pills .nav-link.active {
                background-color: var(--primary);
            }
            .nav-pills .nav-link {
                color: #495057;
            }
            .course-card {
                transition: transform 0.3s ease;
                border: none;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            }
            .course-card:hover {
                transform: translateY(-5px);
            }
            .course-img {
                height: 150px;
                object-fit: cover;
            }

            /* Estilo para os cards de aula agendada */
            .scheduled-class {
                transition: all 0.3s ease;
                border-left: 4px solid var(--primary);
                margin-bottom: 15px;
            }

            .scheduled-class:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .class-info-icon {
                color: var(--primary);
                margin-right: 8px;
                width: 20px;
                text-align: center;
            }

            .whatsapp-float {
                position: fixed;
                width: 60px;
                height: 60px;
                bottom: 40px;
                right: 40px;
                background-color: #25d366;
                color: #FFF;
                border-radius: 50px;
                text-align: center;
                font-size: 30px;
                box-shadow: 2px 2px 3px #999;
                z-index: 100;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s ease;
            }

            .whatsapp-float:hover {
                background-color: #128C7E;
                transform: scale(1.1);
            }

            footer.bg-dark {
                background: linear-gradient(135deg, var(--dark) 0%, black 100%) !important;
                color: white;
                padding: 3rem 0;
                margin-top: auto;
            }

            /* Estilo para campos inv?lidos */
            .is-invalid {
                border-color: #dc3545;
            }

            .is-invalid:focus {
                border-color: #dc3545;
                box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
            }

            @media (max-width: 768px) {
                .navbar-brand {
                    font-size: 1.5rem;
                }
            }
            
            table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-family: Arial, sans-serif;
        font-size: 14px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: orangered;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #fafafa;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td {
        color: #333;
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
                            <a class="nav-link" href="Inicio.jsp">Início</a>
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
                    </ul>
                    <div class="d-flex align-items-center">
                        <div class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img src="https://ui-avatars.com/api/?name=  <%= session.getAttribute("nome") %>&background=E94E1B&color=fff" 
                                     alt="Foto do perfil" class="rounded-circle me-2" width="40" height="40">
                                <span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="MeuPerfil.jsp"><i class="bi bi-person"></i> Meu Perfil</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="Login.jsp"><i class="bi bi-box-arrow-right"></i> Sair</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Modal de Edi??o de Perfil -->
        <div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editProfileModalLabel">Editar Perfil</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="profileForm" action="#" method="POST"> 
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="fullName" class="form-label">Nome Completo</label>
                                <input type="text" class="form-control" id="nome" name="nome" required>
                            </div>
                            <div class="mb-3">
                                <label for="birthDate" class="form-label">Data de Nascimento</label>
                                <input type="text" class="form-control" id="data_nascimento" name="data_nacimento" 
                                       placeholder="Exemplo: 20/02/2003" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">E-mail</label>
                                <input type="email" placeholder="coloque seu novo email" class="form-control" id="email" name="email" value="<%= session.getAttribute("email")%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Telefone</label>
                                <input type="tel" class="form-control" id="telefone" name="telefone" 
                                       placeholder="Exemplo: 61987654321" required
                                       pattern="[0-9]{11}" title="Digite um telefone valido (11 dígitos, apenas números)">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Conte?do Principal -->
        <div class="container my-4">
            <!-- Cabe?alho do Perfil -->
            <div class="profile-header">
                <div class="row align-items-center">
                    <div class="col-md-2 text-center">
                        <img src="https://ui-avatars.com/api/?name=  <%= session.getAttribute("nome") %>&background=fff&color=E94E1B" alt="Foto do perfil" class="profile-img">
                    </div>
                    <div class="col-md-6">
                        <h2 id="displayName">  <%= session.getAttribute("nome") %></h2>
                        <p class="mb-1"><span id="infoEmailDisplay"></span> <i class="bi bi-envelope">  <%= session.getAttribute("email") %></i></p>
                        <p class="mb-0"><i class="bi bi-star-fill"></i> <strong>4.8</strong> (Progresso geral)</p>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <button class="btn btn-light me-2" id="editProfileBtn" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                            <i class="bi bi-pencil"></i> Editar Perfil
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Coluna Esquerda - Informa??es -->
                <div class="col-lg-4">
                    <!-- Informa??es Pessoais -->
                    <div class="info-card">
                        <h5><i class="bi bi-person-badge"></i> Informações Pessoais</h5>
                        <hr>
                        <div class="mb-3">
        <p class="mb-1"><strong>Nome Completo:</strong></p>
                   <%= session.getAttribute("nome") %>
                   <p class="mb-1"><strong>Data de Nascimento:</strong></p>
                   <p>26/08/2004</p>
                   <p class="mb-1"><strong>E-mail:</strong></p>
                   <%= session.getAttribute("email") %>
                   <p class="mb-1"><strong>Telefone:</strong></p>
                   <p>61975423722</p>
                        </div>
                    </div>

                    <!-- Estat?sticas -->
                    <div class="info-card">
                        <h5><i class="bi bi-bar-chart"></i> Estatisticas</h5>
                        <hr>
                        <div class="row text-center">
                            <div class="col-6 mb-3">
                                <h3 class="mb-0">12</h3>
                                <small>Aulas concluídas</small>
                            </div>
                            <div class="col-6 mb-3">
                                <h3 class="mb-0">24</h3>
                                <small>Horas estudadas</small>
                            </div>
                            <div class="col-6 mb-3">
                                <h3 class="mb-0">85%</h3>
                                <small>Exercícios</small>
                            </div>
                            <div class="col-6 mb-3">
                                <h3 class="mb-0">2</h3>
                                <small>Idiomas</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Coluna Direita - Conte?do Principal -->
                <div class="col-lg-8">
                    <!-- Navega??o em Abas -->
                    <ul class="nav nav-pills mb-4" id="profileTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="courses-tab" data-bs-toggle="pill" data-bs-target="#courses" type="button">
                                <i class="bi bi-book"></i> Meus Cursos
                            </button>
                        </li>
                    </ul>     
</thead>
<tbody>
<%
    try {
    AulaDAO aulaDAO = new AulaDAO();
    ArrayList<Aula> listaAula = aulaDAO.pesquisarTudo();

    for (int i = 0; i < listaAula.size(); i++) {
        Aula aula = listaAula.get(i);
        
         if (aula != null) {
%>
       <table>
    <thead>
        <tr>
            <th>Data</th>
            <th>Hora</th>
            <th>Curso+Professor</th>
            <th>Aluno</th>
            <th>Duração</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= aula.getData()%></td>
            <td><%= aula.getHora()%></td>
            <td><%= aula.getCurso()%></td>
            <td><%= session.getAttribute("nome") %></td>
            <td><%= aula.getDuracao() %></td>
        </tr>
    </tbody>
</table>
<%   
    }
}
}catch (Exception e) {
        out.println("Erro ao buscar aula " + e.getMessage());
    }
%>

                        <!-- Aba: Minha Agenda -->
                        <div class="tab-pane fade" id="schedule" role="tabpanel">
                            <div class="info-card">
                                <h5><i class="bi bi-calendar-week"></i> Aulas Agendadas</h5>
                                <hr>
                                <div id="scheduledClassesContainer" class="row row-cols-1 row-cols-md-2 g-4">
                                    <!-- As aulas agendadas ser?o inseridas aqui via JavaScript -->
                                </div>
                                <div class="text-center mt-3">
                                    <button class="btn btn-primary" onclick="window.location.href='Professores.jsp'">
                                        <i class="bi bi-calendar-plus"></i> Agendar Nova Aula
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Aba: Conquistas -->
                        <div class="tab-pane fade" id="achievements" role="tabpanel">
                            <div class="info-card">
                                <h5><i class="bi bi-trophy"></i> Minhas Conquistas</h5>
                                <hr>
                                <div class="row">
                                    <div class="col-md-4 text-center mb-4">
                                        <div class="p-3 bg-light rounded-circle d-inline-block">
                                            <i class="bi bi-star-fill" style="font-size: 2rem; color: var(--primary);"></i>
                                        </div>
                                        <h6 class="mt-2">Iniciante em Inglês</h6>
                                        <small>Concluiu 5 aulas</small>
                                    </div>
                                    <div class="col-md-4 text-center mb-4">
                                        <div class="p-3 bg-light rounded-circle d-inline-block">
                                            <i class="bi bi-check-circle-fill" style="font-size: 2rem; color: var(--primary);"></i>
                                        </div>
                                        <h6 class="mt-2">Primeiros Passos</h6>
                                        <small>Completou primeiro exercêcio</small>
                                    </div>
                                    <div class="col-md-4 text-center mb-4">
                                        <div class="p-3 bg-light rounded-circle d-inline-block">
                                            <i class="bi bi-chat-square-text-fill" style="font-size: 2rem; color: var(--primary);"></i>
                                        </div>
                                        <h6 class="mt-2">Comunicador</h6>
                                        <small>Participou de 3 discussões</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Rodap? -->
        <footer class="bg-dark text-white py-4 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>LanguageDuo</h5>
                        <p>Aprenda idiomas de forma fácil e interativa</p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <p>&copy; 2025 LanguageDuo. Todos os direitos reservados.</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bot?o do WhatsApp -->
        <a href="https://wa.me/67996592058" class="whatsapp-float" target="_blank" title="Suporte via WhatsApp">
            <i class="fab fa-whatsapp"></i>
        </a>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JavaScript para edi??o de perfil e exibi??o de aulas agendadas -->
       
    </body>
</html>