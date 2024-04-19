part of 'surat_cubit.dart';


sealed class SuratState extends Equatable {
  const SuratState();

  @override
  List<Object> get props => [];
}

final class SuratInitial extends SuratState {}

class SuratLoading extends SuratState{}

class SuratLoaded extends SuratState{
  final List<Surah> listSurah;
  const SuratLoaded({
    required this.listSurah,
  });
  @override 

List<Object> get props => (listSurah);
}

class SuratError extends SuratState {
  final String message;
  const SuratError({
    required this.message,
  });

  @override 
  List<Object> get props => [message];
}
