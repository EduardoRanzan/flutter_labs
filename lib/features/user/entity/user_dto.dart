class UserDto {
  final String id;
  final String email;
  final String role;

  UserDto({
    required this.id,
    required this.email,
    required this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      role: json['role'],
    );
  }
}