part of 'button_cubit.dart';


sealed class ButtonState extends Equatable {
  const ButtonState();

  @override
  List<Object> get props => [];
}

final class ButtonInitial extends ButtonState {}

class ButtonLoading extends ButtonState{}

class ButtonLoaded extends ButtonState{
  final List<ButtonApi> listSurah;
  const ButtonLoaded({
    required this.listSurah,
  });
  @override 

List<Object> get props => (listSurah);
}

class ButtonError extends ButtonState {
  final String message;
  const ButtonError({
    required this.message,
  });

  @override 
  List<Object> get props => [message];
}
