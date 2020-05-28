import 'package:flutter/material.dart';

class Socio {
  String firstName;
  String lastName;
  String imagePath;
  String phoneNumber;
  String email;
  String urlFacebook;
  String urlWhatsApp;

  Socio({
    @required this.firstName,
    @required this.lastName,
    @required this.imagePath,
    @required this.phoneNumber,
    @required this.email,
    @required this.urlFacebook,
    @required this.urlWhatsApp
  });

  String fullName() => '$firstName $lastName';
}

List<Socio> getSocios() => [
  Socio(
    firstName: 'Danna Priscila',
    lastName: 'Hernández García',
    imagePath: 'images/danna.jpg',
    phoneNumber: '+52-664-577-0090',
    email: 'hernandezgdpr@gmail.com',
    urlFacebook: 'https://www.facebook.com/dannaa.garciia',
    urlWhatsApp: 'https://wa.me/526645770090'
  ),
  Socio(
    firstName: 'Jesús Daniel',
    lastName: 'Medina Cruz',
    imagePath: 'images/daniel.jpg',
    phoneNumber: '+52-663-103-6365',
    email: 'jesus.daniel.medina.cruz@gmail.com',
    urlFacebook: 'https://www.facebook.com/jesusdaniel.medinacruz',
    urlWhatsApp: 'https://wa.me/526631036365'
  ),
];