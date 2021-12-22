import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'first_screen_ui_event.dart';
part 'first_screen_ui_state.dart';

class FirstScreenUIBloc extends Bloc<FirstScreenUIEvent, FirstScreenUIState> {
  List<bool>? langList;

  FirstScreenUIBloc() : super(LanguageIconInitial());

  @override
  Stream<FirstScreenUIState> mapEventToState(
    FirstScreenUIEvent event,
  ) async* {
    if (event is BorderIconEvent) {
      langList = event.langList;
      yield BorderIconState(langList: langList!);
    }
  }
}
