import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sharfin_app/data/api_service.dart';
import 'package:sharfin_app/data/models/Button.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit(
    this.apiService
  ) : super(ButtonInitial());

  final ApiService apiService;

  void getAllButton() async {
    emit(ButtonLoading());
    final result = await apiService.getAllButtons();
    result.fold(
      (l) => emit(ButtonError(message: l)), 
      (r) => emit(ButtonLoaded(listSurah: r)),
    );
  }
}

