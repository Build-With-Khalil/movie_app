class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final String? gender;
  final String? phone;
  final String? username;
  final String? password;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;
  final Hair? hair;
  final String? ip;
  final Address? address;
  final String? macAddress;
  final String? university;
  final Bank? bank;
  final Company? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final Crypto? crypto;
  final String? role;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? 0,
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        maidenName: json['maidenName'] ?? '',
        age: json['age'] ?? 0,
        gender: json['gender'] ?? '',
        phone: json['phone'] ?? '',
        username: json['username'] ?? '',
        password: json['password'] ?? '',
        birthDate: json['birthDate'] ?? '',
        image: json['image'] ?? '',
        bloodGroup: json['bloodGroup'] ?? '',
        height: json['height'] ?? 0.0,
        weight: json['weight'] ?? 0.0,
        eyeColor: json['eyeColor'] ?? '',
        hair: json['hair'] != null ? Hair.fromJson(json['hair']) : null,
        ip: json['ip'] ?? '',
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null,
        macAddress: json['macAddress'] ?? '',
        university: json['university'] ?? '',
        bank: json['bank'] != null ? Bank.fromJson(json['bank']) : null,
        company:
            json['company'] != null ? Company.fromJson(json['company']) : null,
        ein: json['ein'] ?? '',
        ssn: json['ssn'] ?? '',
        userAgent: json['userAgent'] ?? '',
        crypto: json['crypto'] != null ? Crypto.fromJson(json['crypto']) : null,
        role: json['role'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'maidenName': maidenName,
        'age': age,
        'gender': gender,
        'phone': phone,
        'username': username,
        'password': password,
        'birthDate': birthDate,
        'image': image,
        'bloodGroup': bloodGroup,
        'height': height,
        'weight': weight,
        'eyeColor': eyeColor,
        'hair': hair?.toJson(),
        'ip': ip,
        'address': address?.toJson(),
        'macAddress': macAddress,
        'university': university,
        'bank': bank?.toJson(),
        'company': company?.toJson(),
        'ein': ein,
        'ssn': ssn,
        'userAgent': userAgent,
        'crypto': crypto?.toJson(),
        'role': role,
      };
}

class Hair {
  final String? color;
  final String? type;

  Hair({
    this.color,
    this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json['color'] ?? '',
        type: json['type'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'color': color,
        'type': type,
      };
}

class Address {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final Coordinates? coordinates;
  final String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'] ?? '',
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        stateCode: json['stateCode'] ?? '',
        postalCode: json['postalCode'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'city': city,
        'state': state,
        'stateCode': stateCode,
        'postalCode': postalCode,
        'coordinates': coordinates?.toJson(),
        'country': country,
      };
}

class Coordinates {
  final double? lat;
  final double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json['lat'] ?? 0.0,
        lng: json['lng'] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

class Bank {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json['cardExpire'] ?? '',
        cardNumber: json['cardNumber'] ?? '',
        cardType: json['cardType'] ?? '',
        currency: json['currency'] ?? '',
        iban: json['iban'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'cardExpire': cardExpire,
        'cardNumber': cardNumber,
        'cardType': cardType,
        'currency': currency,
      };
}

class Company {
  final String? department;
  final String? name;
  final String? title;
  final Address? address;

  Company({
    this.department,
    this.name,
    this.title,
    this.address,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        department: json['department'] ?? '',
        name: json['name'] ?? '',
        title: json['title'] ?? '',
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null,
      );

  Map<String, dynamic> toJson() => {
        'department': department,
        'name': name,
        'title': title,
        'address': address?.toJson(),
      };
}

class Crypto {
  final String? coin;
  final String? wallet;
  final String? network;

  Crypto({
    this.coin,
    this.wallet,
    this.network,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        coin: json['coin'] ?? '',
        wallet: json['wallet'] ?? '',
        network: json['network'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'coin': coin,
        'wallet': wallet,
        'network': network,
      };
}
