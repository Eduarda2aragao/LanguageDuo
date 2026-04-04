<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Curso de Espanhol</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
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
      font-family: 'Poppins', sans-serif;
      color: var(--dark);
      background-color: var(--light);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      padding-top: 0px; 
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

    .flag-img {
      width: 40px;
      height: auto;
    }

    .notification-sidebar {
      background: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      padding: 15px;
      margin-top: 20px;
    }

    .notification-header {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 15px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .notification-badge {
      background-color: red;
      color: white;
      border-radius: 50%;
      padding: 4px 10px;
      font-size: 14px;
    }

    .notification-item {
      display: flex;
      align-items: flex-start;
      padding: 10px;
      border-left: 4px solid #0d6efd;
      background-color: #f1f1f1;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    .notification-item.success {
      border-color: green;
    }

    .notification-icon {
      font-size: 24px;
      margin-right: 10px;
      color: #0d6efd;
    }

    .notification-content {
      flex: 1;
    }

    .notification-title {
      font-weight: bold;
    }

    .notification-text {
      font-size: 14px;
    }

    .notification-time {
      font-size: 12px;
      color: gray;
    }

    .notification-footer {
      text-align: center;
      margin-top: 15px;
    }

    .notification-footer a {
      text-decoration: none;
      color: #0d6efd;
    }

    .page-title {
      margin-top: 30px;
      margin-bottom: 30px;
    }

    .card img {
      height: 180px;
      object-fit: cover;
    }
    
    .table {
      width: auto;
      margin-left: 0;
    }
    
    /* Estilo para centralizar o bot?o */
    .card-body {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }
    
    .card-text {
      margin-bottom: 15px; /* Espa?o entre o texto e o bot?o */
    }
    
    /* Cores personalizadas */
    .btn-primary {
      background-color: var(--primary);
      border-color: var(--primary);
    }
    
    .btn-primary:hover {
      background-color: #d04519;
      border-color: #d04519;
    }
    
    footer.bg-dark {
      background: linear-gradient(135deg,black 0%, black 100%) !important;
      color: white;
      padding: 3rem 0;
      margin-top: auto;
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

    /* Responsividade */
    @media (max-width: 768px) {
      .navbar-brand {
        font-size: 1.5rem;
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
          <li class="nav-item">
            <a class="nav-link" href="MeuPerfil.jsp"><i class="bi bi-person-circle me-1"></i>  <%= session.getAttribute("nome") %></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <%-- CONTEUDO--%>
  
  <div class="container">
    
    <h2 class="text-center page-title">Curso de Espanhol</h2> 

    <div class="row">
      
      <div class="col-lg-7 pe-lg-4">
        <table class="table table-bordered table-striped table-hover">
          <thead class="table">
            <tr>
              <th>Imagem</th>
              <th>Nível</th>
              <th>Preço por mes</th>
              <th>Descrição</th>
              <th>Data de Início</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><img src="./assets/img/Espanha.png" alt="Bandeira Espanha" class="flag-img" /></td>
              <td>Iniciante</td>
              <td>R$150,00</td>
              <td>Curso voltado para quem está começando do zero, com foco em vocabulário básico e conversação simples.</td>
              <td>10/05/2025</td>
            </tr>
            <tr>
              <td><img src="./assets/img/Espanha.png" alt="Bandeira Espanha" class="flag-img" /></td>
              <td>Intermediário</td>
              <td>R$180,00</td>
              <td>Aprimore sua gram?tica e amplie seu vocabulário com aulas dinamicas e exercícios práticos.</td>
              <td>15/05/2025</td>
            </tr>
            <tr>
              <td><img src="./assets/img/Espanha.png" alt="Bandeira Espanha" class="flag-img" /></td>
              <td>Avançado</td>
              <td>R$200,00</td>
              <td>Foco em fluencia, compreensão de textos complexos e conversação avançada.</td>
              <td>20/05/2025</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- NOTIFICA??ES  -->
      
      <div class="col-lg-5">
        <div class="notification-sidebar">
          <div class="notification-header">
            <span>Notificações</span>
            <span class="notification-badge">2</span>
          </div>

          <div class="notification-item info">
            <i class="bi bi-calendar-event notification-icon"></i>
            <div class="notification-content">
              <div class="notification-title">Aula agendada</div>
              <div class="notification-text">Amanhã as 15:00</div>
              <div class="notification-time">Hoje, 10:30</div>
            </div>
          </div>

          <div class="notification-item success">
            <i class="bi bi-file-earmark-text notification-icon"></i>
            <div class="notification-content">
              <div class="notification-title">Novo material disponível</div>
              <div class="notification-text">No seu curso de Espanhol</div>
              <div class="notification-time">Ontem, 16:45</div>
            </div>
          </div>

          <div class="notification-footer">
            <a href="#"><i class="bi bi-bell"></i> Ver todas as notifica??es</a>
          </div>
        </div>
      </div>
    </div>

    <!-- CARDS DOS CURSOS -->
    <h3 class="text-center mt-5">Escolha seu curso</h3>
    <div class="row">
      <div class="col-md-4 mb-4">
        <div class="card">
          <img src="./assets/img/Touro.jpeg" class="card-img-top" alt="Curso Iniciante" />
          <div class="card-body">
            <h5 class="card-title">Espanhol Iniciante</h5>
            <p class="card-text">Primeira aula dos inicantes do Espanhol. Introdução as primeiras palavras</p>
            <a href="Professor.jsp#espanhol" class="btn btn-primary">Professor</a>
          </div>
        </div>
      </div>

      <div class="col-md-4 mb-4">
        <div class="card">
          <img src="./assets/img/Touro.jpeg" class="card-img-top" alt="Curso Intermedi?rio" />
          <div class="card-body">
            <h5 class="card-title">Espanhol Intermediário</h5>
            <p class="card-text">Terceira aula de intermediarios no Espanhol, aula de mídia e exercícios.</p>
            <a href="Professor.jsp" class="btn btn-primary">Professor</a>
          </div>
        </div>
      </div>

      <div class="col-md-4 mb-4">
        <div class="card">
          <img src="./assets/img/Touro.jpeg" class="card-img-top" alt="Curso Avan?ado" />
          <div class="card-body">
            <h5 class="card-title">Espanhol Avançado</h5>
            <p class="card-text">Aula de conversa, focado para melhorar a pronuncia do Espanhol para os avançados</p>
            <a href="Professor.jsp" class="btn btn-primary">Professor</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- SUPORTEE -->
  
  <a href="https://wa.me/67996592058" class="whatsapp-float" target="_blank" title="Fale conosco no WhatsApp">
    <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png" alt="WhatsApp">
  </a>

  <!-- Rodap? -->
 <!-- Rodap? -->
<footer class="bg-dark text-white py-4 mt-5" style="width: 100vw; position: relative; left: 50%; right: 50%; margin-left: -50vw; margin-right: -50vw;">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h5>LanguageDuo</h5>
                <p>Aprenda idiomas de forma facil e interativa</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p>&copy; 2025 LanguageDuo. Todos os direitos reservados.</p>
            </div>
        </div>
    </div>
</footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>