import 'package:flutter/material.dart';
import 'package:imc_database/constants.dart';
import 'package:imc_database/models/pessoa_model.dart';
import 'package:imc_database/repositories/configuration_repository.dart';
import 'package:imc_database/repositories/pessoa_repository.dart';
import 'package:imc_database/shared/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfigurationRepository configurationRepository;
  late PessoaRepository pessoaRepository;

  List<PessoaModel> pessoasModels = [];
  TextEditingController weightController = TextEditingController();

  String name = "";
  String email = "";
  double height = 0;
  String photoUrl = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  goToPage(String pageName, BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Constants.pages[pageName]!));
    setState(() {});
  }

  loadData() async {
    configurationRepository = await ConfigurationRepository.load();
    pessoaRepository = await PessoaRepository.load();
    initData();
  }

  initData() {
    var configurationModel = configurationRepository.getConfigurationModel();
    pessoasModels = pessoaRepository.getPessoasModels();

    setState(() {
      name = configurationModel.name;
      email = configurationModel.email;
      photoUrl = configurationModel.photo;
      height = configurationModel.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
      ),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Image.network(photoUrl, fit: BoxFit.contain),
            ),
            accountName: Text(name),
            accountEmail: Text(email),
          ),
          const SizedBox(
            height: 40,
          ),
          getMenuButton(
            "Home",
            Icons.home,
            () => goToPage("home", context),
          ),
          getMenuButton(
            "Configurações",
            Icons.settings,
            () => goToPage("configuration", context),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.mainPadding),
        child: Column(
          children: [
            getTextField(
                "Peso de hoje?", Icons.monitor_weight, weightController),
            getButton("Calcular", () {
              double weight = double.tryParse(weightController.text) ?? 0;
              PessoaModel p = PessoaModel(name, weight, height);
              p.calculaImc();
              weightController.text = "";
              pessoaRepository.save(p);
              setState(() => initData());
            }),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pessoasModels.length,
                itemBuilder: (context, index) {
                  var p = pessoasModels[index];
                  var classificacao = p.classificaPessoa();
                  var imc = classificacao["imc"];
                  var classificacaoColor = classificacao["cor"];
                  var classificacaoText = classificacao["tipo"];
                  return ListTile(
                    title: Text(
                      p.nome != "" ? p.nome : "Nome não informado",
                    ),
                    subtitle: Text(
                      "$classificacaoText - ${p.peso}Kg",
                      style: TextStyle(color: classificacaoColor),
                    ),
                    trailing: Text("IMC: $imc"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
