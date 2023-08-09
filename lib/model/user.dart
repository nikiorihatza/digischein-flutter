import 'dart:convert';

class User {
  int id;
  String firstname;
  String lastname;
  String email;
  String profilePictureUrl;

  User({required this.id, required this.firstname, required this.lastname, required this.email, required this.profilePictureUrl});

  // Factory method to create a user object from a map (JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],

    );
  }

  // Convert user object to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'profilePictureUrl': profilePictureUrl
    };
  }

  User userFromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return User.fromJson(jsonData);
  }

  String userToJson(User user) {
    final jsonData = user.toJson();
    return json.encode(jsonData);
  }

  User? clear() {
    return null;
  }
}
