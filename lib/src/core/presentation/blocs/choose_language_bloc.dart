import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_language_event.dart';
part 'choose_language_state.dart';

class ChooseLanguageBloc
    extends Bloc<ChooseLanguageEvent, ChooseLanguageState> {
  List<bool>? langList;

  ChooseLanguageBloc() : super(LanguageIconInitial());

  @override
  Stream<ChooseLanguageState> mapEventToState(
    ChooseLanguageEvent event,
  ) async* {
    if (event is BorderIconEvent) {
      langList = event.langList;
      yield BorderIconState(langList: langList!);
    }
  }
}
