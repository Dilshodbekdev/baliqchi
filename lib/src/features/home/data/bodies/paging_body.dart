class PagingBody {
  int? page;
  int? pageSize = 10;
  String? regionId;
  String? search;
  String? id;
  double? price;

  PagingBody({
    this.page,
    this.pageSize,
    this.regionId,
    this.search,
    this.id,
    this.price,
  });

  PagingBody copyWith({
    int? page,
    int? pageSize,
    String? regionId,
    String? search,
    String? id,
    double? price,
  }) =>
      PagingBody(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        regionId: regionId ?? this.regionId,
        search: search ?? this.search,
        id: id ?? this.id,
        price: price ?? this.price,
      );
}
