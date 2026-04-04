<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Relatório - Horas e Alunos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Importante para o gráfico -->

        <style>
            #hoursStudentsChart {
                max-height: 400px;
                width: 100%;
            }
            .navbar-brand {
                color: #fff;
                font-family: "Kosugi Maru", sans-serif;
                font-weight: 400;
                font-style: normal


            }

            .custom-orange {
                color: #fff;
                background-color: #E94E1B;
            }

            .navbar-collapse {
                color: #FFF8DC;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark custom-orange fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">LanguageDuo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="Inicio.jsp">Início</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Cursos
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Ingles.jsp">Inglês</a></li>
                                <li><a class="dropdown-item" href="Espanhol.jsp">Espanhol</a></li>
                                <li><a class="dropdown-item" href="Frances.jsp">Francês</a></li>
                                <li><a class="dropdown-item" href="Alemao.jsp">Alemão</a></li>
                                <li><a class="dropdown-item" href="Portugues.jsp">Português</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="Professor.jsp">Professor</a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="MeuPerfil.jsp">
                                <i class="bi bi-person-circle"></i> Meu Perfil
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <br><br><br><br>
        <div class="container mt-5">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="bi bi-graph-up"></i> Relatório de Horas e Alunos</h5>
                </div>
                <div class="card-body">
                    <canvas id="hoursStudentsChart"></canvas>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-3">
            <a href="Professor.jsp">  <button class="btn btn-primary"> Voltar </button> </a>
        </div>
        
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const ctx = document.getElementById('hoursStudentsChart').getContext('2d');

                const labels = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun'];
                const hoursData = [20, 35, 45, 30, 50, 60];
                const studentsData = [15, 25, 30, 25, 40, 50];

                const chart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [
                            {
                                label: 'Horas Ministradas',
                                data: hoursData,
                                borderColor: '#E94E1B',
                                backgroundColor: 'rgba(233, 78, 27, 0.1)',
                                tension: 0.3,
                                fill: true
                            },
                            {
                                label: 'Número de Alunos',
                                data: studentsData,
                                borderColor: '#2c3e50',
                                backgroundColor: 'rgba(44, 62, 80, 0.1)',
                                tension: 0.3,
                                fill: true
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'top',
                            },
                            tooltip: {
                                mode: 'index',
                                intersect: false
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            });
        </script>

    </body>
</html>