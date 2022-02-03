part of 'choose_language_bloc.dart';

abstract class ChooseLanguageEvent extends Equatable {
  const ChooseLanguageEvent();

  @override
  List<Object> get props => [];
}

class BorderIconEvent extends ChooseLanguageEvent {
  BorderIconEvent({required this.langList});
  List<bool> langList;

  @override
  List<Object> get props => [langList];
}
