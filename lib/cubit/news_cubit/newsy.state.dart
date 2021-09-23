abstract class NewsState {}

class InitialState extends NewsState {}

class LoadingState extends NewsState {}

class SuccessState extends NewsState {}

class ErrorState extends NewsState {
  final String e;
  ErrorState(this.e);
}

class NavBarChangeState extends NewsState {}

class BuinessLoadingState extends NewsState {}

class BuinessSuccessState extends NewsState {}

class BuinessErrorState extends NewsState {
  final String e;
  BuinessErrorState(this.e);
}

class SportsLoadingState extends NewsState {}

class SportsSuccessState extends NewsState {}

class SportsErrorState extends NewsState {
  final String e;
  SportsErrorState(this.e);
}

class HealthSuccessState extends NewsState {}

class HealthLoadingState extends NewsState {}

class HealthErrorState extends NewsState {
  final String e;
  HealthErrorState(this.e);
}
