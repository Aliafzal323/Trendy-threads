class OnBoardingModel {
  OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  static List<OnBoardingModel> onboardingItems = [
    OnBoardingModel(
      title: 'Choose Your Product',
      description:
          'Welcome to a world of limitless choices - Your Perfect Product Awaits!',
      image: 'assets/images/splash_image.png',
    ),
    OnBoardingModel(
      title: 'Select Payment Method',
      description:
          "For seamless Transcations, Choose Your Preferred Payment Option - Your Convenience Our Pirority!",
      image: 'assets/images/splash_image.png',
    ),
    OnBoardingModel(
      title: 'Deliver At You Door Step',
      description:
          'From Our Doorstep To Yours - Swift, Secure and Contactless Delivery!',
      image: 'assets/images/splash_image.png',
    ),
  ];
}
