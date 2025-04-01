enum AppRoutes {
  splash('splash', '/splash'),
  language('language', '/language'),
  login('login', '/login'),
  register('register', '/register/:phone'),
  confirmation('confirmation', '/confirmation'),
  checkSms('check_sms', '/check-sms/:phone'),
  main('main', '/main'),
  definitions('definitions', '/definitions'),
  deleteAccount('delete_account', '/delete-account'),
  billings('billings', '/billings'),
  placeDetails('place_details', '/place-details/:id/:title'),
  payMeCard('pay_me_card', '/pay-me-card/:model'),
  payMeCode('pay_me_code', '/pay-me-card/:model/:id/:name'),
  technologyDetails('technology_details', '/technology-details/:id'),
  diseaseDetails('disease_details', '/disease-details/:id'),
  createEconomic('create_economic', '/create-economic'),
  createDailyNutrient('create_daily_nutrient', '/create-daily-nutrient'),
  createPond('create_pond', '/create-pond/:pond'),
  createFishDecline('create_fish_decline', '/create-fish-decline'),
  fishDeclineDetails('fish_decline_details', '/fish-decline-details'),
  fishDeclineStatistics('fish_decline_statistics', '/fish-decline-statistics'),
  pondFish('pond_fish', '/pond-fish/:pond'),
  generalCalculations('general_calculations', '/general-calculations/:pond'),
  fishDeclineHistory('fish_decline_history', '/fish-decline-history/:pond'),
  generalCalculationList('general_calculation_list', '/general-calculation-list/:id'),
  generalCalculationDetails('general_calculation_details', '/general-calculation-details/:id/:pondId'),
  generalCalculationListDetails('general_calculation_list_details', '/general-calculation-list-details/:id'),
  createGeneralCalculations('create_general_calculations', '/create-general-calculations/:pond'),
  pondDetails('pond_details', '/pond-details/:pond'),
  expenseMonth('expense_month', '/expense-month'),
  expenseMonthStatistics('expense_month_statistics', '/expense-month-statistics'),
  filter('filter', '/filter'),
  createExpenseMonth('create_expense_month', '/create-expense-month'),
  detailsEconomic('details_economic', '/details-economic/:id');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}
