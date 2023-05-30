sealed class HomeCubitState {}

class HomeStateIntial extends HomeCubitState {
  final String name;
  HomeStateIntial({
    required this.name,
  });
}

class HomeStateLoading extends HomeCubitState {}

class HomeStateSucess extends HomeCubitState {
  final String name;
  HomeStateSucess(this.name);
}

class HomeStateError extends HomeCubitState {}
