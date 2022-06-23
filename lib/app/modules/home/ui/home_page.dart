import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/app/modules/home/presenter/states/pet_state.dart';
import 'package:wa_pet_app/app/modules/home/presenter/stores/home_store.dart';
import 'package:wa_pet_app/app/modules/home/ui/widgets/categories_list_widget.dart';
import 'package:wa_pet_app/app/modules/home/ui/widgets/pet_card.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_enums.dart';
import 'package:wa_pet_app/shared/utils/colors.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    reaction<IPetState>((_) => store.state, (state) {
      String? message;
      Color color = Colors.grey;

      if (state is PetError) {
        color = Colors.red;
        message = state.message;
      } else if (state is PetSuccess) {
        color = Colors.green;
        message = 'Pets successfully loaded';
      }

      if (message != null) {
        ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration: const Duration(seconds: 2),
        ));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Adopt a Friend',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  GestureDetector(
                    onTap: () => store.logout(),
                    child: const Icon(FontAwesomeIcons.arrowRightFromBracket),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const CategoriesListWidget(),
              const SizedBox(height: 5),
              Observer(builder: (context) {
                return Row(
                  children: [
                    const Text('Pet list', style: TextStyle(fontSize: 20)),
                    Spacer(),
                    GestureDetector(
                      onTap: () =>
                          store.page <= 0 ? () {} : store.decreasePage(),
                      child: Icon(
                        FontAwesomeIcons.angleLeft,
                        color: store.page <= 0 ? mediumGrey : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () =>
                          store.pets.isEmpty ? () {} : store.increasePage(),
                      child: Icon(FontAwesomeIcons.angleRight,
                          color:
                              store.pets.isEmpty ? mediumGrey : Colors.black),
                    ),
                  ],
                );
              }),
              Observer(builder: (context) {
                if (store.state is PetLoading) {
                  return Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ));
                }
                return Expanded(
                    child: ListView(
                        children: (store.selectionEnum != PetSelectionEnum.all
                                ? store.pets.where((element) =>
                                    element.selectionEnum ==
                                    store.selectionEnum)
                                : store.pets)
                            .map((element) => PetCard(
                                  pet: element,
                                  onTap: () {
                                    Modular.to.pushNamed('/home/information',
                                        arguments: element);
                                  },
                                ))
                            .toList()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
