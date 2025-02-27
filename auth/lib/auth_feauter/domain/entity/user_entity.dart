import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity(
      {required this.email,
      required this.name,
      required this.lastName,
      required this.city,
      required this.street,
      required this.houseNumber,
      required this.photoUrl,
      this.phoneNumber,
      this.country,
      this.postalCode});
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
}
