class user {
  //atributos
  String nome = "";
  String senha = "";

  //construtor
  user(this.nome, this.senha);

  //gettters and setters
  String get getNome => this.nome;

  set setNome(String nome) => this.nome = nome;

  get getSenha => this.senha;

  set setSenha(senha) => this.senha = senha;
}
