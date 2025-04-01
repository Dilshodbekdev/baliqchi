class FishDeclineStatisticBody {
  int year;
  String fishTypeId;

  FishDeclineStatisticBody({required this.year, required this.fishTypeId});

  FishDeclineStatisticBody copyWith({int? year, String? fishTypeId}) {
    return FishDeclineStatisticBody(
      year: year ?? this.year,
      fishTypeId: fishTypeId ?? this.fishTypeId,
    );
  }
}
