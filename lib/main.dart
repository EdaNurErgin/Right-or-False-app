import 'package:dogru_yanlis/Constants.dart';
import 'package:dogru_yanlis/test_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> elections = [];
  TestVeri test_1 =
      TestVeri(); //TestVeri class ı icindekilerine ulasmak icin test_1
  //degiskenini kullanacagız

  void butonFonskyonu(bool secilenbuton) {
    if (test_1.testBittiMi() == true) {
      //alertDialog gosterecek
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(
                "tebrikler bitti"), //bu 6ınci sorudan sonra bir text cıkartır
            //content: new Text("Tebrikler Bitti"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new ElevatedButton(
                child: new Text("Başa Dön"),
                onPressed: () {
                  //dialog kutusu ekrandan kalksın
                  Navigator.of(context)
                      .pop(); //bizim container yüzeyimize gidip alertdialog
                  //textinin yapiskanini yapistiriyor gibi düsün fakat .pop() dediginde
                  //bu cıkartmayi kaldir demek anlamina gelir

                  //sonra da ekran kendini sıfırlasın
                  setState(() {
                    //ındexi sıfırla
                    test_1.testiSifirla();
                    //secimleri sifirla
                    elections = [];
                  });
                },
              ),
            ],
          );
        },
      );
      /*setState(() {
        //setState sayesinde test bittikten sonra ekran kendini guncelleyecek ve ekran sıfırlanacak
        //fakat bir sorun var Basa dön butonuna basmadan bu sıfırlanma olayı gerceklesiyor
        //setstate nin icindeki bu olayın butona bastıktan sonra gerceklesmesi icin bu kodu
        //FlatButton wiitgeti icindeki onPressed icine almalıyımmm
        //ındexi sıfırla
        test_1.testiSifirla();
        //secimleri sifirla
        elections = [];
      }); */
    } else {
      setState(() {
        test_1.getSoruYanit() == secilenbuton
            ? elections.add(kDogruIcon)
            : elections.add(kYanlisIcon);

        test_1.sonrakiSoru();
      });
    }
  }

  /* List<String> sorular = [
    'titanic gelmis gecmis en buyuk gemidir',
    'dunyadaki tavuk sayisi insan sayisindan fazladir',
    'kelebeklerin omru bir gündür',
    'dunya duzdur',
    'kaju fıstıgı aslinda bir meyvenin sapidir',
    'fatih sultan mehmet hic patates yememistir',
  ]; */

  // List<bool> yanitlar = [false, true, false, false, true, true];

  /* Soru soru_1 = Soru(
      soruMetni: 'titanic gelmis gecmis en buyuk gemidir', soruYaniti: false);

  Soru soru_2 = Soru(
      soruMetni: 'dunyadaki tavuk sayisi insan sayisindan fazladir',
      soruYaniti: true);

  Soru soru_3 =
      Soru(soruMetni: 'kelebeklerin omru bir gündür', soruYaniti: false);

  Soru soru_4 = Soru(soruMetni: 'dunya duzdur', soruYaniti: false);

  Soru soru_5 = Soru(
      soruMetni: 'kaju fıstıgı aslinda bir meyvenin sapidir', soruYaniti: true);
  Soru soru_6 = Soru(
      soruMetni: 'fatih sultan mehmet hic patates yememistir',
      soruYaniti: true); */

//aslinda witgetler de bir class dir sadece onlar hazır class seklindedir bizim yazmamıza gerek yoktur
  /*List<Soru> SoruBankasi = [
    Soru(
        soruMetni: 'titanic gelmis gecmis en buyuk gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'dunyadaki tavuk sayisi insan sayisindan fazladir',
        soruYaniti: true),
    Soru(soruMetni: 'kelebeklerin omru bir gündür', soruYaniti: false),
    Soru(soruMetni: 'dunya duzdur', soruYaniti: false),
    Soru(
        soruMetni: 'kaju fıstıgı aslinda bir meyvenin sapidir',
        soruYaniti: true),
    Soru(
        soruMetni: 'fatih sultan mehmet hic patates yememistir',
        soruYaniti: true)
  ]; */

  //int soruIndex = 0; //sorulari dolasmak icin indexe ilk degere atadk

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1
                    .getSoruMetni(), //parametre almasina gerek yok cunku getsorumetni methodu parametresiz bir methot
                // test_1.SoruBankasi[soruIndex].soruMetni,
                //test_1 verisinin icinde bulunan sorubankasına git
                //soru bankasi listesinin 1inci ikinci ucuncu hangisiyle o elemaana ulas
                //daha sonra o elemanın soruMetni instance variable sine ulas.
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //Wrap, row gibi dikey column gibi yatay calisir
          //direction: Axis.horizontal, //bu sekilde ıconlar yan yana dizilir
          //eğer row olursaa ıconlar satiri tasırdıgında devami gorunmez
          //bunu onlemek icin Wrap witgeti kullan ve taşan ıconlar alt satıra gecsin
          spacing: 20, //yatayda ıconlar arasi bosluk bırakir
          runSpacing: 20, //dikeyde ıconlar arasi bosluk bırakir
          //alignment: WrapAlignment.end, //ıconlari sağdan sola dizer
          children: elections,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: Colors.red[400],
                      ),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        butonFonskyonu(false);
                        /* setState(() {

                          //  dogruYanit == false
                          //    ? elections.add(kDogruIcon)
                          //  : elections.add(kYanlisIcon);
                          /*  if (dogruYanit == false) {
                            elections.add(kDogruIcon);
                          } else {
                            elections.add(kYanlisIcon);
                          } */
                          //soruIndex++; bunu artik testveri class ındaki methot yapacak
                          // test_1.sonrakiSoru();
                          // elections.add(kYanlisIcon);
                        });*/
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: Colors.green[400],
                      ),
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        butonFonskyonu(true);
                        /* setState(() {

                          //dogruYanit == true
                          //  ? elections.add(kDogruIcon) //dogrusembolu
                          //: elections.add(kYanlisIcon); //yanlissembolu
                          // soruIndex++; bunu artık test veri class ındaki methot yapacak
                          //test_1.sonrakiSoru();
                          // elections.add(kDogruIcon);
                        });*/
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

/*
const Icon dogruIcon = Icon(Icons.mood, color: Colors.green);
const Icon yanlisIcon = Icon(Icons.mood_bad, color: Colors.red); */
//"const" terimi, Flutter'da kullanılan bir değişken
// tanımlama belirtecidir. Flutter, Dart programlama dilini kullanır
// ve Dart dilinde "const" ifadesi, sabit bir değeri temsil eden bir
// değişkeni veya nesneyi tanımlamak için kullanılır.
//
// Bir değişkeni "const" olarak tanımladığınızda,
// o değişkenin değeri derleme zamanında belirlenir
// ve çalışma zamanında değiştirilemez. Yani,
// const olarak tanımlanan bir değişkenin değeri programın
// çalışma süresince sabit kalır.
//yukarıdaki kod icin lib dosyasından  Constants adinda
// yeni bir dart dosyası olusturduk ve sabitleri oraya aldik.

//claslari dogrudan kullanmıyoruz onların icinde olusturdgumz nesneleri dogrudan
//kullanıyoruz
