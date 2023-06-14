import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/home/home_event.dart';
import 'package:flutter_bloc_example_3/blocs/home/home_state.dart';
import 'package:flutter_bloc_example_3/repository/home/home_repository.dart';
import 'package:flutter_bloc_example_3/views/auth/form_submission_status.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository? homeRepo;

  HomeBloc({this.homeRepo}) : super(const HomeState()) {
    on<HomeEvent>(
      (event, emit) async {
        await mapEventToState(event, emit);
      },
    );
  }

  Future mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is HomeUsernameChanged) {
      emit(state.copyWrite(username: event.username));
    } else if (event is HomePasswordChanged) {
      emit(state.copyWrite(password: event.password));
    } else if (event is HomeSubmitted) {
      emit(state.copyWrite(formStatus: FormSubmitting()));

      try {
        await homeRepo?.getHomeCard();
        emit(state.copyWrite(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWrite(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
