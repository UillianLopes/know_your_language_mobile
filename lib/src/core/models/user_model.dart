class UserModel {
  final int id;
  final String name;
  final String email;
  final String? picture;
  final String? provider;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
    this.provider,
  });
}
