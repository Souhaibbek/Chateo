class UserModel {
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  late String id;
  // late bool isVerify;
  late String image;

  UserModel({
    required this.firstName,
    required this.email,
    required this.phone,
    required this.id,
    required this.image,
    required this.lastName,
    // required this.isVerify,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    image = json['image'];
    email = json['email'];
    phone = json['phone'];
    // isVerify = json['isverify'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'phone': phone,
      'image': image,
      'lastName': lastName,
      // 'isverify': isVerify,
    };
  }
}
