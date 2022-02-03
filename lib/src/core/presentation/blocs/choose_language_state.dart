part of 'choose_language_bloc.dart';

abstract class ChooseLanguageState extends Equatable {
  const ChooseLanguageState();

  @override
  List<Object> get props => [];
}

class LanguageIconInitial extends ChooseLanguageState {}

class BorderIconState extends ChooseLanguageState {
  final List<bool> langList;
  const BorderIconState({
    required this.langList,
  });

  @override
  List<Object> get props => [langList];
}
