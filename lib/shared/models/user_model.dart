class UserModel {
  final String name;
  final int score;
  final String photoUrl;

  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });
}
