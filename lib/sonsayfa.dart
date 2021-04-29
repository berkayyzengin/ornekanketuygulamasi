import 'package:flutter/material.dart';
import 'package:ornek/main.dart';

class sonsayfa extends StatelessWidget {
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
      home: Scaffold(
        appBar: AppBar(
            title: Text('Anket Sayfası'),
        ),
          body: Center(                                               // Bu sayfadaki yazıyı nasıl ortalarız hocaya sor
             child: Column(
               children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Anket bitmiştir. Katıldığınız için teşekkür ederiz. Bu anket sayfa henüz geliştirme aşamasındadır, anlayışınız için teşekkür ederiz. ')
                  ]
                  ),
                ),
                 Padding (
                   padding: const EdgeInsets.symmetric(vertical:16.0),
                   child: ElevatedButton(onPressed: () {
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => MyApp()),);
                   },
                     child: Text('Anasayfaya Dön'),),
                 ),
               ],
             ),)
    ),
    );
  }
}