import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';

import 'package:tryagainapi/models/Araba.dart';

class LocalJsonPage extends StatefulWidget {
  @override
  _LocalJsonPageState createState() => _LocalJsonPageState();
}

class _LocalJsonPageState extends State<LocalJsonPage> {
  List<Araba> tumArabalar;

  @override
  void initState() {
    super.initState();
    /*veriKaynaginiOku().then((gelenArabaListesi) {
      setState(() {
        tumArabalar = gelenArabaListesi;
      });
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    veriKaynaginiOku();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Local JSON Page"),
      ),
      body: Container(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, sonuc) {
            if (sonuc.hasData) {
              tumArabalar = sonuc.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tumArabalar[index].arabaAdi),
                    subtitle: Text(tumArabalar[index].ulke),
                  );
                },
                itemCount: tumArabalar.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  /*
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
  */
  Future<List<Araba>> veriKaynaginiOku() async {
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

    List<Araba> arabaListesi = (json.decode(gelenJson) as List).map((mapYapisi) => Araba.fromJson(mapYapisi)).toList();
    debugPrint("toplam araba sayisi : " + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Markalar : " + arabaListesi[i].arabaAdi.toString());
      debugPrint("Ülkesi : " + arabaListesi[i].ulke.toString());
    }
    return arabaListesi;
  }
}
