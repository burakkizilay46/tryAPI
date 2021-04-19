import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';

class LocalJsonPage extends StatefulWidget {
  @override
  _LocalJsonPageState createState() => _LocalJsonPageState();
}

class _LocalJsonPageState extends State<LocalJsonPage> {
  List tumArabalar;

  @override
  void initState() {
    super.initState();
    veriKaynaginiOku().then((gelenArabaListesi) {
      setState(() {
        tumArabalar = gelenArabaListesi;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    veriKaynaginiOku();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Local JSON Page"),
      ),
      body: tumArabalar != null
          ? Container(
              child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tumArabalar[index]["araba_adi"]),
                  subtitle: Text(tumArabalar[index]["ulke"]),
                );
              },
              itemCount: tumArabalar.length,
            ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future<List> veriKaynaginiOku() async {
    /*
      Future<String> jsonOku =
          DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    
      jsonOku.then((okunanJson) {
        debugPrint("Gelen Json: " + okunanJson);
        return okunanJson;
     });
    */

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    debugPrint(gelenJson);

    var arabaListesi = json.decode(gelenJson.toString());
    debugPrint("toplam araba sayisi : " + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Markalar : " + arabaListesi[i]["araba_adi"].toString());
      debugPrint("Ülkesi : " + arabaListesi[i]["ulke"].toString());
    }
    return arabaListesi;
  }
}
