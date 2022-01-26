import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:sdfsdf/features/sujra_sharif/presentation/cubit/cubit/sujrafb_cubit.dart';
import '../../domain/entity/sujra_detail_entity.dart';

class SujraDetailScreen extends StatefulWidget {
  final SujraDetailEntity sujraSharif;
  final String image;
  const SujraDetailScreen(
      {Key? key, required this.sujraSharif, required this.image})
      : super(key: key);

  @override
  State<SujraDetailScreen> createState() => _SujraDetailScreenState();
}

class _SujraDetailScreenState extends State<SujraDetailScreen> {
  // @override
  // void initState() {
  //   BlocProvider.of<SujraFBCubit>(context).getSujraFB(widget.sujraSharif.data);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sujraSharif.eDetailTitle),
      ),
      body: BlocBuilder<SujraFBCubit, SujraFBState>(
        builder: (context, state) {
          BlocProvider.of<SujraFBCubit>(context)
              .getSujraFB(widget.sujraSharif.data);
          print(state);
          if (state is SujraFBLoaded) {
            print(state.path);
            return const PDF().fromPath(
              state.path,
            );
          }
          return const SizedBox(
            width: double.infinity,
            height: 500,
            child: ColoredBox(color: Colors.deepPurple),
          );
        },
      ),
    );
  }
}
