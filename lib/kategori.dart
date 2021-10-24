import 'package:f_market/urun_detay.dart';
import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key key, this.kategori}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List<Widget> gosterilecekListe;

  @override
  void initState() {
    super.initState();

    if (widget.kategori == "Temel Gıda") {
      gosterilecekListe = [
        urunKarti(
          isim: "Yumurta",
          fiyat: "30.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Zeytin Yağı",
          fiyat: "50.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Süt",
          fiyat: "3.50 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Su",
          fiyat: "1 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Makarna",
          fiyat: "2.75 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
      ];
    }
    if (widget.kategori == "Şekerleme") {
      gosterilecekListe = [
        urunKarti(
          isim: "Kurabiye",
          fiyat: "15.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Çikolata",
          fiyat: "2.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Pasta",
          fiyat: "25.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
      ];
    }
    if (widget.kategori == "İçecekler") {
      gosterilecekListe = [
        urunKarti(
          isim: "Meyve Suyu",
          fiyat: "2.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Ayran",
          fiyat: "2.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Kola",
          fiyat: "8.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Çikolatalı Süt",
          fiyat: "3.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
      ];
    }
    if (widget.kategori == "Temizlik") {
      gosterilecekListe = [
        urunKarti(
          isim: "Çamaşır Suyu",
          fiyat: "28.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Bulaşık Süngeri",
          fiyat: "3.50 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
        urunKarti(
          isim: "Paspas",
          fiyat: "15.0 TL",
          resimYolu:
              "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_1280.jpg",
        ),
      ];
    }
  }

  Widget urunKarti({
    String isim,
    String fiyat,
    String resimYolu,
    bool mevcut = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UrunDetay(
                      isim: isim,
                      fiyat: fiyat,
                      resim: resimYolu,
                      mevcut: mevcut,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: isim,
              child: Container(
                width: 120.0,
                height: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      resimYolu,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              isim,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              fiyat,
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
        children: gosterilecekListe,
      ),
    );
  }
}
