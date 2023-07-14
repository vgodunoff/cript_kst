part of 'cript_list_bloc.dart';

@immutable
abstract class CriptListState extends Equatable {
  const CriptListState();
  @override
  List<Object> get props => [];
}

class CriptListInitial extends CriptListState {
  const CriptListInitial();

  @override
  List<Object> get props => [];
}

class Loading extends CriptListState {
  final bool isLoading;
  const Loading(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

class Loaded extends CriptListState {
  final List<TickerWithPrices> tickerWithPrices;
  const Loaded({required this.tickerWithPrices});

  @override
  List<Object> get props => [];
}

class ErrorState extends CriptListState {
  final String errorMessage;
  const ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
