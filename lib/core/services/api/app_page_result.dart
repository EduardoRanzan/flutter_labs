class AppPageResult<T> {
  final List<T> data;
  final int? total;

  AppPageResult({
    required this.data,
    this.total,
  });
}
