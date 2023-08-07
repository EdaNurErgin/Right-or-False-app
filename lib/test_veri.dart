import 'package:dogru_yanlis/soru.dart';

class TestVeri {
  int _soruIndex = 0; //disaridan dogrudan erisilip kurcalanmamasi icin
  //degiskeni paketledik
  List<Soru> _SoruBankasi = [
    //paketleme yapmak icin SoruBankasi basına
    // '_' koyduk
    //paketleme yaptigim icin artık buna dısaridan dogrudan erisemiyorum
    //sadee burada kontrol edebiliriz main de kontrol edemeyiz
    // not:sınıflar icindeki fonksiyonlara methot denir
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
  ];

  //buna disaridan ulasilsin istedigim icin paketleme yapmıyorum yani main
  //de ulasacagız
  String getSoruMetni() {
    return _SoruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYanit() {
    return _SoruBankasi[_soruIndex].soruYaniti;
  }

//NOT : _SoruBankasi.length sonucu 6 dir cunki listede 6 eleman vardır
  // _soruIndex de maximum 5 olabilir cunku 0 1 2 3 4 5 diye okur lısteyi
  //burası sayesinde ındis5 sorusuna tekrar tıklayınca hata vermez
  void sonrakiSoru() {
    if (_soruIndex + 1 < _SoruBankasi.length) _soruIndex++;
  }

  bool testBittiMi() {
    if (_soruIndex + 1 >= _SoruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruIndex = 0;
  }
}

//burasi oylesine ekstra  Burasi sayesinde sorular sondan basa dogru ilerleyecek
//bu classi kullanırsan eğer.
class RandomTestVeri extends TestVeri {
  int _soruIndex = 5;

  // randomtestveri , testverinin atasidir
  @override //atadan gelme fonksiyonu kullandik
  void sonrakiSoru() {
    //if (_soruIndex + 1 < _SoruBankasi.length)
    _soruIndex--;
  }
}
