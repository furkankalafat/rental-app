class AppImage {
  static AppImage? _instance;
  static AppImage get instance {
    return _instance ??= AppImage._init();
  }

  static const String _folder = 'assets/images/';
  static const String _icons = '${_folder}icons/';

  AppImage._init();

  final String iconCar = '${_folder}icon_sedan.png';
  final String iconBookingFill = '${_icons}icon_booking_fill.png';
  final String iconBookingOutline = '${_icons}icon_booking_outline.png';
  final String iconEuro = '${_icons}icon_euro.png';
  final String iconGarageFill = '${_icons}icon_garage_fill.png';
  final String iconGarageOutline = '${_icons}icon_garage_outline.png';
  final String iconGear = '${_icons}icon_gear.png';
  final String iconLocation = '${_icons}icon_location.png';
  final String iconRentalFill = '${_icons}icon_rental_fill.png';
  final String iconRentalOutline = '${_icons}icon_rental_outline.png';
  final String iconArrowLeft = '${_icons}icon_arrow_left.png';
  final String iconArrowDown = '${_icons}icon_arrow_down.png';
  final String iconAdd = '${_icons}icon_add.png';
}
