abstract class AppBaseApi<T> {
  Future findAll();
  Future findById(String id);
  Future<void> create(T body);
  Future update(String id, T body);
  Future remove(String id);
}