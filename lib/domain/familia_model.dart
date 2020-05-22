import 'package:famezapp/domain/socio_model.dart';

class Familia {
  String lastName;
  String address;
  List<Socio> members;

  Familia({
    this.lastName,
    this.address,
    this.members
  });
}

Familia getFamilia() => Familia(
  lastName: 'Medina Hernandez',
  address: 'Priv. De los Geránios 9953-24, Cañadas del florido I sección',
  members: getSocios()
);