import 'package:projeto_bloc_examplo/models/user_model.dart';
import 'package:projeto_bloc_examplo/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<(Exception?, UserModel?)> getAll() async {
    await Future.delayed(Duration(seconds: 2));
    final user = await UserModel(name: 'ACademia do Flutter');

    return (null, user);
  }
}
