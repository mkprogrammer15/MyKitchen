import 'package:profi_neon/src/core/presentation/widgets/get_avatar.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

Container getCard() {
  return Container(
    width: 350,
    height: 300,
    margin: cardEdgeInset1,
    decoration: BoxDecoration(
      color: inkDark,
      borderRadius: BorderRadius.circular(14.5),
      boxShadow: cardShadow,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 90,
          alignment: Alignment.topCenter,
          child: getAvatar(),
        ),
        ElevatedButton(
            child: const Text(
              'Email: m.karp-flat@hotmail.com',
              style: TextStyle(
                backgroundColor: Colors.lightBlue,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _launchURL();
            }),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            customLaunch('tel: 004915785064675');
          },
          child: const Text(
            'Tel. : 015785064675',
            style: TextStyle(
                backgroundColor: Colors.lightBlue,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Adresse: Beispielstraße 23',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const Text('12350 Berlin',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ],
        )
      ],
    ),
  );
}

//Plan B zum ausprobieren für Emails und Anrufe-> leichter
void customLaunch(String phone) async {
  if (await canLaunch(phone)) {
    await launch(phone);
  } else {
    print('Could not launch $phone');
  }
}

// Versuch Email Launcher
void _launchURL() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'm.karp-flat@hotmail.com',
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
