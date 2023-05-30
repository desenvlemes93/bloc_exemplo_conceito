import 'package:bloc/bloc.dart';
import 'package:projeto_bloc_examplo/pages/cubit/controller/home_cubit_state.dart';
import 'package:projeto_bloc_examplo/repository/user_repository.dart';
import 'package:projeto_bloc_examplo/repository/user_repository_impl.dart';

class HomeCubitController extends Cubit<HomeCubitState> {
  HomeCubitController()
      : super(
          HomeStateIntial(name: 'Iniciando a Tela'),
        );

  Future<void> alterarDados() async {
    final UserRepository userRepository = UserRepositoryImpl();
    emit(HomeStateLoading());
    await Future.delayed(const Duration(seconds: 5));
    final (exception, us) = await userRepository.getAll();

    if (us != null) {
      emit(HomeStateSucess(us.name));
    }

    switch (exception) {}

    // emit(HomeStateSucess('Ricardo'));
  }
}
