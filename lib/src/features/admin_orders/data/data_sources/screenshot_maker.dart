import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

mixin ScreenshotMaker {
  static dynamic imagePath;

  static Future saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now().toIso8601String().replaceAll('.', '_').replaceAll(':', '_');
    final name = 'screenshot_$time';
    final dynamic result = await ImageGallerySaver.saveImage(bytes, name: name);
    return imagePath = result['filePath'];
  }

  static Future openImage() async {
    await OpenFile.open(imagePath.toString());
  }
}
