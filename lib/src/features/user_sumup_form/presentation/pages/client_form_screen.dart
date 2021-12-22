import 'package:flutter/material.dart';
import 'package:profi_neon/src/app_localizations.dart';
import 'package:profi_neon/src/core/presentation/widgets/information.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/widgets/request_form.dart';
import 'package:profi_neon/src/features/user_sumup_form/presentation/widgets/request_sumup.dart';

class ClientFormScreen extends StatefulWidget {
  static const routeName = 'client_form_screen';
  @override
  _ClientFormScreenState createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends State<ClientFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inkDark,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('client_counter_screen');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: corp,
            )),
        centerTitle: true,
        title: Text(
            AppLocalization.of(context)!.getTranslatedValues('Anfrage senden'),
            style: Theme.of(context).textTheme.headline1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: informationPadding1,
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Information(AppLocalization.of(context)!.getTranslatedValues(
                  'Vielen Dank für die Angabe der Montagedetails. Wenn alles richtig ist, bitte füllen Sie das Kontaktformular aus. Ihre Anfrage wird bearbeitet')),
              const SizedBox(
                height: 20,
              ),
              RequestSumUp(),
              RequestForm(),
            ],
          ),
        ),
      ),
    );
  }
}
