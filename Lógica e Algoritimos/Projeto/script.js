//  Vetor
let vetor = []

// Ao carregar o documento
window.onload = () => {
    verificarArmazenamentoLocal()
    selecionar()
}

//  Cadastrar
cadastrar = () => {
    

    // Obter dados
    let produto = document.getElementById("produto").value
    let marca = document.getElementById("marca").value
    let valor = document.getElementById("valor").value

    // Verificar a inserção
    valida(produto, marca, valor)    

}

// Limpar Campos
limpar = () => {

    document.getElementById("produto").value=""
    document.getElementById("marca").value="Marca"
    document.getElementById("valor").value=""

}

// Mensagem
mensagem = (mensagem, tipo) => {

    // Obter o elemento alerta
    let alerta = document.getElementById("alerta")

    // Removendo todas as classes ativas
    alerta.removeAttribute("class")

    // Exibindo a mensagem
    alerta.innerText = mensagem

    // Adicionando a classe alert
    alerta.classList.add("alert")

    // Tipo da mensagem
    if(tipo == "ok"){
        alerta.classList.add("alert-success")
    }else if(tipo == "cancelar"){
        alerta.classList.add("alert-warning")
    }else{
        alerta.classList.add("alert-danger")
    }
}

// Validar campos
valida = (produto, marca, valor) => {

    // Condicional
    if(produto == ""){
        mensagem("Favor preencher o nome do produto", "falha]")
    }else if(produtoDuplicado(produto)){
        mensagem("Esse produto já está cadastrado", "falha")        
    }else if(marca == "Marca"){
        mensagem("Favor selecionar uma marca", "falha")
    }else if(valor == ""){
        mensagem("Favor preencher o valor do produto", "falha")
    }else{
        mensagem("Produto cadastrado com sucesso!", "ok")
        vetor.push({produto:produto, marca:marca, valor:valor})
        armazenarDadosLocal()
        limpar()
        selecionar()
    }
}

// Selecionar
selecionar = () => {

    // Obter a tabela
    let tabela = document.getElementById("tabela")

    // Limpar tabela
    tabela.innerHTML = ""

    // Laço
    for(indice=0; indice<vetor.length; indice++){

        // Criar linha
        let linha = tabela.insertRow(-1)

        // Criar colunas
        let colunaCodigo = linha.insertCell(0)
        let colunaProduto = linha.insertCell(1)
        let colunaMarca = linha.insertCell(2)
        let colunaValor = linha.insertCell(3)
        let colunaRemover = linha.insertCell(4)

        // Valores das células
        colunaCodigo.innerHTML = indice+1
        colunaProduto.innerHTML = vetor[indice].produto
        colunaMarca.innerHTML = vetor[indice].marca
        colunaValor.innerHTML = vetor[indice].valor
        colunaRemover.innerHTML = "<button class='btn btn-danger' onClick='remover("+indice+")'>Remover</button>"
    }

}

// Remover
remover = (indice) =>{

    // Validar
    let valida = confirm("Deseja realmente excluir o produto: "+vetor[indice].produto+"?")

    // Condicional
    if(valida == true){
        vetor.splice(indice, 1)
        selecionar()
        armazenarDadosLocal()

        mensagem("Produto removido com sucesso!", "ok")
    }else{
        mensagem("Produto não removido", "cancelar")
    }


}

// Armazenas no LocalStorage
armazenarDadosLocal = () => {

    // Remover produtos armazenados
    localStorage.removeItem("produtos")

    // Adicionar vetor de produtos
    localStorage.setItem("produtos", JSON.stringify(vetor))

}

// Verificar LocalStorage

verificarArmazenamentoLocal = () => {

    // Adicionar os dados do LocalStorage no vetor
    if(localStorage.getItem("produtos") !=null){
        vetor = JSON.parse(localStorage.getItem("produtos"))
    }    

}

// Verificar o nome do produto (duplicado)
produtoDuplicado = (nome) => {
    let existe = false

    // Laço
    for(let indice=0; indice<vetor.length; indice++){
        if(nome.toLowerCase() == vetor[indice].produto.toLowerCase()){
            existe = true
            break
        }
    }    

    // Retorno
    return existe

}

