
<!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <title>Adicione sua aula</title>

            <link
                href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Quintessential&display=swap"
                rel="stylesheet">


            <style>
                /* Fundo da página */
                
                body {
                    margin: 0;
                    padding: 0;
                    background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('./assets/img/CapivaraSentada.jpg');
                    background-size: cover;
                    background-position: center;
                    background-repeat: repeat;
                    height: 90vh;
                    display: flex;
                    justify-content: center;
                    align-items: flex-start;
                    padding-top: 10px;
                    font-family: 'Poppins', sans-serif;
                }


                /* Caixa do formulário */
                .container {
                    background: rgba(255, 255, 255, 0.15);
                    backdrop-filter: blur(10px);
                    -webkit-backdrop-filter: blur(10px);
                    border: 1px solid rgba(255, 255, 255, 0.3);
                    border-radius: 20px;
                    padding: 40px;
                    text-align: center;
                    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                    max-width: 450px;
                    width: 90%;

                }

                /* Título */
                .container h1 {
                    color: #FF6B35;
                    font-family: 'Quintessential', cursive;
                    margin-bottom: 25px;
                }

                /* Inputs */
                .container input[type="text"],
                .container input[type="date"],
                .container input[type="time"] {
                    width: 90%;
                    padding: 12px 15px;
                    margin: 10px 0;
                    border: none;
                    border-radius: 10px;
                    background-color: rgba(255, 255, 255, 0.9);
                    outline: none;
                    font-size: 16px;
                }

                /* Botão */
                .container button {
                    width: 100%;
                    padding: 12px;
                    background-color: #00bfa6;
                    color: white;
                    border: none;
                    border-radius: 10px;
                    cursor: pointer;
                    font-size: 16px;
                    transition: background-color 0.3s ease;
                    margin-top: 10px;
                }

                .container button:hover {
                    background-color: #004E89;
                }

                /* Labels inline */
                .container label {
                    display: block;
                    color: #fff;
                    text-align: left;
                    margin-top: 10px;
                    margin-bottom: 5px;
                    font-weight: 500;
                }
 .container select {
    width: 90%;
    padding: 12px 15px;
    margin: 10px 0;
    border: none;
    border-radius: 10px;
    background-color: rgba(255, 255, 255, 0.9);
    outline: none;
    font-size: 16px;
}

            </style>
        </head>

        <body>


            <div class="container">
                <form action="CadastroAula.do" method="POST">
                    <input type="hidden" value="<%= session.getAttribute("id") %>" name="id">
                    <h1>Adicione sua aula!</h1>
                    <label for="data_">Data</label>
                    <input type="text" placeholder="Data" name="data_" id="data_">
                    <label for="hora">Hora</label>
                    <input type="text" placeholder="Hora" name="hora" id="hora">
                    <label for="curso">Curso e Professor:</label>
                    <select name="curso" id="curso" class="form-control" 
                    style="width: 90%; padding: 12px 15px; margin: 10px 0; border: none; border-radius: 10px; background-color: rgba(255, 255, 255, 0.9); outline: none; font-size: 16px;">
                  <option value="">-- Selecione um curso --</option>
                   <option value="Inglês-João">Inglês-Carlos Junior</option>
                   <option value="Português-Ana">Português-João Silva</option>
                    <option value="Espanhol-Carlos">Espanhol-Ana Pereira</option>
                    </select>
                    <label for="duracao">Duração da aula</label>
                    <input type="text" placeholder="Duração" name="duracao" id="duracao">
                    <button type="submit">Cadastrar Aula</button>
                </form>
            </div>


        </body>

        </html>