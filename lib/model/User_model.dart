// ignore_for_file: file_names

class Usermodel {
  late Result? result;
  List<Errors>? errors;
  late bool isSuccess;
  late String messageCode;

  Usermodel(
      {this.result,
      this.errors,
      required this.isSuccess,
      required this.messageCode});

  Usermodel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
    isSuccess = json['isSuccess'];
    messageCode = json['messageCode'];
  }


}

class Result {
  late String id;
  late String name;
  late String statusId;
  late String birthdate;
  late String createdAt;
  late bool isDeleted;
  late String userName;
  late String phoneNumber;
  late Status status;
  List<Interests>? interests;

  Result({
    required this.id,
    required this.name,
    required this.statusId,
    required this.birthdate,
    required this.createdAt,
    required this.isDeleted,
    required this.userName,
    required this.phoneNumber,
    required this.status,
    required this.interests,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    statusId = json['statusId'] ?? "";
    birthdate = json['birthdate'] ?? "";
    createdAt = json['createdAt'] ?? "";
    isDeleted = json['isDeleted'] ?? "";
    userName = json['userName'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    status = (json['status'] != null ? Status.fromJson(json['status']) : null)!;
    if (json['interests'] != null) {
      interests = <Interests>[];
      json['interests'].forEach((v) {
        interests!.add(Interests.fromJson(v));
      });
    }
  }
}

class JinedRooms {}

class Status {
  late String id;
  late String nameArabic;
  late String nameEnglish;

  Status(
      {required this.id, required this.nameArabic, required this.nameEnglish});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    nameArabic = json['nameArabic'] ?? "";
    nameEnglish = json['nameEnglish'] ?? "";
  }
}

class Errors {
  late String fieldName;
  late String message;
  late String code;

  Errors({required this.fieldName, required this.message, required this.code});

  Errors.fromJson(Map<String, dynamic> json) {
    fieldName = json['fieldName'] ?? "";
    message = json['message'] ?? "";
    code = json['code'] ?? "";
  }
}

class Interests {
  late String id;
  late bool isDeleted;

  Interests({required this.id, required this.isDeleted});

  Interests.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    isDeleted = json['isDeleted'] ?? "";
  }
}
