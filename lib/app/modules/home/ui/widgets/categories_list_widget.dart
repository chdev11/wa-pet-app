import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wa_pet_app/app/modules/home/presenter/stores/home_store.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_enums.dart';
import 'package:wa_pet_app/shared/utils/images.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeStore>();

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * .2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: PetSelectionEnum.values
            .map((element) => GestureDetector(
                  onTap: () => _fetchAction(element),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Observer(builder: (context) {
                      return Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: store.selectionEnum == element
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(100),
                              bottom: Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      image: _fetchImage(element),
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    )),
                                Text(
                                  _fetchTitle(element),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * .05),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ))
            .toList(),
      ),
    );
  }

  ImageProvider _fetchImage(PetSelectionEnum petSelectionEnum) {
    switch (petSelectionEnum) {
      case PetSelectionEnum.dog:
        return const AssetImage(drawDogThumb);
      case PetSelectionEnum.cat:
        return const AssetImage(drawCatThumb);
      default:
        return const AssetImage(drawPetThumb);
    }
  }

  String _fetchTitle(PetSelectionEnum petSelectionEnum) {
    switch (petSelectionEnum) {
      case PetSelectionEnum.all:
        return 'All';
      case PetSelectionEnum.dog:
        return 'Dogs';
      case PetSelectionEnum.cat:
        return 'Cats';
      default:
        return 'Unknown';
    }
  }

  void _fetchAction(PetSelectionEnum petSelectionEnum) {
    final store = Modular.get<HomeStore>();

    store.setSelectionEnum(petSelectionEnum);
  }

  IconData _fetchIcon(PetSelectionEnum petSelectionEnum) {
    switch (petSelectionEnum) {
      case PetSelectionEnum.all:
        return FontAwesomeIcons.solidHeart;
      case PetSelectionEnum.dog:
        return FontAwesomeIcons.dog;
      case PetSelectionEnum.cat:
        return FontAwesomeIcons.cat;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
