import 'package:flutter/material.dart';
import 'fintness_app_theme.dart';
import 'training_screen.dart';
class Calll_Ainition_Training extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}
class _FitnessAppHomeScreenState extends State<Calll_Ainition_Training> with TickerProviderStateMixin {
  AnimationController animationController;
  Widget tabBody = Container(color: FintnessAppTheme.background);
  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = TrainingScreen(animationController: animationController);
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FintnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                ],
              );
            }
          },
        ),
      ),
    );
  }
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}