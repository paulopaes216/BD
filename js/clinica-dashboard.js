function salvarTudo() {
    const convenios = document.getElementById('conveniosInput').value;
    const exames = document.getElementById('examesInput').value;
    const horarios = document.getElementById('horariosInput').value;
    const profissionais = document.getElementById('profissionaisInput').value;
    const whatsapp = document.getElementById('whatsappInput').value;
    const telefone = document.getElementById('telefoneInput').value;
    const email = document.getElementById('emailInput').value;
  
    const mensagem = `
  ✔️ Alterações salvas com sucesso:
  
  📋 Convênios:
  ${convenios}
  
  🧪 Exames:
  ${exames}
  
  📆 Horários:
  ${horarios}
  
  👨‍⚕️ Profissionais:
  ${profissionais}
  
  📞 Contatos:
  WhatsApp: ${whatsapp}
  Telefone: ${telefone}
  Email: ${email}
    `;
  
    alert(mensagem);
  }
  