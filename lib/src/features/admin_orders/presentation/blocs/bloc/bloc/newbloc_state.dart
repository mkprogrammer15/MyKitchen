part of 'newbloc_bloc.dart';

abstract class NewblocState extends Equatable {
  const NewblocState();
  
  @override
  List<Object> get props => [];
}

class NewblocInitial extends NewblocState {}
