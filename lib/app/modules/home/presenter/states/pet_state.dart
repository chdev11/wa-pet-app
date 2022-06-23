abstract class IPetState {}

class PetReady extends IPetState {}

class PetLoading extends IPetState {}

class PetSuccess extends IPetState {}

class PetError extends IPetState {
  final String message;

  PetError(this.message);
}
