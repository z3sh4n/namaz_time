import 'package:flutter/material.dart';
import '../theme/size_constants.dart';
import '../theme/theme_color.dart';
import '../../features/namaz_time/presentation/screens/home_screen.dart';
import '../../features/qiblah_direction/screen/qibla_screen.dart';
import '../../features/quran_sharif/presentation/screen/quran_sharif_screen.dart';
import '../../features/sujra_sharif/presentation/screen/sujra_sharif_screen.dart';

class BottomNav3 extends StatefulWidget {
  const BottomNav3({Key? key}) : super(key: key);

  @override
  BottomNav3State createState() => BottomNav3State();
}

class BottomNav3State extends State<BottomNav3> {
  var currentIndex = 0;

  List<Widget> pagelist = <Widget>[
    const HomeScreen(),
    const QiblaScreen(),
    const QuranSharifScreen(),
    const SujraSharifScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pagelist[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: _width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.11),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : _width * .029,
                    right: _width * .0422,
                    left: _width * .0422,
                  ),
                  width: _width * .128,
                  height: index == currentIndex ? _width * .014 : 0,
                  decoration: const BoxDecoration(
                    color: kLightPrimary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: _width * .076,
                  color:
                      index == currentIndex ? kLightPrimary : Colors.black38,
                ),
                // SizedBox(height: _width * .03),
                AnimatedOpacity(
                  opacity: index == currentIndex ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Text(
                    index == currentIndex ? listOfTitles[index] : '',
                    style: const TextStyle(
                      color: kLightPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.dimen_12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.explore,
    Icons.book,
    Icons.book,
  ];

  List<String> listOfTitles = [
    'Home',
    'Qibla Screen',
    'Quran Sharif',
    'Sujra Sharif',
  ];
}
