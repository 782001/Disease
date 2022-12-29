class RetModel {
  RetData? retData;

  RetModel.fromJson(Map<String, dynamic> json) {
    retData = json['ret_data'] != null
        ? new RetData.fromJson(json['ret_data'])
        : null;
  }
}

class RetData {
  List<RetCommunication>? retCommunication;
  List<RetMarakez>? retMarakez;
  List<RetPhoto>? retPhoto;
  List<RetProcedures>? retProcedures;
  List<RetSymptoms>? retSymptoms;

  RetData.fromJson(Map<String, dynamic> json) {
    if (json['communication'] != null) {
      retCommunication = <RetCommunication>[];
      json['communication'].forEach((v) {
        retCommunication!.add(new RetCommunication.fromJson(v));
      });
    }
    if (json['marakez'] != null) {
      retMarakez = <RetMarakez>[];
      json['marakez'].forEach((v) {
        retMarakez!.add(new RetMarakez.fromJson(v));
      });
    }
    if (json['photo'] != null) {
      retPhoto = <RetPhoto>[];
      json['photo'].forEach((v) {
        retPhoto!.add(new RetPhoto.fromJson(v));
      });
    }
    if (json['procedures'] != null) {
      retProcedures = <RetProcedures>[];
      json['procedures'].forEach((v) {
        retProcedures!.add(new RetProcedures.fromJson(v));
      });
    }
    if (json['symptoms'] != null) {
      retSymptoms = <RetSymptoms>[];
      json['symptoms'].forEach((v) {
        retSymptoms!.add(new RetSymptoms.fromJson(v));
      });
    }
  }
}

class RetCommunication {
  String? comuText1;
  String? comuText2;
  String? comuText3;
  String? comuText4;

  RetCommunication.fromJson(Map<String, dynamic> json) {
    comuText1 = json['comu_text1'];
    comuText2 = json['comu_text2'];
    comuText3 = json['comu_text3'];
    comuText4 = json['comu_text4'];
  }
}

class RetMarakez {
  String? mara_loc1;
  String? mara_loc2;
  String? maraTitle1;
  String? maraPhone1;

  String? maraTitle2;
  String? maraPhone2;

  RetMarakez.fromJson(Map<String, dynamic> json) {
    mara_loc1 = json['mara_loc1'];
    mara_loc2 = json['mara_loc2'];
    maraTitle1 = json['mara_title1'];
    maraPhone1 = json['mara_phone1'];

    maraTitle2 = json['mara_title2'];
    maraPhone2 = json['mara_phone2'];
  }
}

class RetPhoto {
  String? photo1;
  String? photo2;

  RetPhoto.fromJson(Map<String, dynamic> json) {
    photo1 = json['photo1'];
    photo2 = json['photo2'];
  }
}

class RetProcedures {
  String? proText1;
  String? proText2;
  String? proText3;
  String? proText4;
  String? proText5;
  String? proText6;

  RetProcedures.fromJson(Map<String, dynamic> json) {
    proText1 = json['pro_text1'];
    proText2 = json['pro_text2'];
    proText3 = json['pro_text3'];
    proText4 = json['pro_text4'];
    proText5 = json['pro_text5'];
    proText6 = json['pro_text6'];
  }
}

class RetSymptoms {
  String? symText1;
  String? symText2;
  String? symText3;
  String? symText4;
  String? symText5;
  String? symText6;
  String? symText7;
  String? symText8;

  RetSymptoms.fromJson(Map<String, dynamic> json) {
    symText1 = json['sym_text1'];
    symText2 = json['sym_text2'];
    symText3 = json['sym_text3'];
    symText4 = json['sym_text4'];
    symText5 = json['sym_text5'];
    symText6 = json['sym_text6'];
    symText7 = json['sym_text7'];
    symText8 = json['sym_text8'];
  }
}
