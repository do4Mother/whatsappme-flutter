import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.green,
      ),
      body: AboutPageDesc(),
    );
  }
}

class AboutPageDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(24.0),
          height: 120.0,
          child: Center(
            child: Text('WhatsApp Me aplikasi gratis yang berguna untuk menghubungi seseorang tanpa menyimpan kontaknya terlebih dahulu.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        InkWell(
          child: Text('Source Code', style: TextStyle( color: Colors.blue),),
          onTap: (){
            _launchURL();
          },
        )
      ],
    );
  }
}

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}