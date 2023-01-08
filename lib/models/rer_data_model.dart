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

  RetCommunication.fromJson(Map<String, dynamic> json) {
    comuText1 = json['comu_text1'];
  }
}

class RetMarakez {
  String? mara_loc1;

  String? maraTitle1;
  String? maraPhone1;

  RetMarakez.fromJson(Map<String, dynamic> json) {
    mara_loc1 = json['mara_loc1'];
    maraTitle1 = json['mara_title1'];
    maraPhone1 = json['mara_phone1'];
  }
}

class RetPhoto {
  String? photo1;

  RetPhoto.fromJson(Map<String, dynamic> json) {
    photo1 = json['photo1'];
  }
}

class RetProcedures {
  String? proText1;

  RetProcedures.fromJson(Map<String, dynamic> json) {
    proText1 = json['pro_text1'];
  }
}

class RetSymptoms {
  String? symText1;

  RetSymptoms.fromJson(Map<String, dynamic> json) {
    symText1 = json['sym_text1'];
  }
}
