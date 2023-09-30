import 'package:flutter/material.dart';
import 'package:imc_database/constants.dart';
import 'package:imc_database/models/configuration_model.dart';
import 'package:imc_database/repositories/configuration_repository.dart';
import 'package:imc_database/shared/widgets.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  late ConfigurationRepository configurationRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController photoController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    configurationRepository = await ConfigurationRepository.load();
    initData();
  }

  initData() {
    var configurationModel = configurationRepository.getConfigurationModel();
    setState(() {
      nameController.text = configurationModel.name;
      emailController.text = configurationModel.email;
      photoController.text = configurationModel.photo;
      heightController.text = configurationModel.height.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.configurationPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.mainPadding),
        child: ListView(
          children: [
            getTextField("Nome", Icons.person, nameController),
            getTextField("Email", Icons.mail, emailController),
            getTextField("Url da foto", Icons.photo, photoController),
            getTextField("Altura", Icons.height, heightController),
            getButton("Salvar", () {
              isLoading = true;
              ConfigurationModel model = ConfigurationModel(
                nameController.text,
                emailController.text,
                photoController.text,
                double.parse(heightController.text),
              );
              configurationRepository.save(model);
              setState(() {
                Navigator.pop(context);
                initData();
                isLoading = false;
              });
            }),
          ],
        ),
      ),
    );
  }
}
