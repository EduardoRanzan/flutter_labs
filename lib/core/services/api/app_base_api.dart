import 'package:dio/dio.dart';

abstract class AppBaseApi {
  Future findAll(String path);
  Future findById(String path, String id);
  Future create(String path, dynamic body);
  Future update(String path, dynamic body);
  Future remove(String path, dynamic body);
}