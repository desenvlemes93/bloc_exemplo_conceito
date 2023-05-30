import 'package:projeto_bloc_examplo/models/user_model.dart';

abstract interface class UserRepository {
  Future<(Exception?, UserModel?)> getAll();
  
}
