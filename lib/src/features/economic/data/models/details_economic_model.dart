/// id : "ed0dad4d-dc70-40df-ac40-282f9bf1f6ac"
/// plannedPriceFish : 14.0
/// totalExpense : 1.88419696E8
/// income : 0.84
/// fishPrice : 14.0
/// amountFish : 2
/// foodPrice : 30000.0
/// utilityBills : 191888.0
/// taxExpenses : 1.8820776E8
/// otherExpenses : 0.0
/// profit : -1.8841969516E8
/// priceKgFish : 3.140328266666667E9
/// totalSalary : 20048.0

class DetailsEconomicModel {
  DetailsEconomicModel({
      this.id, 
      this.plannedPriceFish, 
      this.totalExpense, 
      this.income, 
      this.fishPrice, 
      this.amountFish, 
      this.foodPrice, 
      this.totalFoodPrice,
      this.utilityBills,
      this.taxExpenses, 
      this.otherExpenses, 
      this.profit, 
      this.priceKgFish, 
      this.totalSalary,});

  DetailsEconomicModel.fromJson(dynamic json) {
    id = json['id'];
    plannedPriceFish = json['plannedPriceFish'];
    totalExpense = json['totalExpense'];
    income = json['income'];
    fishPrice = json['fishPrice'];
    amountFish = json['amountFish'];
    foodPrice = json['foodPrice'];
    totalFoodPrice = json['totalFoodPrice'];
    utilityBills = json['utilityBills'];
    taxExpenses = json['taxExpenses'];
    otherExpenses = json['otherExpenses'];
    profit = json['profit'];
    priceKgFish = json['priceKgFish'];
    totalSalary = json['totalSalary'];
  }
  String? id;
  double? plannedPriceFish;
  double? totalExpense;
  double? income;
  double? fishPrice;
  int? amountFish;
  double? foodPrice;
  double? totalFoodPrice;
  double? utilityBills;
  double? taxExpenses;
  double? otherExpenses;
  double? profit;
  double? priceKgFish;
  double? totalSalary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['plannedPriceFish'] = plannedPriceFish;
    map['totalExpense'] = totalExpense;
    map['income'] = income;
    map['fishPrice'] = fishPrice;
    map['amountFish'] = amountFish;
    map['foodPrice'] = foodPrice;
    map['totalFoodPrice'] = totalFoodPrice;
    map['utilityBills'] = utilityBills;
    map['taxExpenses'] = taxExpenses;
    map['otherExpenses'] = otherExpenses;
    map['profit'] = profit;
    map['priceKgFish'] = priceKgFish;
    map['totalSalary'] = totalSalary;
    return map;
  }

}