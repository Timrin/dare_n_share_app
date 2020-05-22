//TODO: Add attribution to the images in the app
class OnboardingData {
  OnboardingData._();

  //Paths for the graphics images
  static const List<String> images = [
    "assets/onboarding_graphics/VectorArtChallenge.png",
    "assets/onboarding_graphics/VectorArtCompete.png",
    "assets/onboarding_graphics/VectorArtWin.png"
  ];

  static const List<double> imageHeightConstraint = [
    150,
    110,
    180
  ];

//List of the onboarding page titles
  static const List<String> titles = ["Challenge", "Compete", "Win"];

//List of the onboarding page body text
  static const List<String> textBodies = [
    "I think my strongest asset maybe by far is my temperament. I have a placeholding temperament. I know words. I have the best words. I think the only card she has is the Lorem card.",
    "Bacon ipsum dolor amet tail landjaeger corned beef, biltong ribeye beef pork sausage short loin bacon cow ground round pork chop capicola tenderloin.",
    "Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps."
  ];
}
