import 'package:flutter/material.dart';
import 'package:imc_database/pages/configuration.dart';
import 'package:imc_database/pages/home_page.dart';

class Constants {
  static const String appName = "IMC com database";
  static const String configurationModel = "configuration_model";
  static const String pessoaModel = "pessoa_model";
  static const String configurationPageTitle = "Configurações";
  static const double mainPadding = 25.0;

  static Color magrezaGrave = Colors.orange;
  static Color magrezaModerada = Colors.yellow[700]!;
  static Color magrezaLeve = Colors.yellow;
  static Color saudavel = Colors.greenAccent;
  static Color sobrepeso = Colors.blue;
  static Color obesidadeGrauI = Colors.red[200]!;
  static Color obesidadeGrauII = Colors.red[400]!;
  static Color obesidadeGrauIII = Colors.red;

  static final Map<String, Widget> pages = {
    "home": const HomePage(),
    "configuration": const Configuration(),
  };
}
