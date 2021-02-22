import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String username;
  final String image;

  const User({
    @required this.name,
    @required this.username,
    @required this.image,
  });

  factory User.empty() => User(
        name: null,
        username: null,
        image: null,
      );
}
