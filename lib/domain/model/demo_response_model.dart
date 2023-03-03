class DemoResponseModel {
  String? imageSmall;
  String? imageLarge;
  String? nombre;
  String? apellido;
  String? genero;
  String? phone;
  String? cellphone;
  String? email;
  String? street;
  String? country;
  String? state;
  String? city;
  String? user;

  DemoResponseModel({
    this.imageSmall,
    this.imageLarge,
    this.nombre,
    this.apellido,
    this.genero,
    this.phone,
    this.cellphone,
    this.email,
    this.street,
    this.country,
    this.state,
    this.city,
    this.user,
  });

  DemoResponseModel.fromJson(Map<String, dynamic> json) {
    imageSmall = json['picture']["thumbnail"];
    imageLarge = json['picture']["large"];
    nombre = json['name']["first"];
    apellido = json['name']["last"];
    genero = json['gender'];
    phone = json['phone'];
    cellphone = json['cell'];
    email = json['email'];
    street = json['location']["street"]["name"];
    country = json['location']["country"];
    state = json['location']["state"];
    city = json['location']["city"];
    user = json['login']["username"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageSmall'] = imageSmall;
    data['imageLarge'] = imageLarge;
    data['nombre'] = nombre;
    data['apellido'] = apellido;
    data['genero'] = genero;
    data['phone'] = phone;
    data['cellphone'] = cellphone;
    data['email'] = email;
    data['street'] = street;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['user'] = user;
    return data;
  }
}
