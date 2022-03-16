import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/data/models/languagelist.dart';
import 'package:profi_neon/src/core/presentation/blocs/choose_language_bloc.dart';
import 'package:profi_neon/src/core/presentation/blocs/language_bloc.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class IconButtonLanguage extends StatelessWidget {
  final String imagepath;
  final String language;
  final int index;
  final String currentLanguageSmall;
  final String currentLanguageBig;

  const IconButtonLanguage({
    required this.language,
    required this.imagepath,
    required this.index,
    required this.currentLanguageSmall,
    required this.currentLanguageBig,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseLanguageBloc, ChooseLanguageState>(
      builder: (context, state) {
        if (state is BorderIconState) {
          return Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: state.langList[index] == true ? Border.all(width: 2, color: lime) : null),
            child: IconButton(
                iconSize: 20,
                onPressed: () {
                  LanguageList.changeLanguage(index);
                  BlocProvider.of<LanguageBloc>(context).add(LanguageEvent(locale: Locale(currentLanguageSmall, currentLanguageBig)));
                },
                icon: Image.asset(imagepath)),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
