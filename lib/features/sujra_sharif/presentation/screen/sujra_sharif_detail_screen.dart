// ignore_for_file: avoid_print

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:sdfsdf/core/errors/error_dialog.dart';
import 'package:sdfsdf/core/errors/error_snackbar.dart';
import 'package:sdfsdf/core/util/loading_indicator.dart';
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
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.sujraSharif.eDetailTitle),
        ),
        body: BlocBuilder<SujraFBCubit, SujraFBState>(
          builder: (context, state) {
            BlocProvider.of<SujraFBCubit>(context)
                .getSujraFB(widget.sujraSharif.data);
            print(state);
            if (state is SujraFBLoaded) {
              //? setting pdf controller
              // final pdfController = PdfController(
              //   document: PdfDocument.openFile(state.path),
              // );

              print(state.path);

              // return StreamBuilder<TaskSnapshot>(
              //     stream: state.progress.snapshotEvents,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         double pr = state.progress.snapshot.bytesTransferred /
              //             state.progress.snapshot.totalBytes;
              //         return Center(
              //           child: Column(
              //             children: [
              //               LinearProgressIndicator(
              //                 value: pr,
              //                 minHeight: 2.0,
              //                 semanticsLabel: 'sdf',
              //               ),
              //               Text('${(pr * 100).toStringAsFixed(2)} % '),
              //             ],
              //           ),
              //         );
              //       }
              //       return const SizedBox();
              //     });
              //     PdfView(
              //   pageLoader: const LoadingIndicator(),
              //   documentLoader: const LoadingIndicator(),
              //   controller: pdfController,
              //   scrollDirection: Axis.vertical,
              //   onDocumentError: (o) {
              //     errorSnackBar(context);
              //     print(o);
              //   },
              //   errorBuilder: (o) {
              //     print(o);
              //     return const ErrorDialog();
              //   },
              // );
            }
            if (state is SujraFBLoading) {
              return const LoadingIndicator();
            }
            return const SizedBox(
              width: double.infinity,
              height: 500,
              child: ColoredBox(color: Colors.deepPurple),
            );
          },
        ),
      ),
    );
  }
}
