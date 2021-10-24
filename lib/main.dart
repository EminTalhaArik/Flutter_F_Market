import 'package:f_market/sepetim.dart';
import 'package:f_market/urunler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "F Market",
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Widget> _icerikler;
  int _aktifIcerikNo = 0;

  @override
  void initState() {
    super.initState();
    _icerikler = [
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[400],
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Emin Talha Arık"),
              accountEmail: Text("iletisim.emint@gmail.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2021/01/14/17/53/man-5917529_960_720.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(
                    50.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red[400],
              ),
            ),
            ListTile(
              title: Text("Siparişlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("İndirimlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Ayarlar"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _icerikler[_aktifIcerikNo],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[400],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Ürünler",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Sepetim",
          ),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          print(tiklananButonPozisyonNo);
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
    );
  }
}
