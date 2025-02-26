import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.email,
    required this.name,
    required this.lastName,
    required this.city,
    required this.street,
    required this.houseNumber,
    required this.photoUrl,
    this.phoneNumber,
    this.country,
    this.postalCode,
  });
  final String email;
  final String name;
  final String lastName;
  final String? phoneNumber;
  final String city;
  final String? country;
  final String street;
  final String houseNumber;
  final String? postalCode;
  final String photoUrl;

  @override
  List<Object?> get props => [
        email,
        name,
        lastName,
        phoneNumber,
        city,
        country,
        street,
        houseNumber,
        postalCode,
        photoUrl
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      country: json['country'],
      street: json['street'],
      houseNumber: json['houseNumber'],
      postalCode: json['postalCode'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'city': city,
      'country': country,
      'street': street,
      'houseNumber': houseNumber,
      'postalCode': postalCode,
      'photoUrl': photoUrl,
    };
  }
}
