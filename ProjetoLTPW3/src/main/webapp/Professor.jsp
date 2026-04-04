<%@page import="com.controle.Aula"%>
<%@page import="com.model.AulaDAO"%>
<%@page import="com.controle.Usuario"%>
<%@page import="java.util.ArrayList"%>

<%
    boolean logado = session.getAttribute("email") == null ? false : true;
    String idUsuarioLogado = String.valueOf(session.getAttribute("id"));
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
       <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Área do Professor - LanguageDuo</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Quintessential&display=swap" rel="stylesheet"/>
    <style>
        
        .novaaula{
            background-color: var(--primary); 
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            text-decoration: none;
        }
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

        .profile-header {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
        }

        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--primary);
        }

        .stats-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-bottom: 20px;
            text-align: center;
        }

        .stats-number {
            font-size: 2rem;
            font-weight: bold;
            color: var(--primary);
        }

        .stats-label {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .schedule-table th {
            background-color: var(--primary);
            color: white;
        }

        .schedule-table td {
            vertical-align: middle;
        }

        .badge-custom {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .btn-primary:hover {
            background-color: #d04519;
            border-color: #d04519;
        }
        
        .btn-adicionar-aula {
            background-color: var(--primary); 
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
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

        footer.bg-dark {
    overflow-x: hidden; /* Corrige barra de rolagem horizontal */
    box-shadow: 0 -5px 15px rgba(0, 0, 0, 0.1); /* Opcional: sombra superior */
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
        
        .whatsapp-float img {
            width: 35px;
            height: 35px;
            filter: brightness(0) invert(1);
        }

        /* Novo estilo para cards de alunos */
        .student-card {
            transition: transform 0.3s ease;
        }

        .student-card:hover {
            transform: translateY(-5px);
        }

        .student-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.5rem;
            }
        }
        
       
    </style>
</head>
<body>
    <meta charset="UTF-8"/>
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
                        <a class="nav-link active" href="Professor.jsp"><i class="fas fa-chalkboard-teacher me-1"></i> Professores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MeuPerfil.jsp"><i class="bi bi-person-circle me-1"></i><%= session.getAttribute("nome") %> </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Container principal -->
    <div class="container mt-4">
        <!-- Se??o de professores -->
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-person-badge"></i> Perfil Profissional</h5>
                    </div>
                    <div class="card-body text-center">
                        <h4>Prof. João Silva</h4>
                        <p class="text-muted mb-1">Mestre em Linguistica Aplicada-Português</p>
                        <span class="badge bg-success mb-3">Professor Sênior</span>
                        
                        <div class="d-flex justify-content-around mb-3">
                            <div>
                                <h5 class="mb-0">48</h5>
                                <small>Avaliações</small>
                            </div>
                            <div>
                                <h5 class="mb-0">120</h5>
                                <small>Alunos</small>
                            </div>
                            <div>
                                <h5 class="mb-0">15</h5>
                                <small>Cursos</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-person-badge"></i> Perfil Profissional</h5>
                    </div>
                    <div class="card-body text-center">
                        <h4>Prof. Ana Pereira</h4>
                        <p class="text-muted mb-1">Mestre em Linguistica Aplicada-Espanhol</p>
                        <span class="badge bg-success mb-3">Professor Sênior</span>
                        
                        <div class="d-flex justify-content-around mb-3">
                            <div>
                                <h5 class="mb-0">39</h5>
                                <small>Avaliações</small>
                            </div>
                            <div>
                                <h5 class="mb-0">120</h5>
                                <small>Alunos</small>
                            </div>
                            <div>
                                <h5 class="mb-0">5</h5>
                                <small>Cursos</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-person-badge"></i> Perfil Profissional</h5>
                    </div>
                    <div class="card-body text-center">
                        <h4>Prof. Carlos Junior</h4>
                        <p class="text-muted mb-1">Mestre em Linguistica Aplicada-Inglês</p>
                        <span class="badge bg-success mb-3">Professor Sênior</span>
                        
                        <div class="d-flex justify-content-around mb-3">
                            <div>
                                <h5 class="mb-0">50</h5>
                                <small>Avaliações</small>
                            </div>
                            <div>
                                <h5 class="mb-0">120</h5>
                                <small>Alunos</small>
                            </div>
                            <div>
                                <h5 class="mb-0">8</h5>
                                <small>Cursos</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
          <div class="row mt-4">
           
    <!-- Agenda de Aulas (ocupa 8 colunas) -->
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="bi bi-calendar-event"></i> Agenda de Aulas</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover schedule-table">
                      <thead>
    <tr>
        <th>Data</th>
        <th>Hora</th>
        <th>Curso+Professor</th>
        <th>Aluno</th>
        <th>Duração</th>
        <th>Ação<th>
    </tr>
</thead>
<tbody>
<%
    AulaDAO aulaDAO = new AulaDAO();
    ArrayList<Aula> listaAula = aulaDAO.pesquisarTudo();

    for (int i = 0; i < listaAula.size(); i++) {
        Aula aula = listaAula.get(i);
%>
    <tr>
        <td><%= aula.getData()%></td>
        <td><%= aula.getHora()%></td>
        <td><%= aula.getCurso()%></td>
        <td><%= session.getAttribute("nome") %></td>
        <td><%= aula.getDuracao() %></td>
         <td class="text-center align-middle">
             <% if (String.valueOf(aula.getId()).equals(idUsuarioLogado)) { %>
        <!-- Bot?o Editar (L?pis) - Azul -->
        <a href="Editar_aula.jsp" class="btn border border-primary text-primary"
           onclick="editarUsuario(this, '<%=aula.getId()%>')"
           data-toggle="tooltip" data-placement="top" title="Editar">
            <i class="fas fa-pen-nib"></i>
        </a>

        <!-- Bot?o Apagar (Lixeira) - Vermelho -->
        <a href="ExcluirUsuario?id=<%=aula.getId()%>" 
           class="btn border border-danger text-danger"
           data-toggle="tooltip" data-placement="top" title="Apagar">
            <i class="fas fa-trash-alt"></i>
        </a>
    <% } else { %>
        <!-- Bot?o Bloqueado - Vermelho -->
        <a href="#" class="btn border border-danger text-danger"
           data-toggle="tooltip" data-placement="top" title="Bloqueado">
            <i class="fas fa-ban"></i>
        </a>
    <% } %>
    </td>
        <td>
            <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-pencil"></i></button>
        </td>
    </tr>
     <% } %>
         </tbody>
                </table>
                </div>

                <div class="text-center mt-3">
                    <a href="NovaAula.jsp"<i class="novaaula"></i> + Nova Aula</button></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Acesso R?pido (ocupa 4 colunas) -->
    <div class="col-lg-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="bi bi-lightning"></i> Acesso Rápido</h5>
            </div>
            <div class="card-body">
                <div class="d-grid gap-2">
                    <button class="btn btn-outline-primary text-start" onclick="window.location.href='Grafico.jsp'"><i class="bi bi-file-earmark-bar-graph"></i> Relatórios</button>
                    <button class="btn btn-outline-primary text-start" onclick="window.location.href='Avaliacao.jsp'"><i class="bi bi-cash-coin"></i> Avaliação</button>
                </div>
            </div>
        </div>
    </div>
</div>

        <!-- Se??o de alunos recentes -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-people-fill"></i> Alunos Recentes</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <div class="card student-card h-100">
                                    <div class="card-body text-center">
                                        <img src="./assets/img/Aluno.jpg" alt="Aluno" class="student-img mb-2">
                                        <h6>Pedro Costa</h6>
                                        <p class="text-muted small">Português Intermediario</p>
                                        <span class="badge bg-success">Ativo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card student-card h-100">
                                    <div class="card-body text-center">
                                        <img src="./assets/img/Aluno.jpg" alt="Aluno" class="student-img mb-2">
                                        <h6>Juliana Lima</h6>
                                        <p class="text-muted small">Português Avançado</p>
                                        <span class="badge bg-success">Ativo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card student-card h-100">
                                    <div class="card-body text-center">
                                        <img src="./assets/img/Aluno.jpg" alt="Aluno" class="student-img mb-2">
                                        <h6>Ricardo Alves</h6>
                                        <p class="text-muted small">Português Iniciante</p>
                                        <span class="badge bg-warning text-dark">Pendente</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

    <!-- Bot?o do WhatsApp -->
    <a href="https://wa.me/67996592058" class="whatsapp-float" target="_blank" title="Suporte via WhatsApp">
        <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png" alt="WhatsApp">
    </a>

    <!-- Rodap? -->
  
<footer class="bg-dark text-white py-4 mt-5" style="width: 100vw; position: relative; left: 50%; right: 50%; margin-left: -50vw; margin-right: -50vw;">
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
    
    <script>
    // Adicione este script no final do body-bot?o
document.querySelectorAll('.bi-pencil').forEach(icon => {
    icon.closest('button').addEventListener('click', function() {
        // L?gica para editar a linha
        const row = this.closest('tr');
        console.log('Editar:', row);
    });
});

document.querySelectorAll('.bi-trash').forEach(icon => {
    icon.closest('button').addEventListener('click', function() {
        // L?gica para excluir a linha
        if(confirm('Tem certeza que deseja excluir esta aula?')) {
            this.closest('tr').remove();
        }
    });
});       
    </script>
                
                <script> 
                     // Modal da aula
                document.addEventListener('DOMContentLoaded', function() {
                    // Seleciona o bot?o "Adicionar Aula"
                    const addClassBtn = document.querySelector('.btn-primary[data-bs-target="#addClassModal"]');
                    
                    // Se o bot?o n?o existir (como no HTML fornecido), vamos adicionar a funcionalidade
                    const btn = document.querySelector('.card-body .btn-primary');
                    
                    if (btn) {
                        btn.addEventListener('click', function() {
                            // Cria um modal para adicionar nova aula
                            createAddClassModal();
                        });
                    }
                });

                function createAddClassModal() {
                    // Remove o modal existente se houver
                    const existingModal = document.getElementById('addClassModal');
                    if (existingModal) {
                        existingModal.remove();
                    }
                    
                    // Cria o modal
                    const modalHTML = `
                    <div class="modal fade" id="addClassModal" tabindex="-1" aria-labelledby="addClassModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addClassModalLabel">Adicionar Nova Aula</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addClassForm">
                                        <div class="mb-3">
                                            <label for="classDate" class="form-label">Data e Hora</label>
                                            <input type="datetime-local" class="form-control" id="classDate" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="studentName" class="form-label">Aluno</label>
                                            <input type="text" class="form-control" id="studentName" placeholder="Nome do aluno" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="courseName" class="form-label">Curso</label>
                                            <select class="form-select" id="courseName" required>
                                                <option value="">Selecione um curso</option>
                                                <option value="Portugu?s Iniciante">Portugu?s Iniciante</option>
                                                <option value="Portugu?s Intermedi?rio">Portugu?s Intermedi?rio</option>
                                                <option value="Portugu?s Avan?ado">Portugu?s Avan?ado</option>
                                                <option value="Portugu?s Avan?ado">Ingl?s Iniciante</option>
                                                <option value="Portugu?s Intermedi?rio">Ingl?s Intermedi?rio</option>
                                                <option value="Portugu?s Avan?ado">Ingl?s Avan?ado</option>
                                                <option value="Portugu?s Avan?ado">Espanhol Iniciante</option>
                                                <option value="Portugu?s Intermedi?rio">Espanhol Intermedi?rio</option>
                                                <option value="Portugu?s Avan?ado">Espanhol Avan?ado</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="duration" class="form-label">Dura??o (minutos)</label>
                                            <input type="number" class="form-control" id="duration" min="30" step="15" value="60" required>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-primary" id="saveClassBtn">Salvar Aula</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    `;
                    
                    // Adiciona o modal ao body
                    document.body.insertAdjacentHTML('beforeend', modalHTML);
                    
                    // Inicializa o modal
                    const modal = new bootstrap.Modal(document.getElementById('addClassModal'));
                    modal.show();
                    
                    // Adiciona evento ao bot?o de salvar
                    document.getElementById('saveClassBtn').addEventListener('click', function() {
                        saveNewClass();
                    });
                }

                function saveNewClass() {
                    // Obt?m os valores do formul?rio
                    const dateTime = document.getElementById('classDate').value;
                    const studentName = document.getElementById('studentName').value;
                    const courseName = document.getElementById('courseName').value;
                    const duration = document.getElementById('duration').value;
                    
                    // Valida os campos
                    if (!dateTime || !studentName || !courseName || !duration) {
                        alert('Por favor, preencha todos os campos!');
                        return;
                    }
                    
                    // Formata a data para exibi??o
                    const formattedDate = formatDateTime(dateTime);
                    
                    // Cria a nova linha na tabela
                    const newRow = `
                    <tr>
                        <td>${formattedDate}</td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="./assets/img/Aluno.jpg" alt="Aluno" class="student-img me-2">
                                <span>${studentName}</span>
                            </div>
                        </td>
                        <td>${courseName}</td>
                        <td>${duration} min</td>
                        <td>
                            <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-pencil"></i> Editar</button>
                        </td>
                    </tr>
                    `;
                    
                    // Adiciona a nova linha ? tabela
                    document.querySelector('.schedule-table tbody').insertAdjacentHTML('beforeend', newRow);
                    
                    // Fecha o modal
                    const modal = bootstrap.Modal.getInstance(document.getElementById('addClassModal'));
                    modal.hide();
                    
                    // Mostra mensagem de sucesso
                    alert('Aula adicionada com sucesso!');
                }

                function formatDateTime(dateTimeString) {
                    const date = new Date(dateTimeString);
                    const day = String(date.getDate()).padStart(2, '0');
                    const month = String(date.getMonth() + 1).padStart(2, '0');
                    const year = date.getFullYear();
                    const hours = String(date.getHours()).padStart(2, '0');
                    const minutes = String(date.getMinutes()).padStart(2, '0');
                    
                    return `${day}/${month}/${year} - ${hours}:${minutes}`;
                }
                </script>
</html>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>