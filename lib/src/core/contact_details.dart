import 'package:url_launcher/url_launcher.dart';

mixin ContactDetails {
  static Future<void> launchPhone(String phone) async {
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      print('Could not launch $phone');
    }
  }

  static Future<void> launchEmail(String path) async {
    final params = Uri(scheme: 'mailto', path: path, query: 'user request');
    final url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static Future<void> launchMap(String address) async {
    final query = Uri.encodeComponent(address);
    final googleUrl = 'https://www.google.com/maps/search/?api=1&query=$query';

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }
}
