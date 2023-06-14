import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_3/blocs/auth/register/register_event.dart';
import 'package:flutter_bloc_example_3/blocs/auth/register/regiter_state.dart';
import 'package:flutter_bloc_example_3/blocs/bloc_status.dart';
import 'package:flutter_bloc_example_3/repository/auth/register/register_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository? authRepo;

  RegisterBloc({this.authRepo}) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    // Email updated
    if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));

      // Password updated
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(appStatus: FormSubmitting()));

      try {
        await authRepo?.register();
        emit(state.copyWith(appStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }
}
