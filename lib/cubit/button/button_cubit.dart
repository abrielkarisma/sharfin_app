import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/data/models/button.dart'; // Ensure consistent import

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  final ApiService apiService;

  ButtonCubit(this.apiService) : super(ButtonInitial());

  Future<void> fetchButtons() async {
    try {
      emit(ButtonLoading());
      final buttons = await apiService.fetchButtons();
      emit(ButtonLoaded(buttons));
    } catch (e) {
      emit(ButtonError('Failed to load buttons: $e'));
    }
  }
}
