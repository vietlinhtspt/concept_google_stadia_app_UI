import 'package:stadia_app/constants/image_assert.dart';

class LastPlayedGame {
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  const LastPlayedGame(
      {this.name, this.hoursPlayed, this.imagePath, this.gameProgress});
}

final lastPlayedGames = [
  LastPlayedGame(
      name: "Assassin's Creed Odyssey",
      hoursPlayed: 10,
      gameProgress: 0.20,
      imagePath: game_assassin),
  LastPlayedGame(
      name: "Dead Cells",
      hoursPlayed: 50,
      gameProgress: 0.80,
      imagePath: game_dead_cells),
  LastPlayedGame(
      name: "Stardew Valley",
      hoursPlayed: 90,
      gameProgress: 0.95,
      imagePath: game_stardew),
  LastPlayedGame(
      name: "No Man's Sky",
      hoursPlayed: 3,
      gameProgress: 0.10,
      imagePath: game_no_mans_sky),
];

class GameDetail {
  final String name;
  final String company;
  final String videoIntro;
  final String imagePath;
  final double rating;
  final int downloadedNumber;
  final int reviewdNumber;
  final String description;
  final int price;
  final bool isPurchased;

  GameDetail(
      {this.name,
      this.company,
      this.videoIntro,
      this.imagePath,
      this.rating,
      this.downloadedNumber,
      this.reviewdNumber,
      this.description,
      this.price,
      this.isPurchased});
}

final List<GameDetail> popularGames = [
  GameDetail(
    name: "FIFA 19 Unlimited Team",
    company: "EA Sports",
    imagePath: game_fifa,
    videoIntro: "zX0AV6yxyrQ",
    rating: 4.5,
    downloadedNumber: 10000000,
    reviewdNumber: 8000000,
    description:
        "FIFA Ultimate Team™ is the most popular mode in the game, in which you build your dream squad from scratch using collectible player items. With thousands of players available in Ultimate Team, there are a seemingly endless number of ways in which you can craft your squad to your liking.",
    price: 59,
    isPurchased: false,
  ),
  GameDetail(
    name: "A JEDI ON THE RUN",
    company: "EA Sports",
    videoIntro: "0GLbwkfhYZk",
    imagePath: game_starwar,
    rating: 4.5,
    downloadedNumber: 10000000,
    reviewdNumber: 8000000,
    description:
        "After narrowly escaping the Jedi purge, you’re on a quest to rebuild your fallen Order. Pick up the pieces of your shattered past and complete your Jedi training, all while staying one step ahead of the Empire and its deadly Inquisitors.",
    price: 59,
    isPurchased: false,
  ),
  GameDetail(
    name: "FORTNITE",
    company: "Epic Games",
    imagePath: game_fortnite,
    videoIntro: "NycdXYBeG4",
    rating: 4.5,
    downloadedNumber: 10000000,
    reviewdNumber: 8000000,
    description:
        "Fortnite is a free-to-play Battle Royale game with numerous game modes for every type of game player. Watch a concert, build an island or fight.",
    price: 19,
    isPurchased: true,
  ),
  GameDetail(
    name: "APEX LEGENDS",
    company: "EA Sports",
    imagePath: game_apex,
    videoIntro: "oshvcDjEKZc",
    rating: 4.5,
    downloadedNumber: 10000000,
    reviewdNumber: 8000000,
    description:
        "Apex Legends is a free-to-play hero shooter game where legendary competitors battle for glory, fame, and fortune on the fringes of the Frontier.",
    price: 59,
    isPurchased: false,
  ),
  GameDetail(
    name: "PUBG",
    company: "VL games",
    imagePath: game_pubg,
    videoIntro: "uCd6tbUAy6o",
    rating: 4.5,
    downloadedNumber: 10000000,
    reviewdNumber: 8000000,
    description:
        "Gameloop is a PC emulator that allows you to play your favorite mobile games on pc. Want to enjoy PUBG on a bigger screen? Play it on PC with gameloop.",
    price: 59,
    isPurchased: false,
  ),
];
