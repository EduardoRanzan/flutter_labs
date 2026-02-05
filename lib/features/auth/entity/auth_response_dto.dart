class AuthResponseDto {
  final String id;
  final String name;
  final String access_token;

  AuthResponseDto({
    required this.id,
    required this.name,
    required this.access_token,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      AuthResponseDto(
          id: json['id'],
          name: json['nome'],
          access_token: json['access_token']
      );
}