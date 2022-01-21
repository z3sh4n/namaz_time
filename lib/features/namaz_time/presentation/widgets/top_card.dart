import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/size_constants.dart';
import '../../../../dependency_injection.dart';
import '../../../location/presentation/cubit/locationdetail_cubit.dart';

class TopCard extends StatefulWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  _TopCardState createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  late LocationdetailCubit locationdetailCubit;

  @override
  void initState() {
    super.initState();
    locationdetailCubit = sl<LocationdetailCubit>();
  }

  final _today = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationdetailCubit>(
      create: (context) => locationdetailCubit,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: Sizes.dimen_2,
                  blurRadius: Sizes.dimen_10,
                  offset: Offset(
                    Sizes.dimen_2,
                    Sizes.dimen_10,
                  ))
            ],
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xff97E7FF), Color(0xff25A5E5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        margin: EdgeInsets.all(15.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: Sizes.dimen_10.w),
            Stack(
              children: [
                // const SizedBox(child: CoundownTimer()),
                CircleAvatar(backgroundColor: Colors.white, radius: 75.r),
              ],
            ),
            SizedBox(width: Sizes.dimen_10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: Sizes.dimen_10.h),
                  Row(
                    children: [
                      // FaIcon(
                      //   FontAwesomeIcons.solidMoon,
                      //   size: 17.h,
                      // ),
                      const SizedBox(width: Sizes.dimen_2),
                      Text(
                        _today.toFormat("MMMM dd, yyyy"),
                        maxLines: 2,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      // FaIcon(
                      //   FontAwesomeIcons.calendarAlt,
                      //   size: Sizes.dimen_20.h,
                      // ),
                      Expanded(
                        child: Text(
                          DateFormat.yMMMMd().format(DateTime.now()),
                          maxLines: 1,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // FaIcon(
                      //   Icons.location_on,
                      //   size: Sizes.dimen_23.h,
                      // ),
                      BlocBuilder<LocationdetailCubit, LocationdetailState>(
                        builder: (context, state) {
                          print(state);
                          if (state is LocationdetailLoaded) {
                            return Expanded(
                              child: Text(
                                state.address,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
