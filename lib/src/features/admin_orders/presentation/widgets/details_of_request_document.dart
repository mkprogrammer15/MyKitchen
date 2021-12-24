import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_orders/presentation/pages/document_details_screen.dart';

class DetailsOfRequestDocument extends StatelessWidget {
  const DetailsOfRequestDocument({
    Key? key,
    required this.widget,
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.widget4,
    required this.widget5,
    required this.widget6,
    required this.widget7,
    required this.widget8,
    required this.widget9,
    required this.widget10,
  }) : super(key: key);

  final DocumentDetailsScreen widget;
  final DocumentDetailsScreen widget1;
  final DocumentDetailsScreen widget2;
  final DocumentDetailsScreen widget3;
  final DocumentDetailsScreen widget4;
  final DocumentDetailsScreen widget5;
  final DocumentDetailsScreen widget6;
  final DocumentDetailsScreen widget7;
  final DocumentDetailsScreen widget8;
  final DocumentDetailsScreen widget9;
  final DocumentDetailsScreen widget10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Anfrage vom: ${widget.re!.requestDate}',
            // .substring(0, '${widget1.re!['Anfrage vom']}'.length - 3),
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: corpBright),
          ),
          Text('Küchenlänge: ${widget2.re!.kitchenSize} Meter',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: corpBright)),
          Text(
              'Hängeschränke ${widget3.re!.haenge}'
                  .replaceAll('true', 'Ja')
                  .replaceAll('false', 'Nein'),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: widget.re!.haenge == true ? appleDarker : cherry,
                  )),
          Text(
            'Arbeitsplatte schneiden: ${widget4.re!.platte}'
                .replaceAll('true', 'Ja')
                .replaceAll('false', 'Nein'),
            style: Theme.of(context).textTheme.headline3!.copyWith(
                color: widget.re!.platte == true ? appleDarker : cherry),
          ),
          Text(
              'Gebrauchte Küche: ${widget5.re!.gebraucht}'
                  .replaceAll('true', 'Ja')
                  .replaceAll('false', 'Nein'),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: widget.re!.gebraucht == true ? appleDarker : cherry)),
          Text(
              'Anschluss Waschmaschine: ${widget6.re!.waschmaschine}'
                  .replaceAll('true', 'Ja')
                  .replaceAll('false', 'Nein'),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color:
                      widget.re!.waschmaschine == true ? appleDarker : cherry)),
          Text(
              'Anschluss Spülmaschine: ${widget7.re!.spuelmaschine}'
                  .replaceAll('true', 'Ja')
                  .replaceAll('false', 'Nein'),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color:
                      widget.re!.spuelmaschine == true ? appleDarker : cherry)),
          Text(
              'Anschluss Herd: ${widget8.re!.herd}'
                  .replaceAll('true', 'Ja')
                  .replaceAll('false', 'Nein'),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: widget.re!.herd == true ? appleDarker : cherry)),
          Text(
              'Wunschdatum Montage: ${widget9.re!.installationDate}'
                  .replaceAll('true', 'Ja')
                  .replaceAll('false', 'Nein'),
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: corpBright)),
          Text(
            'Gesamt geschätzt: ${widget10.re!.totalPrice}',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: corpBrighter),
          ),
        ],
      ),
    );
  }
}
