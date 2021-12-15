import 'package:cupboard/models/cupboard_model.dart';
import 'package:cupboard/services/cupboard_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';

class CupboardPage extends StatelessWidget {
  const CupboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cupboardService = Provider.of<CupboardService>(context);

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text(
          'Cupboard',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
          itemCount: cupboardService.cupboardList.length,
          itemBuilder: (_, index) => _CupboardName(
                cupboardModel: cupboardService.cupboardList[index],
              )),
      persistentFooterButtons: [
        const DownButton(
          iconOption: Icons.home,
          route: '/',
        ),

        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            iconSize: 37,
            icon: const Icon(Icons.add),
            onPressed: () {
              cupboardService.selectedCupboard = CupboardModel(
                idProduct: '',
                amount: 0,
                entryDate: "",
                exitDate: "",
                expirationDate: "",
              );
              Navigator.pushNamed(context, 'addCupboard');
            },
          ),
        ),
        //const DownButton(iconOption: Icons.add,   route: 'addProduct',),

        const DownButton(
          iconOption: Icons.close,
          route: '/',
        ),
      ],
    );
  }
}

class _CupboardName extends StatelessWidget {
  final CupboardModel cupboardModel;

  const _CupboardName({
    Key? key,
    required this.cupboardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cupboardService = Provider.of<CupboardService>(context);
    final index = cupboardService.cupboardList
        .indexWhere((x) => x.idCupBoard == cupboardModel.idCupBoard);
    return Container(
      height: 120,
      //margin: EdgeInsets.all(20),

      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: Card(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 35, left: 10),
                child: Text(
                  cupboardModel.product!.nameProduct,
                  style: const TextStyle(fontSize: 22),
                )),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    'Editar',
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.deepPurple),
                    onPressed: () {
                      cupboardService.selectedCupboard =
                          cupboardService.cupboardList[index];
                      Navigator.pushNamed(context, 'addProduct');
                    },
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    'Eliminar',
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        final dialog = AlertDialog(
                            title: Text(
                                '¿Desea eliminar ${cupboardModel.product!.nameProduct}?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancelar')),
                              TextButton(
                                  child: const Text('Borrar'),
                                  onPressed:
                                      () {} /*  async {
                            await productService.deleteProduct('${product.idProduct}');
                            Navigator.of(context).pop();
                            const CupboardPage();
                          }, */
                                  ),
                            ]);
                        showDialog(context: context, builder: (_) => dialog);
                      })
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
