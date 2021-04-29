class ArabaModel {
  String modelAdi;
  int fiyat;
  bool benzinli;

  ArabaModel({this.modelAdi, this.fiyat, this.benzinli});

  ArabaModel.fromJson(Map<String, dynamic> json) {
    modelAdi = json['model_adi'];
    fiyat = json['fiyat'];
    benzinli = json['benzinli'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_adi'] = this.modelAdi;
    data['fiyat'] = this.fiyat;
    data['benzinli'] = this.benzinli;
    return data;
  }
}
