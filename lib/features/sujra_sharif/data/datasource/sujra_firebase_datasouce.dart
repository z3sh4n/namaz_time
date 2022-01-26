import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

abstract class SujraFirebaseDatasource {
  Future<String> getSujraFromFirebase(String name);
}

class SujraFirebaseDatasourceImpl extends SujraFirebaseDatasource {
  @override
  Future<String> getSujraFromFirebase(String name) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File downloadToFile = File('${appDocDir.path}/$name.pdf');
    final bool c = downloadToFile.existsSync();
    
    if (!c) {
      try {
        await FirebaseStorage.instance
            .ref('sujra_sharif/akhtar_raza_khan/$name.pdf')
            .writeToFile(downloadToFile);
      } on FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
        print(e);
      }
    }
    return downloadToFile.path;
  }
}
