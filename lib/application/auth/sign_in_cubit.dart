import 'package:bloc/bloc.dart';
import 'package:flutter_google_books/domain/services/i_auth_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';

part 'sign_in_cubit.freezed.dart';

@Injectable()
class SignInCubit extends Cubit<SignInState> {
  final IAuthService _authService;

  SignInCubit(this._authService) : super(const SignInState.initial());

  void signIn(
    String email,
    String password,
  ) async {
    emit(const SignInState.loading());

    try {
      await _authService.signIn(email, password);
      emit(const SignInState.success());
    } catch (e) {
      emit(SignInState.failure(e.toString()));
    }
  }
}
