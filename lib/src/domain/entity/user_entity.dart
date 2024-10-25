class UserEntity {
  const UserEntity({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.lastname,
    required this.photo,
  });
  final String id;
  final String email;
  final String phone;
  final String name;
  final String lastname;
  final String photo;

  static const UserEntity empty = UserEntity(
    id: '',
    email: '',
    phone: '',
    name: '',
    lastname: '',
    photo: '',
  );
}
