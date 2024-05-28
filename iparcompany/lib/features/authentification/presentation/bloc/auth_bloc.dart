// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:iparcompany/core/injector/injector.dart';
import 'package:iparcompany/core/status/status.dart';
import 'package:iparcompany/core/usecase/usecase.dart';
import 'package:iparcompany/features/authentification/domain/usecase/logout_usecase.dart';
import 'package:iparcompany/features/authentification/domain/usecase/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          const AuthState(
            isObscure: false,
            status: AuthStatus.pure,
          ),
        ) {
    on<GetUserEvent>(
      (event, emit) async {
        final usecase = sl<AuthUseCase>();
        final either = await usecase.call(
          GetUserParam(),
        );
        either.either(
          (failure) {
            emit(
              state.copyWith(
                status: AuthStatus.unAuth,
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                status: AuthStatus.authen,
                user: value,
              ),
            );
          },
        );
      },
    );
    on<LoginEvent>(
      (event, emit) async {
        final usecase = sl<AuthUseCase>();
        final either = await usecase.call(
          LoginParam(
            email: event.email,
            parol: event.parol,
          ),
        );
        either.either(
          (failure) {
            event.failure();
          },
          (value) {
            emit(
              state.copyWith(
                status: AuthStatus.authen,
                user: value,
              ),
            );
            event.succsess();
          },
        );
      },
    );
    on<SignUpEvent>(
      (event, emit) async {
        final usecase = sl<AuthUseCase>();
        final either = await usecase.call(
          SignUpParam(
            email: event.email,
            parol: event.parol,
          ),
        );
        either.either(
          (failure) {
            event.failure();
          },
          (value) {
            emit(
              state.copyWith(
                status: AuthStatus.authen,
                user: value,
              ),
            );
            event.succsess();
          },
        );
      },
    );
    on<LogOutEvent>(
      (event, emit) async {
        final usecase = sl<LogOutUseCase>();
        final either = await usecase.call(NoParams());
        either.either(
          (failure) {
            event.failure();
          },
          (value) {
            emit(
              state.copyWith(
                status: AuthStatus.unAuth,
              ),
            );
            event.succsess();
          },
        );
      },
    );
    on<GoogleSignInEvent>(
      (event, emit) async {
        final usecase = sl<AuthUseCase>();
        final either = await usecase.call(
          GoogleSignInParam(),
        );
        either.either(
          (failure) {
            emit(
              state.copyWith(
                status: AuthStatus.unAuth,
              ),
            );
            event.failure();
          },
          (value) {
            emit(
              state.copyWith(
                status: AuthStatus.authen,
                user: value,
              ),
            );
            event.succsess();
          },
        );
      },
    );
    on<IsObscureTextEvent>((event, emit) {
      final obscure = state.isObscure;
      emit(
        state.copyWith(
          isObscure: !obscure,
        ),
      );
    });

    ///
    ///
    ///
    ///
  }
}
