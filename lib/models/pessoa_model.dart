// ignore_for_file: prefer_final_fields, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:imc_database/constants.dart';
import 'package:hive/hive.dart';

part 'pessoa_model.g.dart';

@HiveType(typeId: 1)
class PessoaModel extends HiveObject {
  @HiveField(0)
  String _nome = "";
  @HiveField(1)
  double _peso = 0.0;
  @HiveField(2)
  double _altura = 0.0;

  PessoaModel(this._nome, this._peso, this._altura);
  PessoaModel.empty();

  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;

  set nome(String nome) => _nome = nome;
  set peso(double peso) => _peso = peso;
  set altura(double altura) => _altura = altura;

  Map classificaPessoa() {
    var classificacao = {};
    var imc = calculaImc();

    if (imc is double && imc > 0) {
      if (imc < 16) {
        classificacao["tipo"] = 'Magreza grave';
        classificacao["cor"] = Constants.magrezaGrave;
      } else if (imc >= 16 && imc < 17) {
        classificacao["tipo"] = 'Magreza moderada';
        classificacao["cor"] = Constants.magrezaModerada;
      } else if (imc >= 17 && imc < 18.5) {
        classificacao["tipo"] = 'Magreza leve';
        classificacao["cor"] = Constants.magrezaLeve;
      } else if (imc >= 18.5 && imc < 25) {
        classificacao["tipo"] = 'Saudável';
        classificacao["cor"] = Constants.saudavel;
      } else if (imc >= 25 && imc < 30) {
        classificacao["tipo"] = 'Sobre peso';
        classificacao["cor"] = Constants.sobrepeso;
      } else if (imc >= 30 && imc < 35) {
        classificacao["tipo"] = 'Obesidade Grau I';
        classificacao["cor"] = Constants.obesidadeGrauI;
      } else if (imc >= 35 && imc < 40) {
        classificacao["tipo"] = 'Obesidade Grau II (severa)';
        classificacao["cor"] = Constants.obesidadeGrauII;
      } else {
        classificacao["tipo"] = 'Obesidade Grau III (mórbida)';
        classificacao["cor"] = Constants.obesidadeGrauIII;
      }
      classificacao["imc"] = imc.toStringAsFixed(0);
      return classificacao;
    }
    return {"tipo": imc, "cor": Colors.red};
  }

  dynamic calculaImc() {
    if (_altura < 1.20 || _altura > 2.40) {
      return 'Altura inválida, deve conter entre 1,20m e 2,40m';
    }
    if (_peso < 35 || _peso > 380) {
      return 'Peso inválido, deve conter entre 35kg e 380kg';
    }
    return _peso / (_altura * _altura);
  }
}
