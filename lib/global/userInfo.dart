class UserInfo {
  String name, email, cpf, telephone, age, city, neighborhood;
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
    this.residents = int.parse(data['residentes'].toString());
  }

  @override
  toString() {
    return this.name + ' '
        + this.cpf + ' '
        + this.telephone + ' '
        + this.age + ' '
        + this.city + ' '
        + this.neighborhood + ' '
        + this.residents.toString() + ' ';
  }
}

var globalUser = new UserInfo();
