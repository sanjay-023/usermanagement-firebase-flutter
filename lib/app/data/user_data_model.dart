class UserDataModel {
  String? dataid;
  String? name;
  String? contact;

  UserDataModel();

  UserDataModel.fromSnapshot(snapshot)
      : dataid = snapshot.data()['dataid'],
        name = snapshot.data()['name'],
        contact = snapshot.data()['contact'];

  // factory UserDataModel.fromMap(map) {
  //   return UserDataModel(
  //       dataid: map['dataid'], name: map["name"], contact: map["contact"]);
  // }

  // sending data to firestore
  Map<String, dynamic> toMap() {
    return {
      'dataid': dataid,
      'name': name,
      'contact': contact,
    };
  }
}
