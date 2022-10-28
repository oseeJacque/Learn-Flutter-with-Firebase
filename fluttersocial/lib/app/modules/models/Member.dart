import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/utils/constants.dart';

class Member {
  final String uid;
  final String name;
  final String surname;
  final String imageUrl;
  final List<dynamic> followers;
  final List<dynamic> following;
  //final DocumentReference ref;
  final String documentId;
  final String description;

  Member(DocumentSnapshot snapshot,
      {this.uid="-1",
      this.name="",
      this.surname="",
      this.imageUrl="",
      this.followers=const [""],
      this.following=const [],
      //this.ref=,
      this.documentId="",
      this.description=""
      }) {
    print(snapshot);
    // ref = snapshot.reference;
    // uid = snapshot.id;
    // Map<String, dynamic> datas = snapshot.data();
    // name = datas[nameKey];
    // surname = datas[surnameKey];
    // imageUrl = datas[imageUrlKey];
    // followers = datas[followersKey];
    // following = datas[followingKey];
    // description = datas[descriptionKey];
  }

  Map<String, dynamic> toMap() {
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
