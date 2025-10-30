class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? profileImage;
  final String? geoLocation;
  final String? token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.profileImage,
    this.geoLocation,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    profileImage: json['profileImage'],
    geoLocation: json['geoLocation'],
    token: json['token'],
  );
}
