import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/authetification/data/data_source/data_source.dart';
import 'package:med/features/authetification/data/repository/repository.dart';
import 'package:med/features/authetification/domain/entities/entities.dart';
import 'package:med/features/authetification/domain/usecase/logout.dart';
import 'package:med/features/authetification/domain/usecase/usecase.dart';

import '../../../../core/auth_status/status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          AuthState(
            status: Status.pure,
            user: AuthEntities(
              email: "",
              avatar: "",
            ),
          ),
        ) {
    on<GetUserEvent>(
      (event, emit) async {
        final usecase = AuthUseCase(
          repository: AuthRepositoryImpl(
            dataSourse: AuthDataSourse(),
          ),
        );
        final either = await usecase.call(
          GetUserStatus(),
        );
        either.either(
          (failure) {
            emit(
              state.copyWith(
                status: Status.unAuthen,
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                status: Status.authen,
                user: value,
              ),
            );
          },
        );
      },
    );
    on<SignUpEvent>((event, emit) async {
      final usecase = AuthUseCase(
        repository: AuthRepositoryImpl(
          dataSourse: AuthDataSourse(),
        ),
      );
      final either = await usecase.call(
        SignUp(
          email: event.email,
          password: event.parol,
        ),
      );
      either.either(
        (failure) {
          event.failure();
        },
        (value) {
          emit(
            state.copyWith(
              user: value,
              status: Status.authen,
            ),
          );

          event.succsess();
        },
      );
    });
    on<LoginEvent>(
      (event, emit) async {
        final usecase = AuthUseCase(
          repository: AuthRepositoryImpl(
            dataSourse: AuthDataSourse(),
          ),
        );
        final either = await usecase.call(
          LoginParams(
            email: event.email,
            password: event.parol,
          ),
        );
        either.either(
          (failure) {
            event.failure();
          },
          (value) {
            event.succsess();
          },
        );
      },
    );
    on<LogOutEvent>(
      (event, emit) async {
        final usecase = LogoutUseCase(
          repository: AuthRepositoryImpl(
            dataSourse: AuthDataSourse(),
          ),
        );
        final either = await usecase.call(
          NoParams(),
        );
        either.either(
          (failure) {},
          (succsess) {
            emit(
              state.copyWith(
                status: Status.unAuthen,
              ),
            );
          },
        );
      },
    );
  }
}
