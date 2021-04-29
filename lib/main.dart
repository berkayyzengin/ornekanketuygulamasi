import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'giris.dart';
import 'hakkinda.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anket',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        fontFamily: 'Georgia',

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),),

      //initialRoute: '/', routes: { '/': (context) => giris() },     NEDEN OLMADI ANLAMADIM

      home: MyHomePage(title: 'GİRİŞ EKRANI'),
    );
  }
}
                                                                        //İSİM, YAŞ VE ÖZELLİKLE MAİL ADRESİ İÇİN HOCAYA SOR
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GİRİŞ EKRANI'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Adınız ve Soyadınız'),      //,textAlign: TextAligin.left komutu ile yazıyı sola yönlendirmek istedim OLMADI
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Adınızı ve Soyadınızı Giriniz',
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Text('Yaşınız'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Yaşınızı Giriniz (Sadece Rakam)',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Text('Mail Adresi'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mail Adresinizi Giriniz',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],



                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => giris()),);
                  final snackBar = SnackBar(content: Text('Ankete Geçiliyor'));   // EKRANDA GEÇ GÖZÜKÜYOR NEDENİNİ ANLAMADIM
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                child: Text('Ankete Başla'),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => hakkinda()),);
                  },
                    child: Text('Hakkında'),
                  )
              )
            ]
        ),
      ),
    );
  }
}