part of 'disease_bloc.dart';

abstract class DiseaseEvent {}

class DiseasesEvent extends DiseaseEvent {
  final bool isPaging;
  final String search;

  DiseasesEvent({required this.isPaging, required this.search});
}

class GetDiseaseEvent extends DiseaseEvent {
  final String id;

  GetDiseaseEvent({required this.id});
}
