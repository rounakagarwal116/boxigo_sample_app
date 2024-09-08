import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../model/sample_data.dart';
import '../repository/repository.dart';

// Events
abstract class SampleDataEvent {
  @override
  List<Object> get props => [];
}

class FetchSampleDataEvent extends SampleDataEvent {}

// States
abstract class SampleDataState {
  @override
  List<Object> get props => [];
}

class SampleDataInitialState extends SampleDataState {}

class SampleDataLoadedState extends SampleDataState {
  final SampleData sampleData;

  SampleDataLoadedState({required this.sampleData});

  @override
  List<Object> get props => [sampleData];
}

// Bloc
class SampleDataBloc extends Bloc<SampleDataEvent, SampleDataState> {
  final Repository repository;
  late SampleData sampleData;
  SampleDataBloc(this.repository) : super(SampleDataInitialState()) {
    on<FetchSampleDataEvent>((event, emit) async {
      sampleData = await repository.fetchSampleData();
      emit(SampleDataLoadedState(sampleData: sampleData));
    });
  }
}
