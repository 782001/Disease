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

  WestCommunication.fromJson(Map<String, dynamic> json) {
    comuText1 = json['comu_text1'];
  }
}

class WestMarakez {
  String? mara_loc1;

  String? maraTitle1;

  String? maraPhone1;

  WestMarakez.fromJson(Map<String, dynamic> json) {
    mara_loc1 = json['mara_loc1'];

    maraTitle1 = json['mara_title'];

    maraPhone1 = json['mara_phone'];
  }
}

class WestPhoto {
  String? photo1;

  WestPhoto.fromJson(Map<String, dynamic> json) {
    photo1 = json['photo1'];
  }
}

class WestProcedures {
  String? proText1;

  WestProcedures.fromJson(Map<String, dynamic> json) {
    proText1 = json['pro_text1'];
  }
}

class WestSymptoms {
  String? symText1;

  WestSymptoms.fromJson(Map<String, dynamic> json) {
    symText1 = json['sym_text1'];
  }
}
