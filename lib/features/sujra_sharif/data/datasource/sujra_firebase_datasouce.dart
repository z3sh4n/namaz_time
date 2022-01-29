import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart' as x;
import 'package:path_provider/path_provider.dart';

abstract class SujraFirebaseDatasource {
  Future<void> getSujraDlinkFromFirebase(String name);
  // Future<TaskSnapshot> getSujraFrom(String name);
}

class SujraFirebaseDatasourceImpl extends SujraFirebaseDatasource {
  Future<void> requestDownload(String _url, String _name) async {
    final dir =
        await getApplicationDocumentsDirectory(); //From path_provider package
    var _localPath = dir.path + _name;
    final savedDir = Directory(_localPath);
    await savedDir.create(recursive: true).then((value) async {
      String? _taskid = await x.FlutterDownloader.enqueue(
        url: _url,
        fileName: _name,
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: false,
      );
      debugPrint(_taskid);
    });
  }

  @override
  Future<void> getSujraDlinkFromFirebase(String name) async {
    String downloadTask;

    final w =
        FirebaseStorage.instance.ref('sujra_sharif/akhtar_raza_khan/$name.pdf');

    downloadTask = await w.getDownloadURL();
    // downloadTask.storage.setMaxDownloadRetryTime(const Duration(seconds: 20));
    debugPrint(downloadTask);
    requestDownload(downloadTask, name);
  }
}
