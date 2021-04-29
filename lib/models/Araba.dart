import 'package:tryagainapi/models/ArabaModel.dart';

class Araba {
  String arabaAdi;
  String ulke;
  int kurulusTarihi;
  List<ArabaModel> model;

  Araba({this.arabaAdi, this.ulke, this.kurulusTarihi, this.model});

  Araba.fromJson(Map<String, dynamic> json) {
    arabaAdi = json['araba_adi'];
    ulke = json['ulke'];
    kurulusTarihi = json['kurulus_tarihi'];
    if (json['model'] != null) {
      model = new List<ArabaModel>();
      json['model'].forEach((v) {
        model.add(new ArabaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['araba_adi'] = this.arabaAdi;
    data['ulke'] = this.ulke;
    data['kurulus_tarihi'] = this.kurulusTarihi;
    if (this.model != null) {
      data['model'] = this.model.map((v) => v.toJson()).toList();
    }
    return data;
  }
}