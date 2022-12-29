class WestModel {
  WestData? westData;

  WestModel.fromJson(Map<String, dynamic> json) {
    westData = json['west_data'] != null
        ? new WestData.fromJson(json['west_data'])
        : null;
  }
}

class WestData {
  List<WestCommunication>? westCommunication;
  List<WestMarakez>? westMarakez;
  List<WestPhoto>? westPhoto;
  List<WestProcedures>? westProcedures;
  List<WestSymptoms>? westSymptoms;

  WestData.fromJson(Map<String, dynamic> json) {
    if (json['communication'] != null) {
      westCommunication = <WestCommunication>[];
      json['communication'].forEach((v) {
        westCommunication!.add(new WestCommunication.fromJson(v));
      });
    }
    if (json['marakez'] != null) {
      westMarakez = <WestMarakez>[];
      json['marakez'].forEach((v) {
        westMarakez!.add(new WestMarakez.fromJson(v));
      });
    }
    if (json['photo'] != null) {
      westPhoto = <WestPhoto>[];
      json['photo'].forEach((v) {
        westPhoto!.add(new WestPhoto.fromJson(v));
      });
    }
    if (json['procedures'] != null) {
      westProcedures = <WestProcedures>[];
      json['procedures'].forEach((v) {
        westProcedures!.add(new WestProcedures.fromJson(v));
      });
    }
    if (json['symptoms'] != null) {
      westSymptoms = <WestSymptoms>[];
      json['symptoms'].forEach((v) {
        westSymptoms!.add(new WestSymptoms.fromJson(v));
      });
    }
  }
}

class WestCommunication {
  String? comuText1;
  String? comuText2;

  WestCommunication.fromJson(Map<String, dynamic> json) {
    comuText1 = json['comu_text1'];
    comuText2 = json['comu_text2'];
  }
}

class WestMarakez {
  String? mara_loc1;
  String? mara_loc2;
  String? mara_loc3;
  String? maraTitle1;
  String? maraTitle2;
  String? maraTitle3;
  String? maraPhone1;
  String? maraPhone2;
  String? maraPhone3;

  WestMarakez.fromJson(Map<String, dynamic> json) {
    mara_loc1 = json['mara_loc1'];
    mara_loc2 = json['mara_loc2'];
    mara_loc3 = json['mara_loc3'];

    maraTitle1 = json['mara_title'];
    maraTitle2 = json['mara_title2'];
    maraTitle3 = json['mara_title3'];

    maraPhone1 = json['mara_phone'];
    maraPhone2 = json['mara_phone2'];
    maraPhone3 = json['mara_phone3'];
  }
}

class WestPhoto {
  String? photo1;
  String? photo2;
  String? photo3;

  WestPhoto.fromJson(Map<String, dynamic> json) {
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
  }
}

class WestProcedures {
  String? proText1;
  String? proText2;
  String? proText3;
  String? proText4;
  String? proText5;
  String? proTitle1;
  String? proTitle2;

  WestProcedures.fromJson(Map<String, dynamic> json) {
    proText1 = json['pro_text1'];
    proText2 = json['pro_text2'];
    proText3 = json['pro_text3'];
    proText4 = json['pro_text4'];
    proText5 = json['pro_text5'];
    proTitle1 = json['pro_title1'];
    proTitle2 = json['pro_title2'];
  }
}

class WestSymptoms {
  String? symText1;
  String? symText2;
  String? symText3;
  String? symText4;
  String? symText5;

  WestSymptoms.fromJson(Map<String, dynamic> json) {
    symText1 = json['sym_text1'];
    symText2 = json['sym_text2'];
    symText3 = json['sym_text3'];
    symText4 = json['sym_text4'];
    symText5 = json['sym_text5'];
  }
}
