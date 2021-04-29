import 'package:flutter/material.dart';
import 'package:ornek/sayfa7.dart';
import 'package:polls/polls.dart';

class sayfa6 extends StatelessWidget{
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
      home: sayfa6Ekrani(),
    );
  }
}

class sayfa6Ekrani extends StatefulWidget {
  sayfa6Ekrani({Key? key}) : super(key: key);


  @override
  _sayfa6EkraniState createState() => _sayfa6EkraniState();
}

class _sayfa6EkraniState extends State<sayfa6Ekrani> {
  double secenek1= 4.0;
  double secenek2= 3.0;
  double secenek3= 3.0;

  Map oyKullananlar = {
    'berkay@gmail.com': 1,
    'ahmet@gmail.com': 3,
    'elif@gmail.com': 1,
    'batuhan@gmail.com': 1,
    'zeynep@gmail.com': 2,
    'murat@gmail.com': 2,
    'hatice@gmail.com': 3,
    'mustafa@gmail.com': 3,
    'hudanur@gmail.com': 1,
    'berke@gmail.com': 2,
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
                Polls.options(title: 'Evet', value: secenek1),
                Polls.options(title: 'Hayır', value: secenek2),
                Polls.options(title: 'Fikrim Yok', value: secenek3),
              ],
                question: Text('Sizce Mobil Programlama zor bir ders mi?'),
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


                },
              ),
              Padding (
                padding: const EdgeInsets.symmetric(vertical:16.0),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sayfa7()),);
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