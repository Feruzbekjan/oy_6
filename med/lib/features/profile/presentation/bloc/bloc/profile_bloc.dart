import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/core/usecase/usecase.dart';
import 'package:med/features/profile/data/datasource/datasource.dart';
import 'package:med/features/profile/data/repository/repositoryimpl.dart';
import 'package:med/features/profile/domain/entity/entity.dart';
import 'package:med/features/profile/domain/usecase/editingUseCase.dart';
import 'package:med/features/profile/domain/usecase/gettingUseCase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(
            status: MainStatus.pure,
            user: ProfileEntity(
              imgUrl: "",
              fish: "",
              qiziqishlar: "",
              hudud: "",
              boyUzunligi: 0,
              vazn: 0,
              tugulganKun: DateTime(2000, 01, 01),
              allergia: "",
            ),
            avatar: "")) {
    on<GetUsersData>((event, emit) async {
      emit(
        state.copyWith(
          status: MainStatus.loading,
        ),
      );
      final usecase = ProfileGettingUseCase(
        repository: ProfileRepositoryImpl(
          dataSource: ProfileDataSource(),
        ),
      );
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(state.copyWith(status: MainStatus.failure));
      }, (value) {
        emit(
          state.copyWith(
            status: MainStatus.success,
            user: value,
            avatar: value.imgUrl,
          ),
        );
      });
    });
    on<EditingUser>((event, emit) async {
      emit(state.copyWith(status: MainStatus.loading));
      final usecase = ProfileEditingUseCase(
          repository: ProfileRepositoryImpl(dataSource: ProfileDataSource()),
          user: event.user);
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(state.copyWith(status: MainStatus.failure));
      }, (value) {
        print("Malumotlar qo'shildi");
        emit(state.copyWith(status: MainStatus.success));
        event.success();
      });
    });
    on<EditImage>((event, emit) async {
      ImagePicker imagePicker = ImagePicker();
      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        emit(
          state.copyWith(
            avatar: File.fromUri(
              Uri.file(file.path),
            ).path,
          ),
        );
      }
    });
    on<EditingScreenDateChange>((event, emit) {
      emit(state.copyWith(avatar: event.user.imgUrl, user: event.user));
    });
  }
}
