import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ornek/sayfa2.dart';
import 'package:polls/polls.dart';

class giris extends StatelessWidget{
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
      home: GirisEkrani(),
    );
  }
}

class GirisEkrani extends StatefulWidget {
  GirisEkrani({Key? key}) : super(key: key);


  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  double secenek1= 3.0;  //veritabanına bağlayamadığım için rastgele birim verdim
  double secenek2= 3.0;
  double secenek3= 3.0;
  double secenek4= 1.0;
  double secenek5= 1.0;


  Map oyKullananlar = {
    'berkay@gmail.com': 1,         // bu kullanıcılar zaten oy kullandı bunları datayı aktarıp tekrar ankete katılmamasını sağlamamız gerekiyor
    'ahmet@gmail.com': 1,
    'elif@gmail.com': 2,
    'batuhan@gmail.com': 3,
    'zeynep@gmail.com': 2,
    'murat@gmail.com': 3,
    'hatice@gmail.com': 4,
    'mustafa@gmail.com': 5,
    'hudanur@gmail.com': 3,
    'berke@gmail.com': 2,

  };

  String kullanici = 'aktif_kullanici@gmail.com';   // ancak bu kullanıcı giriş yapıp oy kullanabilir, // yani bu kullanıcı girdiğinde güncellenmiş verileri görecek
  String yonetici = 'yönetici@gmail.com';           // eski kullanıcılar girerse oy verdiğindeki son hali görür
                                                    // yönetici ile girildiğinde oy kullanan kişilerin verilerini görüntülemesini sağlamam gerekiyor

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
              Polls.options(title: 'Fenerbahçe', value: secenek1),
              Polls.options(title: 'Galatasaray', value: secenek2),
              Polls.options(title: 'Beşiktaş', value: secenek3),
              Polls.options(title: 'Diğer', value: secenek4),
              Polls.options(title: 'Fikrim Yok', value: secenek5),
            ],
              question: Text('Türkiye Futbol Süper Liginde bu sene hangi takım şampiyon olur?'),       // soru text'ini nasıl ortalarız hocaya sor
              voteData: oyKullananlar,                                                                 // Anketlerin cevaplanmadan geçmemesini nasıl engelleriz hocaya sor
              currentUser: kullanici,
              creatorID: yonetici,
              userChoice: oyKullananlar[this.kullanici], //üstüste ankete aynı kullanıcının katılımının engellenmesi için
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
                    secenek4 +=1;
                  });
                }

              },
            ),
            Padding (
              padding: const EdgeInsets.symmetric(vertical:16.0),
              child: ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => sayfa2()),);
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