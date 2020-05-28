import 'package:dare_n_share_app/constants/colors.dart';
import 'package:dare_n_share_app/constants/onboarding_data.dart';
import 'package:dare_n_share_app/screens/login_user.dart';
import 'package:dare_n_share_app/screens/register_user.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWrapper extends StatefulWidget {
  @override
  _OnboardingWrapperState createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dare n Share",
          style: TextStyle(
              color: ColorDesign.colorPrimary, fontFamily: 'Pacifico', fontSize: 28),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 350,
                child: PageView(
                  controller: _pageController,
                  children: List.generate(
                      3,
                      (index) => Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Container(
                              height: 180,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image(
                                    height: 160,
                                    image: AssetImage(
                                        OnboardingData.images[index]),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    OnboardingData.titles[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 10, 50, 10),
                                    child: RichText(
                                      overflow: TextOverflow.visible,
                                      text: TextSpan(
                                          text:
                                              OnboardingData.textBodies[index],
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 12,
                                          ),
                                          children: <TextSpan>[]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,  // PageController
                count:  3,
                effect:  ExpandingDotsEffect(
                  activeDotColor: ColorDesign.colorSecondary.withOpacity(0.7),
                  dotColor: ColorDesign.colorSecondary.withOpacity(0.4),
                  dotHeight: 12,
                  dotWidth: 12,
                ),  // your preferred effect
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: RaisedButton(
                        child: Text("Register"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterUser()));
                        },
                      ))),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text("Sign In", style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginUser()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
