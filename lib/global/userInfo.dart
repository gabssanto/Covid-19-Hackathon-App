class UserInfo {
  final String name, email, cpf, telephone, gender, cep, password;
  final chronicDiseases;
  final int residents, age;
  String token;

  UserInfo({
    this.name,
    this.email,
    this.cpf,
    this.telephone,
    this.age,
    this.gender,
    this.cep,
    this.password,
    this.residents,
    this.chronicDiseases,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['nome'] as String,
      email: json['email'] as String,
      cpf: json['cpf'] as String,
      telephone: json['telefone'] as String,
      age: json['idade'] as int,
      gender: json['genero'] as String,
      cep: json['cep'] as String,
      password: json['senha'] as String,
      residents: json['residentes'] as int,
      chronicDiseases: json['doencas_cronicas'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nome': name,
        'email': email,
        'cpf': cpf,
        'telefone': telephone,
        'idade': age,
        'genero': gender,
        'cep': cep,
        'senha': password,
        'residentes': residents,
        'respostas': email,
        'doencas_cronicas': chronicDiseases,
      };

  String toString() => """UserInfo: {
  token: $token,
  name: $name,
  email: $email,
  cpf: $cpf,
  telephone: $telephone,
  age: $age,
  gender: $gender,
  cep: $cep,
  password: $password,
  residents: $residents,
  chronicDiseases: $chronicDiseases
}""";
}

UserInfo globalUser;
