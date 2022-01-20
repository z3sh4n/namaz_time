import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/cubit/sujrasharif_cubit.dart';

import '../../../../dependency_injection.dart';

class SujraSharifScreen extends StatefulWidget {
  const SujraSharifScreen({Key? key}) : super(key: key);

  @override
  State<SujraSharifScreen> createState() => _SujraSharifScreenState();
}

class _SujraSharifScreenState extends State<SujraSharifScreen> {
  late SujraSharifCubit sujraSharifCubit;

  @override
  void initState() {
    super.initState();
    sujraSharifCubit = sl<SujraSharifCubit>();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sujra Sharif"),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 2500),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'English Sujra sharif of Hazrat Tajusriya',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          ''''English Sujra sharif o
                          f Hazrat sdklfkjasdhfdkldsjf;lkasjffkjasdjfkj
                          Tajusrilksdjfjsdkfjjhdfkjhhdfjkhaskfhajskdhfljkhalksdjfhk
                          jhya''',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: _w / 20),
                    height: _w / 3.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
