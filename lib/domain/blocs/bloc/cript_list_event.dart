part of 'cript_list_bloc.dart';

@immutable
abstract class CriptListEvent extends Equatable {
  const CriptListEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends CriptListEvent {
  const FetchData();

  @override
  List<Object> get props => [];
}
