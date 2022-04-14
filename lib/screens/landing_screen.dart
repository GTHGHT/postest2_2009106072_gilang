import 'dart:async';

import '../utilities/constants.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<Offset> _imageAnimation;
  late AnimationController _textController;
  late Animation<Offset> _textAnimation;
  late AnimationController _buttonController;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    _imageController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _imageAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(_imageController);
    _textController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _textAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(_textController);
    _buttonController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _buttonAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(_buttonController);
    Timer(
      Duration(milliseconds: 200),
      () => _imageController.forward(from: 0).then(
            (value) => _textController.forward(from: 0).then(
                  (value) => _buttonController.forward(from: 0),
                ),
          ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeTransition(
                opacity: _imageController,
                child: SlideTransition(
                  position: _imageAnimation,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            kWeatherImageList[index % kWeatherImageList.length],
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FadeTransition(
                opacity: _textController,
                child: SlideTransition(
                  position: _textAnimation,
                  child: Column(
                    children: const [
                      Text(
                        "Discover the Weather\n"
                        "In Your City",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Find out what can be waiting for you\n"
                        "on the street with a few taps",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              FadeTransition(
                opacity: _buttonController,
                child: SlideTransition(
                  position: _buttonAnimation,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 10,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF6CC1F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Get Started",
                      style: kLandingButtonTextStyle,
                    ),
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