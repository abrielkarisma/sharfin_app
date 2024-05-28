part of 'button_cubit.dart';

abstract class ButtonState extends Equatable {
  const ButtonState();

  @override
  List<Object> get props => [];
}

class ButtonInitial extends ButtonState {}

class ButtonLoading extends ButtonState {}

class ButtonLoaded extends ButtonState {
  final List<ButtonApi> buttons;

  ButtonLoaded(this.buttons);

  @override
  List<Object> get props => [buttons];
}

class ButtonError extends ButtonState {
  final String message;

  ButtonError(this.message);

  @override
  List<Object> get props => [message];
}
