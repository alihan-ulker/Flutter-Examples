import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_event.dart';
import 'package:flutter_bloc_example_3/blocs/auth/login/login_state.dart';
import 'package:flutter_bloc_example_3/repository/auth/login/login_repository.dart';
import 'package:flutter_bloc_example_3/views/auth/form_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;

  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        await mapEventToState(event, emit);
      },
    );
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUsernameChanged) {
      emit(state.copyWrite(username: event.username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWrite(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWrite(formStatus: FormSubmitting()));

      try {
        await authRepo?.login();
        emit(state.copyWrite(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWrite(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
