
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Avaliação de Satisfação</title>
    
    <!-- Bootstrap (opcional, se você estiver usando) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .rating-form {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
        }

        .rating-scale {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        .rating-option {
            text-align: center;
            cursor: pointer;
        }

        .rating-option input {
            display: none;
        }

        .rating-option label {
            display: block;
            padding: 8px 12px;
            border-radius: 20px;
            background: #f0f0f0;
            transition: all 0.3s ease;
        }

        .rating-option input:checked + label {
            background: #0047ab;
            color: white;
        }

        .rating-option:hover label {
            background: #ddd;
        }

        .rating-text {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .bad {
            color: #dc3545;
        }

        .regular {
            color: #ffc107;
        }

        .good {
            color: #198754;
        }

        .support-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: rgb(37, 63, 211);
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            z-index: 10;
            transition: background-color 0.3s ease;
        }

        .support-button:hover {
            background-color: rgb(18, 61, 140);
        }

        .support-button img {
            width: 32px;
        }
    </style>

    <script>
        function updateRatingText(rating) {
            const ratingText = document.getElementById('rating-feedback');
            switch (rating) {
                case 1:
                    ratingText.textContent = 'Sua avaliação: Ruim';
                    ratingText.className = 'rating-text bad';
                    break;
                case 2:
                    ratingText.textContent = 'Sua avaliação: Regular';
                    ratingText.className = 'rating-text regular';
                    break;
                case 3:
                    ratingText.textContent = 'Sua avaliação: Bom';
                    ratingText.className = 'rating-text good';
                    break;
                case 4:
                    ratingText.textContent = 'Sua avaliação: Ótimo';
                    ratingText.className = 'rating-text good';
                    break;
                case 5:
                    ratingText.textContent = 'Sua avaliação: Excelente';
                    ratingText.className = 'rating-text good';
                    break;
            }
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h3 class="text-center">AVALIAÇÃO DE SATISFAÇÃO</h3>
        <form class="rating-form" action="Confirmacao.jsp" method="POST">
            <div class="mb-3">
                <label for="nome" class="form-label">Seu nome (opcional):</label>
                <input type="text" class="form-control" id="nome" name="nome">
            </div>

            <div class="mb-4">
                <label class="form-label">Como você avalia sua experiência em nosso site?</label>
                <div class="rating-scale">
                    <div class="rating-option">
                        <input type="radio" id="rating-1" name="rating" value="1" onchange="updateRatingText(1)">
                        <label for="rating-1">1</label>
                        <div>Ruim</div>
                    </div>
                    <div class="rating-option">
                        <input type="radio" id="rating-2" name="rating" value="2" onchange="updateRatingText(2)">
                        <label for="rating-2">2</label>
                        <div>Regular</div>
                    </div>
                    <div class="rating-option">
                        <input type="radio" id="rating-3" name="rating" value="3" onchange="updateRatingText(3)" checked>
                        <label for="rating-3">3</label>
                        <div>Bom</div>
                    </div>
                    <div class="rating-option">
                        <input type="radio" id="rating-4" name="rating" value="4" onchange="updateRatingText(4)">
                        <label for="rating-4">4</label>
                        <div>Ótimo</div>
                    </div>
                    <div class="rating-option">
                        <input type="radio" id="rating-5" name="rating" value="5" onchange="updateRatingText(5)">
                        <label for="rating-5">5</label>
                        <div>Excelente</div>
                    </div>
                </div>
                <div id="rating-feedback" class="rating-text good">Sua avaliação: Bom</div>
            </div>

            <div class="mb-3">
                <label for="comentario" class="form-label">Deixe seu comentário (opcional):</label>
                <textarea class="form-control" id="comentario" name="comentario" rows="3"></textarea>
            </div>

            <div class="text-center">
                <button class="btn btn-primary">Enviar Avaliação</button>
            </div>
        </form>
    </div>

</body>
</html>
