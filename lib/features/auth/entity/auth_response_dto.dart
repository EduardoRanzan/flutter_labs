class AuthResponseDto {
  final String first_name;
  final String last_name;
  final String token;

  AuthResponseDto({
    required this.first_name,
    required this.last_name,
    required this.token,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      AuthResponseDto(
          first_name: json['first_name'],
          last_name: json['last_name'],
          token: json['token']
      );
}