class AuthRequestDto {
  final String username;
  final String password;

  AuthRequestDto({
      required this.username,
      required this.password,
  });

  factory AuthRequestDto.fromJson(Map<String, dynamic> json) =>
      AuthRequestDto(
          username: json['username'],
          password: json['password']
      );

  Map<String, dynamic> toJson() => {
      'username': username,
      'password': password,
  };
}