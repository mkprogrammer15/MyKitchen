import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'newbloc_event.dart';
part 'newbloc_state.dart';

class NewblocBloc extends Bloc<NewblocEvent, NewblocState> {
  NewblocBloc() : super(NewblocInitial());

  @override
  Stream<NewblocState> mapEventToState(
    NewblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
