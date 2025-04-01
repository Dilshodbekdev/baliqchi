/// id : "e62a33ac-b34c-4f04-b3ab-3c675f706ab3"
/// files : [{"id":"db84f4c8-e80d-4a34-87f6-e3dbc940dada","path":"places/e62a33ac-b34c-4f04-b3ab-3c675f706ab3/1723097280559golden_fish3.jpg"},{"id":"8a03195e-f939-4aa4-8c77-008338263fd2","path":"places/e62a33ac-b34c-4f04-b3ab-3c675f706ab3/1723097280561golden_fish1.jpg"},{"id":"4d0859b4-cd7f-43a0-9861-30db6ab962f2","path":"places/e62a33ac-b34c-4f04-b3ab-3c675f706ab3/1723097280564golden_fish2.jpg"},{"id":"ce0e7e43-e1aa-4cdb-876f-eede8ed18241","path":"places/e62a33ac-b34c-4f04-b3ab-3c675f706ab3/1723097280567golden_fish4.jpg"}]
/// endDate : "2024-09-30"
/// contentUz : "Bu – tabiat qo‘ynida dam olishni xush ko‘radiganlar uchun ajoyib manzil. Tashrif buyurganlar uchun – 7 ta sun’iy hovuz va muntazam ravishda oqar suv bilan to‘ldiriladigan toza suv havzasi xizmatda. Ularda do‘ngpeshona, sazan, oq amur va boshqa baliq turlarini uchratish mumkin. Dam olish maskanining asosiy afzalligi – bu yerda har bir xohlovchi baliq ovlashi, yangi tutilgan baliqdan taom tayyorlashi, tabiat yonbag‘rida katta shahar shovqinidan dam olishi mumkin. Oltin baliq mamlakat klubi hududida Arxangelsk log uyidan beshta ekologik toza kottejlar mavjud.\nBog'lanish uchun telefon raqam: \t\n+998 95 170 33 07, +998 95 170 33 07\nWebsite: https://goldenfishgroup.uz/uz\n"
/// contentRu : "Это замечательное место для тех, кто предпочитает отдых на природе. К услугам  посетителей – 7 искусственных прудов и чистый водоем, постоянно пополняемый проточной водой. В них можно встретить форель, осетра, толстолобика, сазана,  белого амура и другие виды рыб. Главное преимущество зоны отдыха – это то, что каждый желающий может приехать, порыбачить, приготовить свежесловленную рыбу, отдохнуть от шума мегаполиса в окружении первозданной природы. На территории загородного клуба Golden Fish располагаются пять экологически чистых коттеджей из Архангельского сруба. \nКонтактный телефон: \t\n+998 95 170 33 07, +998 95 170 33 07\nСайт: https://goldenfishgroup.uz/ru.\n"
/// free : false
/// titleUz : "Golden Fish"
/// titleRu : "Golden Fish"
/// startDate : "2024-08-01"
/// fee : "2000000"
/// addressUz : "Toshkent viloyati, O‘rtachirchiq tumanidagi O‘rta-Saroy qishlog‘i"
/// addressRu : "Урта-Чирчикском районе Ташкентской области, в поселке Урта-Сарай."
/// fishTypes : [{"id":"4cdc447f-1fa2-4f20-baf8-e71227247fdc","forHunting":true,"forFeeding":false,"files":[{"id":"0035be0a-d887-4288-8b00-51aacebf103e","path":"fishTypes/4cdc447f-1fa2-4f20-baf8-e71227247fdc/1724928219671farel.jfif"}],"nameUz":"Farel","nameRu":"Форель"},{"id":"e00d96a2-8c36-432d-9faf-c03303fae997","forHunting":true,"forFeeding":false,"files":[],"nameUz":"Oq amur","nameRu":"Белого амура"},{"id":"5e021472-1a9f-44b0-98c1-467d7cd95e84","forHunting":true,"forFeeding":false,"files":[{"id":"5313ec17-63a8-4633-961c-c5cde451d9e7","path":"fishTypes/5e021472-1a9f-44b0-98c1-467d7cd95e84/1724216136523user.png"},{"id":"6978fcd8-8089-40c5-b9b5-9278c19475df","path":"fishTypes/5e021472-1a9f-44b0-98c1-467d7cd95e84/1724656728828test-sku.webp"}],"nameUz":"Do‘ngpeshona","nameRu":"Горбуша"}]
/// regionId : "bf66af2e-065a-47a4-8d82-6d816bdf7699"
/// lon : 41.48368530319007
/// lat : 69.6002338348258

class PlaceDetailsModel {
  PlaceDetailsModel({
    this.id,
    this.files,
    this.endDate,
    this.contentUz,
    this.contentRu,
    this.free,
    this.titleUz,
    this.titleRu,
    this.startDate,
    this.fee,
    this.addressUz,
    this.addressRu,
    this.fishTypes,
    this.regionId,
    this.lon,
    this.lat,
  });

  PlaceDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    endDate = json['endDate'];
    contentUz = json['contentUz'];
    contentRu = json['contentRu'];
    free = json['free'];
    titleUz = json['titleUz'];
    titleRu = json['titleRu'];
    startDate = json['startDate'];
    fee = json['fee'];
    addressUz = json['addressUz'];
    addressRu = json['addressRu'];
    if (json['fishTypes'] != null) {
      fishTypes = [];
      json['fishTypes'].forEach((v) {
        fishTypes?.add(FishTypes.fromJson(v));
      });
    }
    regionId = json['regionId'];
    lon = json['lon'];
    lat = json['lat'];
  }

  String? id;
  List<Files>? files;
  String? endDate;
  String? contentUz;
  String? contentRu;
  bool? free;
  String? titleUz;
  String? titleRu;
  String? startDate;
  String? fee;
  String? addressUz;
  String? addressRu;
  List<FishTypes>? fishTypes;
  String? regionId;
  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['endDate'] = endDate;
    map['contentUz'] = contentUz;
    map['contentRu'] = contentRu;
    map['free'] = free;
    map['titleUz'] = titleUz;
    map['titleRu'] = titleRu;
    map['startDate'] = startDate;
    map['fee'] = fee;
    map['addressUz'] = addressUz;
    map['addressRu'] = addressRu;
    if (fishTypes != null) {
      map['fishTypes'] = fishTypes?.map((v) => v.toJson()).toList();
    }
    map['regionId'] = regionId;
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}

/// id : "4cdc447f-1fa2-4f20-baf8-e71227247fdc"
/// forHunting : true
/// forFeeding : false
/// files : [{"id":"0035be0a-d887-4288-8b00-51aacebf103e","path":"fishTypes/4cdc447f-1fa2-4f20-baf8-e71227247fdc/1724928219671farel.jfif"}]
/// nameUz : "Farel"
/// nameRu : "Форель"

class FishTypes {
  FishTypes({
    this.id,
    this.forHunting,
    this.forFeeding,
    this.files,
    this.nameUz,
    this.nameRu,
  });

  FishTypes.fromJson(dynamic json) {
    id = json['id'];
    forHunting = json['forHunting'];
    forFeeding = json['forFeeding'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    nameUz = json['nameUz'];
    nameRu = json['nameRu'];
  }

  String? id;
  bool? forHunting;
  bool? forFeeding;
  List<Files>? files;
  String? nameUz;
  String? nameRu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['forHunting'] = forHunting;
    map['forFeeding'] = forFeeding;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['nameUz'] = nameUz;
    map['nameRu'] = nameRu;
    return map;
  }
}

/// id : "0035be0a-d887-4288-8b00-51aacebf103e"
/// path : "fishTypes/4cdc447f-1fa2-4f20-baf8-e71227247fdc/1724928219671farel.jfif"

class Files {
  Files({
    this.id,
    this.path,
  });

  Files.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
  }

  String? id;
  String? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    return map;
  }
}