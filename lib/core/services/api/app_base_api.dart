abstract class AppBaseApi {
  Future findAll();
  Future findById(String id);
  Future create(dynamic body);
  Future update(dynamic body);
  Future remove(dynamic body);
}