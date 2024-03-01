import 'package:bloc/bloc.dart';
import 'package:flutter_google_books/domain/services/i_auth_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

part 'sign_up_cubit.freezed.dart';

@Injectable()
class SignUpCubit extends Cubit<SignUpState> {
  final IAuthService _authService;

  SignUpCubit(this._authService) : super(const SignUpState.initial());

  void signUp(
    String email,
    String password,
  ) async {
    emit(const SignUpState.loading());

    try {
      await _authService.signUp(email, password);
      emit(const SignUpState.success());
    } catch (e) {
      emit(SignUpState.failure(e.toString()));
    }
  }
}
