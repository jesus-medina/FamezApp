class Socio {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String urlFacebook;
  String urlWhatsApp;

  Socio({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.urlFacebook,
    this.urlWhatsApp
  });
}

List<Socio> getSocios() => [
  Socio(
    firstName: 'Jesús Daniel',
    lastName: 'Medina Cruz',
    phoneNumber: '6631036365',
    email: 'jesus.daniel.medina.cruz@gmail.com',
    urlFacebook: 'https://www.facebook.com/jesusdaniel.medinacruz',
    urlWhatsApp: 'https://wa.me/526631036365'
  ),
  Socio(
    firstName: 'Danna Priscila',
    lastName: 'Hernández García',
    phoneNumber: '6645770090',
    email: 'hernandezgdpr@gmail.com',
    urlFacebook: 'https://www.facebook.com/dannaa.garciia',
    urlWhatsApp: 'https://wa.me/526645770090'
  ),
];