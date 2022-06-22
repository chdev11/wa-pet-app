import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wa_pet_app/app/modules/home/presenter/stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
            Expanded(
                child: ListView(
                    children: store.pets
                        .map((element) => Row(
                              children: [
                                element.image != null
                                    ? Image(
                                        image: NetworkImage(element.image!),
                                        width: 100,
                                        height: 100,
                                      )
                                    : Container(),
                                Text(element.breedName ?? 'Desconhecido')
                              ],
                            ))
                        .toList()))
          ],
        ),
      ),
    );
  }
}
