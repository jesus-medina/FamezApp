import 'package:famezapp/utils/platform_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactoPageState();

}

class _ContactoPageState extends State<ContactoPage> {

  @override
  Widget build(BuildContext context) {
    _initContactoInfoFromFirestore();
    return Scaffold(
      body: Center(child: Text('We\'re inside Contacto page'))
    );
  }

  void _initContactoInfoFromFirestore() {
    
  }

}