part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState({required this.locale});

  factory LanguageState.initial() =>
      const LanguageState(locale: Locale('de', 'DE'));
  LanguageState copyWith({Locale? locale}) =>
      LanguageState(locale: locale ?? this.locale);

  @override
  List<Object> get props => [locale];
}
