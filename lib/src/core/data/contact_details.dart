import 'package:url_launcher/url_launcher.dart';

mixin ContactDetails {
  static Future<void> customLaunch(String phone) async {
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      print('Could not launch $phone');
    }
  }

  static Future<void> launchURL(String path) async {
    final params = Uri(scheme: 'mailto', path: path, query: 'user request');
    final url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
