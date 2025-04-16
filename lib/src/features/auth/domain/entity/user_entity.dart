class UserEntity {
  const UserEntity({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.lastname,
    required this.photo,
    required this.credits,
    required this.isVerified,
  });
  final String id;
  final String email;
  final String phone;
  final String name;
  final String lastname;
  final String photo;
  final int credits;
  final bool isVerified;

  static const UserEntity empty = UserEntity(
    id: '',
    email: '',
    phone: '',
    name: '',
    lastname: '',
    photo: '',
    credits: 0,
    isVerified: false,
  );
}
