part of 'home_bloc.dart';

abstract class HomeEvent {}

class PlacesEvent extends HomeEvent {
  final bool isPaging;
  final String? region;

  PlacesEvent(this.region, {required this.isPaging});
}

class RegionsEvent extends HomeEvent {
  final String search;

  RegionsEvent({required this.search});
}

class TechnologyEvent extends HomeEvent {
  TechnologyEvent();
}

class DefinitionsEvent extends HomeEvent {
  DefinitionsEvent();
}

class BillingsEvent extends HomeEvent {
  BillingsEvent();
}

class PlaceDetailsEvent extends HomeEvent {
  final String id;

  PlaceDetailsEvent({required this.id});
}
