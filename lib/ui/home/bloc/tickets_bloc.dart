import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  TicketsBloc() : super(TicketsInitial()) {
    on<TicketsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
