import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ornek/sayfa5.dart';
import 'package:polls/polls.dart';

class sayfa4 extends StatelessWidget{
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
      home: sayfa4Ekrani(),
    );
  }
}

class sayfa4Ekrani extends StatefulWidget {
  sayfa4Ekrani({Key? key}) : super(key: key);


  @override
  _sayfa4EkraniState createState() => _sayfa4EkraniState();
}

class _sayfa4EkraniState extends State<sayfa4Ekrani> {
  double secenek1= 3.0;
  double secenek2= 3.0;
  double secenek3= 2.0;
  double secenek4= 0.0;
  double secenek5= 1.0;
  double secenek6= 0.0;
  double secenek7= 1.0;

  Map oyKullananlar = {
    'berkay@gmail.com': 1,
    'ahmet@gmail.com': 2,
    'elif@gmail.com': 3,
    'batuhan@gmail.com': 3,
    'zeynep@gmail.com': 1,
    'murat@gmail.com': 5,
    'hatice@gmail.com': 2,
    'mustafa@gmail.com': 2,
    'hudanur@gmail.com': 1,
    'berke@gmail.com': 7,
  };

  String kullanici = 'aktif_kullanici@gmail.com';
  String yonetici = 'yönetici@gmail.com';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anket Ekranı'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Polls(children: [
                Polls.options(title: 'Twitter', value: secenek1),
                Polls.options(title: 'Facebook', value: secenek2),
                Polls.options(title: 'İnstagram', value: secenek3),
                Polls.options(title: 'Snapchat', value: secenek4),
                Polls.options(title: 'Pinterest', value: secenek5),
                Polls.options(title: 'Diğer', value: secenek6),
                Polls.options(title: 'Kullanmıyorum', value: secenek7),
              ],
                question: Text('Sosyal medya uygulamalarından en çok hangisini tercih ediyorsunuz?'),
                voteData: oyKullananlar,
                currentUser: kullanici,
                creatorID: yonetici,
                userChoice: oyKullananlar[this.kullanici],
                onVoteBackgroundColor: Colors.black,
                leadingBackgroundColor: Colors.black,
                backgroundColor: Colors.black,
                onVote: (secim) {
                  print(secim);
                  setState(() {
                    this.oyKullananlar[this.kullanici] = secim;
                  });

                  if(secim ==1){
                    setState(() {
                      secenek1 +=1;
                    });
                  }

                  else if(secim ==2){
                    setState(() {
                      secenek2 +=1;
                    });
                  }

                  else if(secim ==3){
                    setState(() {
                      secenek3 +=1;
                    });
                  }

                  else if(secim ==4){
                    setState(() {
                      secenek4 +=1;
                    });
                  }

                  else if(secim ==5){
                    setState(() {
                      secenek5 +=1;
                    });
                  }

                  else if(secim ==6){
                    setState(() {
                      secenek6 +=1;
                    });
                  }

                  else if(secim ==7){
                    setState(() {
                      secenek7 +=1;
                    });
                  }




                },
              ),
              Padding (
                padding: const EdgeInsets.symmetric(vertical:16.0),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sayfa5()),);
                  final snackBar = SnackBar(content: Text('Cevap kaydediliyor lüften bekleyiniz'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                  child: Text('Diğer Soru'),),
              ),
            ],
          ),
        )
    );
  }
}