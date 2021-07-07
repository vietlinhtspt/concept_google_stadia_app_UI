import 'package:stadia_app/constants/image_assert.dart';

class Friend {
  final String name;
  final String imagePath;
  final bool isOnline;
  final bool isPlaying;

  const Friend({this.name, this.imagePath, this.isOnline, this.isPlaying});
}

final friends = [
  Friend(
      name: "Jennie",
      imagePath: friend_jeenie,
      isOnline: true,
      isPlaying: true),
  Friend(
      name: "Gena", imagePath: friend_gena, isOnline: true, isPlaying: false),
  Friend(name: "Michelle", imagePath: friend_michelle, isOnline: false),
  Friend(name: "Trish", imagePath: friend_trish, isOnline: false),
];
