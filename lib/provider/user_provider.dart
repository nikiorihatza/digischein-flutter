import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

// Import the User model if it's in a separate file
// import 'user_model.dart';

class UserProvider with ChangeNotifier {
  User _user = User(id: 5, firstname: 'Vinzent', lastname: 'Dorner', email: 'v.dorner@gmail.com', profilePictureUrl: 'https://i.ibb.co/2YR9CSd/H.png'); // The User object to hold user data

  // Getter to access the current user
  User get user => _user;

  // Setter to update the user and notify listeners
  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  // Initialization method to set the initial user data
  void initializeUser(int id, String firstname, String lastname, String email, String profilePictureUrl) {
    _user = User(id: id, firstname: firstname, lastname: lastname, email: email, profilePictureUrl: profilePictureUrl);
    notifyListeners();
  }

  // Example method to update the user's name
  void updateUserName(String newFirstname, String newLastname) {
    if (_user != null) {
      _user.firstname = newFirstname;
      _user.lastname = newLastname;
      notifyListeners();
    }
  }

  void clearUserData() {
    _user = User(id: 0, firstname: '', lastname: '', email: '', profilePictureUrl: '');
    notifyListeners();
  }
}
