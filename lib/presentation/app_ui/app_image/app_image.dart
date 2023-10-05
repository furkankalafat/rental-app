class AppImage {
  static AppImage? _instance;
  static AppImage get instance {
    return _instance ??= AppImage._init();
  }

  static const String _folder = 'assets/images/';
  static const String _icons = '${_folder}icons/';

  AppImage._init();

  final String iconAdd = '${_icons}icon_add.png';
  final String iconHome = '${_icons}icon_home.png';
  final String iconMinus = '${_icons}icon_minus.png';
  final String iconProfile = '${_icons}icon_profile.png';
  final String iconScan = '${_icons}icon_scan.png';
  final String iconArrowDown = '${_icons}icon_arrow_down.png';
  final String iconArrowLeft = '${_icons}icon_arrow_left.png';
  final String iconArrowRight = '${_icons}icon_arrow_right.png';
  final String iconBakery = '${_icons}icon_bakery.png';
  final String iconBreakfast = '${_icons}icon_breakfast.png';
  final String iconCleaning = '${_icons}icon_cleaning.png';
  final String iconDrink = '${_icons}icon_drink.png';
  final String iconEarthquakeBag = '${_icons}icon_earthquake_bag.png';
  final String iconFirstAidKit = '${_icons}icon_first_aid_kit.png';
  final String iconFood = '${_icons}icon_food.png';
  final String iconFrozen = '${_icons}icon_frozen.png';
  final String iconMeat = '${_icons}icon_meat.png';
  final String iconPersonalCare = '${_icons}icon_personal_care.png';
  final String iconSnack = '${_icons}icon_snack.png';
  final String iconTeaCoffee = '${_icons}icon_tea_coffee.png';
  final String iconVegetable = '${_icons}icon_vegetable.png';
}
