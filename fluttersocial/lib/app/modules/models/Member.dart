import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/utils/constants.dart';

class Member {
  late String uid = "-1";
  late String name = " ";
  late String surname = " ";
  late String imageUrl = "";
  late List<dynamic> followers = [""];
  late List<dynamic> following = [" "];
  late DocumentReference ref;
  late String documentId = "";
  late String description = " ";

  Member(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    ref = doc.reference;
    uid = doc.id;
    Map<String, dynamic> datas = toMap(doc.data());
    name = datas[nameKey];
    surname = datas[surnameKey];
    imageUrl = datas[imageUrlKey];
    followers = datas[followersKey];
    following = datas[followingKey];
    description = datas[descriptionKey];
  }

  Map<String, dynamic> toMap(Object? data) {
    return {
      uidKey: uid,
      nameKey: name,
      surnameKey: surname,
      followingKey: following,
      followersKey: followers,
      imageUrlKey: imageUrl,
      descriptionKey: description
    };
  }
}
