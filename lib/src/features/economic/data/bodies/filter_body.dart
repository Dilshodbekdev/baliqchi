/// expenseTypeId : "82bddd54-9311-4eed-8ddf-009dc5e72c74"
/// expenseName : "string"
/// expenseAmount : 1000
/// date : "2024-08-07"

class FilterBody {
  FilterBody({
    this.startDate,
    this.endDate,
  });

  String? startDate;
  String? endDate;
}
