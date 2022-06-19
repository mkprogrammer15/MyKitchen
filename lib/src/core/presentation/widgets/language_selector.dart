import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/languagelist.dart';
import 'package:profi_neon/src/core/presentation/blocs/language_bloc.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class LanguageSelector extends StatelessWidget {
  final String imagepath;
  final String language;
  final int index;
  final String currentLanguageSmall;
  final String currentLanguageBig;

  const LanguageSelector({
    required this.language,
    required this.imagepath,
    required this.index,
    required this.currentLanguageSmall,
    required this.currentLanguageBig,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: LanguageList.langList,
      builder: (context, value, child) => Container(
            //Use Mediaquery.of(context) later on
            height: 60,
            width: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: LanguageList.langList.value[index] == true ? Border.all(width: 2, color: lime) : null),
            child: IconButton(
                iconSize: 20,
                onPressed: () {
                  LanguageList.changeLanguage(index);
                  BlocProvider.of<LanguageBloc>(context).add(LanguageEvent(locale: Locale(currentLanguageSmall, currentLanguageBig)));
                },
                icon: Image.asset(imagepath)),
          ));
}
