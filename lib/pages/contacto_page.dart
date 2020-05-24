import 'dart:io';

import 'package:famezapp/domain/familia_model.dart';
import 'package:famezapp/domain/socio_model.dart';
import 'package:famezapp/utils/colors.dart';
import 'package:famezapp/utils/font_awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactoPageState();

}

class _ContactoPageState extends State<ContactoPage> {

  Familia familia;

  @override
  Widget build(BuildContext context) {
    _initContactoInfoFromFirestore();
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(32),
                child: Text('Familia',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ))
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(familia.lastName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ))
            ]
          ),
          Divider(),
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home, color: FamezColors.primaryDarkColor),
                title: Text(familia.address),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.map, color: FamezColors.primaryDarkColor),
                    label: Text(
                      'VER EN MAPA',
                      style: TextStyle(color: FamezColors.primaryDarkColor)),
                    onPressed: () {
                      _launchURL(familia.urlGoogleMaps);
                    },
                  )
                ],
              ),
              Divider(),
              _contactoTile(familia.members[0]),
              Divider(),
              _contactoTile(familia.members[1]),
              Divider(),
            ],
          ),
        ]
      )
    );
  }

  void _initContactoInfoFromFirestore() {
    setState(() {
      familia = getFamilia();
    });
  }

  Widget _contactoTile(Socio socio) => Column(
    children: [
      ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            socio.imagePath,
            width: 48,
            height: 48,
            fit: BoxFit.none,
            scale: 12,
            alignment: Alignment(0.0, -0.65),
          ),
        ),
        title: Text(socio.fullName()),
      ),
      _contactBottomActions(socio),
    ],
  );

  IconButton _contactoIconButton({IconData icon, void Function() onPressed}) =>
    IconButton(
      icon: Icon(icon), color: FamezColors.secondaryDarkColor,
      onPressed: onPressed,
    );

  Widget _contactBottomActions(Socio socio) {
    List<Widget> actionButtons = [];
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        actionButtons.add(_contactoIconButton(
          icon: Icons.phone,
          onPressed: () {
            _launchURL('tel:${socio.phoneNumber}');
          },
        ));
        actionButtons.add(_contactoIconButton(
          icon: Icons.phone,
          onPressed: () {
            _launchURL('sms:${socio.phoneNumber}');
          },
        ));
      }
    } catch (e) {}
    actionButtons.add(_contactoIconButton(
      icon: Icons.email,
      onPressed: () {
        _launchURL('mailto:${socio.email}');
      },
    ));
    actionButtons.add(_contactoIconButton(
      icon: FontAwesome.facebook,
      onPressed: () {
        _launchURL(socio.urlFacebook);
      },
    ));
    actionButtons.add(_contactoIconButton(
      icon: FontAwesome.whatsapp,
      onPressed: () {
        _launchURL(socio.urlWhatsApp);
      },
    ));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actionButtons,
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
        msg: 'Esta acción no está disponible',
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}