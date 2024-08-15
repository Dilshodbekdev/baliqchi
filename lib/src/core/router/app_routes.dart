enum AppRoutes {
  splash('splash', '/splash'),
  language('language', '/language'),
  login('login', '/login'),
  register('register', '/register/:phone'),
  confirmation('confirmation', '/confirmation'),
  checkSms('check_sms', '/check-sms/:phone'),
  main('main', '/main'),
  definitions('definitions', '/definitions'),
  billings('billings', '/billings'),
  placeDetails('place_details', '/place-details/:id'),
  technologyDetails('technology_details', '/technology-details/:id'),
  diseaseDetails('disease_details', '/disease-details/:id'),
  createEconomic('create_economic', '/create-economic'),
  createDailyNutrient('create_daily_nutrient', '/create-daily-nutrient'),
  expenseMonth('expense_month', '/expense-month'),
  createExpenseMonth('create_expense_month', '/create-expense-month'),
  detailsEconomic('details_economic', '/details-economic/:id');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}
