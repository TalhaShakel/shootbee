class UserModel {
  String firstName;
  String nickName;
  DateTime dateOfBirth;
  String phoneNumber;
  String gender;
  String location;
  String profilePicture;

  UserModel({
    required this.firstName,
    required this.nickName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.gender,
    required this.location,
    required this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'] as String,
      nickName: json['nickName'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
      location: json['location'] as String,
      profilePicture: json['profilePicture'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'nickName': nickName,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'phoneNumber': phoneNumber,
        'gender': gender,
        'location': location,
        'profilePicture': profilePicture,
      };
}
