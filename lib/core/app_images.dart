class AppImages {
  static String get hierarchy => "assets/images/hierarchy.png";
  static String get data => "assets/images/data.png";
  static String get laptop => "assets/images/laptop.png";
  static String get blocks => "assets/images/blocks.png";
  static String get check => "assets/images/check.png";
  static String get error => "assets/images/error.png";
  static String get trophy => "assets/images/trophy.png";
  static String get logo => "assets/images/logo.png";
  static String get smallLogo => "assets/images/small_logo.png";

  static getImage(String name) {
    switch (name) {
      case "blocks":
        return AppImages.blocks;
      case "laptop":
        return AppImages.laptop;
      case "data":
        return AppImages.data;
      case "hierarchy":
        return AppImages.hierarchy;
      default:
        return "";
    }
  }
}
