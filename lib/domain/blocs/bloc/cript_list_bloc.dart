import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cript_list_event.dart';
part 'cript_list_state.dart';

class CriptListBloc extends Bloc<CriptListEvent, CriptListState> {
  CriptListBloc() : super(CriptListInitial()) {
    on<CriptListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
