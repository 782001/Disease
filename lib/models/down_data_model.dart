// class DownModel {
//   DownDataModel? downData;
//   DownModel.fromJson(Map<String, dynamic> json) {
//     downData = DownDataModel.fromJson(json['down_data']);
//   }
// }

// class DownDataModel {
//   List<CommunicationModel> communication = [];
//   List<MarakezModel> marakez = [];
//   List<photoModel> photo = [];
//   List<ProceduresModel> procedures = [];
//   List<SymptomsModel> symptoms = [];

//   DownDataModel.fromJson(Map<String, dynamic> json) {
//     json['communication'].forEach((element) {
//       communication.add(CommunicationModel.fromJson(element));
//     });
//     json['marakez'].forEach((element) {
//       marakez.add(MarakezModel.fromJson(element));
//     });
//     json['photo'].forEach((element) {
//       photo.add(photoModel.fromJson(element));
//     });
//     json['procedures'].forEach((element) {
//       procedures.add(ProceduresModel.fromJson(element));
//     });
//     json['symptoms'].forEach((element) {
//       symptoms.add(SymptomsModel.fromJson(element));
//     });
//   }
// }

// class SymptomsModel {
//   late String sym_text1;

//   SymptomsModel.fromJson(Map<String, dynamic> json) {
//     sym_text1 = json['sym_text1'];
//   }
// }

// class ProceduresModel {
//   late String pro_text1;

//   ProceduresModel.fromJson(Map<String, dynamic> json) {
//     pro_text1 = json['pro_text1'];
//   }
// }

// class photoModel {
//   late String photo1;
//   late String photo2;
//   late String photo3;
//   late String photo4;
//   late String photo5;

//   photoModel.fromJson(Map<String, dynamic> json) {
//     photo1 = json['photo1'];
//     photo2 = json['photo2'];
//     photo3 = json['photo3'];
//     photo4 = json['photo4'];
//     photo5 = json['photo5'];
//   }
// }

// class MarakezModel {
//   late String mara_loc;
//   late String mara_location;
//   late String mara_phone;
//   late String mara_title;
//   MarakezModel.fromJson(Map<String, dynamic> json) {
//     mara_loc = json['mara_loc'];
//     mara_location = json['mara_location'];
//     mara_phone = json['mara_phone'];
//     mara_title = json['mara_title'];
//   }
// }

// class CommunicationModel {
//   late String comu_text1;
//   late String comu_text2;
//   late String comu_text3;
//   late String comu_text4;
//   CommunicationModel.fromJson(Map<String, dynamic> json) {
//     comu_text1 = json['comu_text1'];
//     comu_text2 = json['comu_text2'];
//     comu_text3 = json['comu_text3'];
//     comu_text4 = json['comu_text4'];
//   }
// }

class DownModel {
  DownData? downData;

  DownModel.fromJson(Map<String, dynamic> json) {
    downData = json['down_data'] != null
        ? new DownData.fromJson(json['down_data'])
        : null;
  }
}

class DownData {
  List<DownCommunication>? downCommunication;
  List<DownMarakez>? downMarakez;
  List<DownPhoto>? downPhoto;
  List<DownProcedures>? downProcedures;
  List<DownSymptoms>? downSymptoms;

  DownData.fromJson(Map<String, dynamic> json) {
    if (json['communication'] != null) {
      downCommunication = <DownCommunication>[];
      json['communication'].forEach((v) {
        downCommunication!.add(new DownCommunication.fromJson(v));
      });
    }
    if (json['marakez'] != null) {
      downMarakez = <DownMarakez>[];
      json['marakez'].forEach((v) {
        downMarakez!.add(new DownMarakez.fromJson(v));
      });
    }
    if (json['photo'] != null) {
      downPhoto = <DownPhoto>[];
      json['photo'].forEach((v) {
        downPhoto!.add(new DownPhoto.fromJson(v));
      });
    }
    if (json['procedures'] != null) {
      downProcedures = <DownProcedures>[];
      json['procedures'].forEach((v) {
        downProcedures!.add(new DownProcedures.fromJson(v));
      });
    }
    if (json['symptoms'] != null) {
      downSymptoms = <DownSymptoms>[];
      json['symptoms'].forEach((v) {
        downSymptoms!.add(new DownSymptoms.fromJson(v));
      });
    }
  }
}

class DownCommunication {
  String? comuText1;
  String? comuText2;
  String? comuText3;
  String? comuText4;

  DownCommunication.fromJson(Map<String, dynamic> json) {
    comuText1 = json['comu_text1'];
    comuText2 = json['comu_text2'];
    comuText3 = json['comu_text3'];
    comuText4 = json['comu_text4'];
  }
}

class DownMarakez {
  String? maraLocation;
  String? mara_loc1;
  String? mara_loc2;
  String? maraTitle;
  String? maraPhone;

  String? maraLocation2;
  String? maraTitle2;
  String? maraPhone2;

  DownMarakez.fromJson(Map<String, dynamic> json) {
    mara_loc1 = json['mara_loc1'];
    mara_loc2 = json['mara_loc2'];
    maraLocation = json['mara_location'];
    maraTitle = json['mara_title'];
    maraPhone = json['mara_phone'];

    maraLocation2 = json['mara_location2'];
    maraTitle2 = json['mara_title2'];
    maraPhone2 = json['mara_phone2'];
  }
}

class DownPhoto {
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;

  DownPhoto.fromJson(Map<String, dynamic> json) {
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
  }
}

class DownProcedures {
  String? proText1;

  DownProcedures.fromJson(Map<String, dynamic> json) {
    proText1 = json['pro_text1'];
  }
}

class DownSymptoms {
  String? symText1;

  DownSymptoms.fromJson(Map<String, dynamic> json) {
    symText1 = json['sym_text1'];
  }
}
