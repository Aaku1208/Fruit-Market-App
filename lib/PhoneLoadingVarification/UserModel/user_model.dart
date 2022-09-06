class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? addrerss;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.addrerss,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      addrerss: map['addrerss'],
    );
  }

  // sending data sever
  Map<String,dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'addrerss': addrerss,
    };
  }
}