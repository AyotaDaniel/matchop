class UserModel {
  String? id; // sans le underscore cela signifie que ces attributs ont une portée public
  String? login;
  String? email;
  String? nom;
  String? prenom;
  String? pwd;
  String? tel;

  //constructeur: tous dans les accolades car lors de la définition d'un objet de cette classe ces attributs ne sont pas attendues
  UserModel({this.id, this.login, this.nom, this.prenom, this.email, this.pwd, this.tel});

  //prend en entrée un json clé valeur (map, dynamic pour n'importe quel type pour la valeur de la clé) et retourne une instance d
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        login: json['login'],
        nom: json['nom'],
        prenom: json['prenom'],
        pwd: json['pwd'],
        email: json['email'],
        tel: json['tel']
      );
  }
  //
  Map<String, dynamic> toJsonAdd() {
    return {
      'login': login,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'pwd': pwd,
      'tel' : tel
    };
  }
}
