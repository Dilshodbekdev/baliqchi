/// fishAmount : 0
/// fishWeight : 0
/// probabilitySurvival : 0
/// finalWeight : 0
/// foodPrice : 0
/// amountFeedPerKg : 0
/// foodTypeId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// fishTypeId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// technologyId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// hectare : 0
/// length : 0
/// breadth : 0
/// depth : 0
/// salary : 0
/// period : 0
/// plannedPriceFish : 0
/// currentPriceFish : 0
/// utilityBills : 0
/// taxExpenses : 0
/// otherExpenses : 0

class CreateEconomicBody {
  CreateEconomicBody({
    this.fishAmount,
    this.fishWeight,
    this.probabilitySurvival,
    this.finalWeight,
    this.foodPrice,
    this.amountFeedPerKg,
    this.foodTypeId,
    this.fishTypeId,
    this.technologyId,
    this.hectare,
    this.length,
    this.breadth,
    this.depth,
    this.salary,
    this.period,
    this.plannedPriceFish,
    this.currentPriceFish,
    this.utilityBills,
    this.taxExpenses,
    this.otherExpenses,
  });

  CreateEconomicBody.fromJson(dynamic json) {
    fishAmount = json['fishAmount'];
    fishWeight = json['fishWeight'];
    probabilitySurvival = json['probabilitySurvival'];
    finalWeight = json['finalWeight'];
    foodPrice = json['foodPrice'];
    amountFeedPerKg = json['amountFeedPerKg'];
    foodTypeId = json['foodTypeId'];
    fishTypeId = json['fishTypeId'];
    technologyId = json['technologyId'];
    hectare = json['hectare'];
    length = json['length'];
    breadth = json['breadth'];
    depth = json['depth'];
    salary = json['salary'];
    period = json['period'];
    plannedPriceFish = json['plannedPriceFish'];
    currentPriceFish = json['currentPriceFish'];
    utilityBills = json['utilityBills'];
    taxExpenses = json['taxExpenses'];
    otherExpenses = json['otherExpenses'];
  }

  int? fishAmount;
  int? fishWeight;
  int? probabilitySurvival;
  int? finalWeight;
  int? foodPrice;
  int? amountFeedPerKg;
  String? foodTypeId;
  String? fishTypeId;
  String? technologyId;
  int? hectare;
  int? length;
  int? breadth;
  int? depth;
  int? salary;
  int? period;
  int? plannedPriceFish;
  int? currentPriceFish;
  int? utilityBills;
  int? taxExpenses;
  int? otherExpenses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fishAmount'] = fishAmount;
    map['fishWeight'] = fishWeight;
    map['probabilitySurvival'] = probabilitySurvival;
    map['finalWeight'] = finalWeight;
    map['foodPrice'] = foodPrice;
    map['amountFeedPerKg'] = amountFeedPerKg;
    map['foodTypeId'] = foodTypeId;
    map['fishTypeId'] = fishTypeId;
    map['technologyId'] = technologyId;
    map['hectare'] = hectare;
    map['length'] = length;
    map['breadth'] = breadth;
    map['depth'] = depth;
    map['salary'] = salary;
    map['period'] = period;
    map['plannedPriceFish'] = plannedPriceFish;
    map['currentPriceFish'] = currentPriceFish;
    map['utilityBills'] = utilityBills;
    map['taxExpenses'] = taxExpenses;
    map['otherExpenses'] = otherExpenses;
    return map;
  }
}
