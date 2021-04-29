import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hakkinda extends StatelessWidget {
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
                title: Text('Hakkında')
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,                          // Yazı parametresini hizlamada nasıl ortalayacağız hocaya sor
                  children: <Widget>[
                    Text(
                        'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir Çınar tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173004034 numaralı Berkay ZENGİN tarafından 30 Nisan 2021 gününde yapılmıştır. '),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(onPressed: () {
                          Navigator.pop(context);
                          final snackBar = SnackBar(content: Text('Anasayfa yükleniyor lütfen bekleyin'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                          child: Text('Anasayfa'),
                        )
                    )
                  ],
                ),
              ),
            ),
        ),
    );
  }
}