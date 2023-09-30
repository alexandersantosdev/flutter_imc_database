import 'package:hive/hive.dart';
import 'package:imc_database/constants.dart';
import 'package:imc_database/models/configuration_model.dart';

class ConfigurationRepository {
  static late Box _box;

  ConfigurationRepository._load();

  static Future<ConfigurationRepository> load() async {
    if (Hive.isBoxOpen(Constants.configurationModel)) {
      _box = Hive.box(Constants.configurationModel);
    } else {
      _box = await Hive.openBox(Constants.configurationModel);
    }
    return ConfigurationRepository._load();
  }

  void save(ConfigurationModel configurationModel) {
    _box.put(Constants.configurationModel, configurationModel);
  }

  ConfigurationModel getConfigurationModel() {
    var configurationModel = _box.get(Constants.configurationModel);
    if (configurationModel == null) {
      return ConfigurationModel.empty();
    }
    return configurationModel;
  }
}
