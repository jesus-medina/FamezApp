import 'package:famezapp/domain/socio_model.dart';
import 'package:flutter/cupertino.dart';

class Familia {
  String lastName;
  String address;
  String urlGoogleMaps;
  List<Socio> members;

  Familia({
    @required this.lastName,
    @required this.address,
    @required this.urlGoogleMaps,
    @required this.members
  });
}

Familia getFamilia() => Familia(
  lastName: 'Medina Hernandez',
  address: 'Priv. De los Geránios 9953-24, Cañadas del florido I sección',
  urlGoogleMaps: "https://www.google.com.mx/maps/place/32%C2%B027'38.1%22N+116%C2%B051'53.3%22W/@32.4605851,-116.8653542,19z/data=!3m1!4b1!4m6!3m5!1s0x0:0x0!7e2!8m2!3d32.4605842!4d-116.8648068",
  members: getSocios()
);