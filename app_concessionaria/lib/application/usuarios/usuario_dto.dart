class UsuarioDTO {
  final String nome;
  final String email;
  final String senha;

  UsuarioDTO({
    required this.nome,
    required this.email,
    required this.senha,
  });

  factory UsuarioDTO.fromJson(Map<String, dynamic> json) {
    return UsuarioDTO(
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }
}
