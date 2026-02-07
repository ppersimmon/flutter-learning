class UserProfile {
  final int id;
  final String profileName;
  final String userName;
  final int followers;
  final int following;
  final String? image;
  final String joinDate;
  final String? bornDate;

  const UserProfile({
    required this.id,
    required this.profileName,
    required this.userName,
    this.followers = 0,
    this.following = 0,
    this.image,
    required this.joinDate,
    this.bornDate,
  });
}
