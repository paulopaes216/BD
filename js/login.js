document.getElementById('loginForm').addEventListener('submit', function (e) {
    e.preventDefault();
  
    const usuario = document.getElementById('usuario').value;
    const senha = document.getElementById('senha').value;
    const mensagem = document.getElementById('mensagem');
  
    // Simulação simples de login (apenas exemplo)
    if (usuario === "clinica" && senha === "1234") {
      window.location.href = "clinica-dashboard.html";
    } else {
      mensagem.textContent = "Usuário ou senha inválidos.";
    }
  });
  