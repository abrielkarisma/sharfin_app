part of 'button_cubit.dart';

<<<<<<< Updated upstream

sealed class ButtonState extends Equatable {
=======
abstract class ButtonState extends Equatable {
>>>>>>> Stashed changes
  const ButtonState();

  @override
  List<Object> get props => [];
}

<<<<<<< Updated upstream
final class ButtonInitial extends ButtonState {}

class ButtonLoading extends ButtonState{}

class ButtonLoaded extends ButtonState{
  final List<ButtonApi> listSurah;
  const ButtonLoaded({
    required this.listSurah,
  });
  @override 

List<Object> get props => (listSurah);
=======
class ButtonInitial extends ButtonState {}

class ButtonLoading extends ButtonState {}

class ButtonLoaded extends ButtonState {
  final List<ButtonApi> buttons;

  const ButtonLoaded(this.buttons);

  @override
  List<Object> get props => [buttons];
>>>>>>> Stashed changes
}

class ButtonError extends ButtonState {
  final String message;
<<<<<<< Updated upstream
  const ButtonError({
    required this.message,
  });

  @override 
  List<Object> get props => [message];
}
=======

  const ButtonError(this.message);

  @override
  List<Object> get props => [message];
}
>>>>>>> Stashed changes
