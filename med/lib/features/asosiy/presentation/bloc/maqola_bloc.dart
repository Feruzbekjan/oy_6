import 'package:bloc/bloc.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/features/asosiy/data/data_source/data_source.dart';
import 'package:med/features/asosiy/data/repository/repo_impl.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';
import 'package:flutter/foundation.dart';
import 'package:med/features/asosiy/domain/usecase/update.dart';
import 'package:med/features/asosiy/domain/usecase/usecase.dart';

part 'maqola_event.dart';
part 'maqola_state.dart';

class MaqolaBloc extends Bloc<MaqolaEvent, MaqolaState> {
  MaqolaBloc()
      : super(
          MaqolaState(
            isSearching: false,
            data: [],
            statusMaqola: StatusMaqola.pure,
          ),
        ) {
    on<MaqolaBlocStarted>((event, emit) async {
      emit(
        state.copyWith(
          statusMaqola: StatusMaqola.loading,
        ),
      );
      final usecase = MaqolaUseCase(
        maqolaRepository: MaqolaRepositoryImpl(
          dataSource: MaqolaDataSource(),
        ),
      );
      final either = await usecase.call(
        GetDataParam(),
      );
      either.either(
        (failure) {
          emit(
            state.copyWith(
              statusMaqola: StatusMaqola.failure,
            ),
          );
        },
        (value) {
          emit(
            state.copyWith(
              data: value,
              statusMaqola: StatusMaqola.succsess,
            ),
          );
        },
      );
    });
    on<SavedEvent>((event, emit) async {
      final usecase = UpdateUsecase(
        maqolaRepository: MaqolaRepositoryImpl(
          dataSource: MaqolaDataSource(),
        ),
      );
      final either = await usecase.call(
        UpdateParam(
          id: event.id,
          entities: event.entities,
        ),
      );
      either.either(
        (failure) {

        },
        (value) { 
          add(MaqolaBlocStarted());
        },
      );
    });
    on<Searching>((event, emit) { 
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false,));
      } else {
        final newList = state.data
            .where((element) => element.title.contains(event.query))
            .toList();
        final newList2 = state.data
            .where((element) => element.description.contains(event.query))
            .toList();  
          final list3 = [...newList2, ...newList].toSet();  
        emit(state.copyWith(data: [...list3], isSearching: true));
      }
    });
  }
}
