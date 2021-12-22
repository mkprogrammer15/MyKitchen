part of 'first_screen_ui_bloc.dart';

abstract class FirstScreenUIEvent extends Equatable {
  const FirstScreenUIEvent();

  @override
  List<Object> get props => [];
}

class BorderIconEvent extends FirstScreenUIEvent {
  BorderIconEvent({required this.langList});
  List<bool> langList;

  @override
  List<Object> get props => [langList];
}
