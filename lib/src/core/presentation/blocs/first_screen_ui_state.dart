part of 'first_screen_ui_bloc.dart';

abstract class FirstScreenUIState extends Equatable {
  const FirstScreenUIState();

  @override
  List<Object> get props => [];
}

class LanguageIconInitial extends FirstScreenUIState {}

class BorderIconState extends FirstScreenUIState {
  List<bool> langList;
  BorderIconState({
    required this.langList,
  });

  @override
  List<Object> get props => [langList];
}
