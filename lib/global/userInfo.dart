class UserInfo {
  String name,
      email,
      cpf,
      telephone,
      age,
      city,
      neighborhood,
      password,
      answers;
  int residents;

  fromJson(dynamic response) {
    var data = response['message'];
    this.name = data['nome'].toString();
    this.email = data['email'].toString();
    this.cpf = data['cpf'].toString();
    this.telephone = data['telefone'].toString();
    this.age = data['idade'].toString();
    this.city = data['cidade_municipio'].toString();
    this.neighborhood = data['bairro'].toString();
    this.password = data['senha'].toString();
    this.answers = data['respostas'].toString();
    this.residents = int.parse(data['residentes'].toString());
  }

  Map toMap(double latitude, double longitude, double precision) {
    Map location = {
      'latitude': latitude,
      'longitude': longitude,
      'precisao': precision
    };

    Map result = {
      'nome': this.name,
      'email': this.email,
      'cpf': this.cpf,
      'telefone': this.telephone,
      'idade': this.age,
      'cidade_municipio': this.city,
      'bairro': this.neighborhood,
      'residentes': this.residents,
      'senha': this.password,
      'respostas': this.answers,
      'local': location
    };

    return result;
  }

  @override
  toString() {
    return this.name +
        ' ' +
        this.cpf +
        ' ' +
        this.telephone +
        ' ' +
        this.age +
        ' ' +
        this.city +
        ' ' +
        this.neighborhood +
        ' ' +
        this.residents.toString() +
        ' ';
  }
}

var globalUser = new UserInfo();
