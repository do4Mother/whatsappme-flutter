import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'about.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      routes: {
        '/': (context) => ScaffoldHome(),
        '/about': (context) => AboutPage()
      },
    );
  }
}

class ScaffoldHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Me'),
          backgroundColor: Colors.green,
        ),
        body: MyHomePage(),
        drawer: AppDrawer(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String numberphone;

  final _formkey = new GlobalKey<FormState>();

  _launchURL() async {
    var url = 'whatsapp://send?phone=62$numberphone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200.0,
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 14.0),
                  child: Center(
                    child: TypewriterAnimatedTextKit(
                      text: [
                        "Welcome to WhatsAppMe",
                        "Thank you for download this app"
                      ],
                      textStyle: TextStyle(
                        fontSize: 24.0,
                        fontFamily: "Agne",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical:16.0),
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (val) {
                        numberphone = val;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(4.0),
                        icon: Icon(Icons.phone),
                        labelText: 'Enter Phone Number',
                        helperText: '89933xxxx',
                      ),
                      validator: (val){
                        if(val.isEmpty){
                          return 'Please enter number';
                        }
                      },
                      maxLength: 12,
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('Click Me'),
                    color: Colors.teal,
                    textColor: Colors.white,
                    onPressed: (){
                      if(_formkey.currentState.validate()){
                        _formkey.currentState.save();
                        _launchURL();
                      }
                    },
                  ),
                )
              ],
            )
        ),
          ),
      ],
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        padding: EdgeInsets.symmetric(vertical:30.0),
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text('Home'),
            leading: Icon(Icons.home,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text('About'),
            leading: Icon(Icons.apps,),
            onTap: (){
              Navigator.pushNamed(context, '/about');
            },
          )
        ],
      ),
    );
  }
}