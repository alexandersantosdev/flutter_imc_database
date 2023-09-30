import 'package:hive/hive.dart';

part 'configuration_model.g.dart';

@HiveType(typeId: 0)
class ConfigurationModel extends HiveObject {
  @HiveField(0)
  String name = "";
  @HiveField(1)
  String email = "";
  @HiveField(2)
  String photo = "";
  @HiveField(3)
  double height = 0.0;

  ConfigurationModel(this.name, this.email, this.photo, this.height);
  ConfigurationModel.empty();
}
