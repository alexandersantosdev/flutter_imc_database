import 'package:hive/hive.dart';
import 'package:imc_database/constants.dart';
import 'package:imc_database/models/pessoa_model.dart';

class PessoaRepository {
  static late Box _box;

  PessoaRepository._load();

  static Future<PessoaRepository> load() async {
    if (Hive.isBoxOpen(Constants.pessoaModel)) {
      _box = Hive.box(Constants.pessoaModel);
    } else {
      _box = await Hive.openBox(Constants.pessoaModel);
    }
    return PessoaRepository._load();
  }

  void save(PessoaModel pessoaModel) {
    _box.add(pessoaModel);
  }

  List<PessoaModel> getPessoasModels() {
    var pessoaModel = _box.values.cast<PessoaModel>().toList();
    return pessoaModel;
  }
}
