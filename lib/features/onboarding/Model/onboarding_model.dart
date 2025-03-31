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
      image: 'assets/images/Onboarding1st.jpg',
    ),
    OnBoardingModel(
      title: 'Select Payment Method',
      description:
          "For seamless Transcations, Choose Your Preferred Payment Option - Your Convenience Our Pirority!",
      image: 'assets/images/Onboarding2nd.jpg',
    ),
    OnBoardingModel(
      title: 'Deliver At You Door Step',
      image:
          'From Our Doorstep To Yours - Swift, Secure and Contactless Delivery!',
      description:
          'Showcase your properties effortlessly and reach a broader audience.',
    ),
  ];
}
