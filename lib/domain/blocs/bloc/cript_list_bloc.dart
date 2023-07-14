import 'package:bloc/bloc.dart';
import 'package:cript_kst/domain/data/api_client.dart';
import 'package:cript_kst/domain/data/repository.dart';
import 'package:cript_kst/domain/entities/ticker_with_prices.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cript_list_event.dart';
part 'cript_list_state.dart';

class CriptListBloc extends Bloc<CriptListEvent, CriptListState> {
  final repo = Repository();
  CriptListBloc() : super(const CriptListInitial()) {
    on<FetchData>((event, emit) async {
      print('FetchData');
      emit(const Loading(true));
      try {
        print('try');
        await repo.asyncInit();
        await repo.addTickerWithPrices();
        emit(const Loading(false));
        emit(Loaded(tickerWithPrices: repo.gettickerWithPrices));
        print(repo.gettickerWithPrices);
      } on ApiClientExeption catch (e) {
        switch (e.type) {
          case ApiClientExeptionType.network:
            emit(const Loading(false));
            emit(const ErrorState(
                errorMessage:
                    'Сервер не доступен. Проверьте подключение к интернету'));
            break;
          case ApiClientExeptionType.request:
            emit(const Loading(false));
            emit(const ErrorState(errorMessage: 'Неправильное имя покемона'));
            break;
          case ApiClientExeptionType.other:
            emit(const Loading(false));
            emit(const ErrorState(
                errorMessage: 'Произошла ошибка. Попробуйте еще раз'));
            break;
        }
      }
    });
  }
}
