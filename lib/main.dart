import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "B-Chat",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Self-Chat"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(var gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
            onPressed: () => listeyeEkle(t1.text),
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indeksNumarasi) =>
                    mesajListesi[indeksNumarasi]),
          ),
          Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Beyza";
var mesaj;

class MesajBalonu extends StatelessWidget {
  var mesaj;

  MesajBalonu({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(
              isim[0],
            ),
          ),
          Column(
            children: <Widget>[
              Text(isim),
              Text(mesaj),
            ],
          ),
        ],
      ),
    );
  }
}
