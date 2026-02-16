abstract class AppBaseApi<T> {
  Future findAll();
  Future findById(String id);
  Future<void> create(T body);
  Future update(dynamic body);
  Future remove(dynamic body);
}