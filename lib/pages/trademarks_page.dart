import 'package:cupboard/models/trademark_model.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrademarksPage extends StatelessWidget {
  const TrademarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trademarkService = Provider.of<TrademarkService>(context);

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text(
          'Marcas',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
          itemCount: trademarkService.trademarkslist.length,
          itemBuilder: (_, index) => _TrademarkName(
                trademark: trademarkService.trademarkslist[index],
              )),

      /* floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          trademarkService.selectedTrademark = TrademarkModel(
            mark: '' 
          );
          Navigator.pushNamed(context, 'formProduct');
        },
      ), */

      persistentFooterButtons: [
        const DownButton(iconOption: Icons.home, route: '/'),
        IconButton(
            icon: const Icon(Icons.add),
            color: Colors.deepPurple,
            onPressed: () {
              trademarkService.selectedTrademark = TrademarkModel(mark: '');
              Navigator.pushNamed(context, 'addBrand');
            }),

        //DownButton(iconOption: Icons.add, route: 'addBrand'),
        const DownButton(iconOption: Icons.close, route: 'login'),
      ],
    );
  }
}

class _TrademarkName extends StatelessWidget {
  final TrademarkModel trademark;

  const _TrademarkName({
    Key? key,
    required this.trademark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trademarkService = Provider.of<TrademarkService>(context);
    final index = trademarkService.trademarkslist
        .indexWhere((x) => x.idTrademark == trademark.idTrademark);

    return Container(
      height: 120,
      //margin: EdgeInsets.all(20),

      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: Card(
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 35, left: 10),
                child: Text(
                  trademark.mark,
                  style: const TextStyle(fontSize: 22),
                )),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    'Edite',
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      icon: const Icon(Icons.edit, color: Colors.deepPurple),
                      onPressed: () {
                        trademarkService.selectedTrademark = trademarkService.trademarkslist[index];
                        Navigator.pushNamed(context, 'addBrand');
                        const TrademarksPage();
                      })
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    'Delete',
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
                              '¿Esta seguro de eliminar ${trademark.mark}?'),
                          actions: [
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Sí'),
                              onPressed: () async {
                                await trademarkService.deleteTradeMark(
                                    '${trademark.idTrademark}');
                                Navigator.of(context).pop();
                                const TrademarksPage();
                              },
                            ),
                          ]);
                      showDialog(context: context, builder: (_) => dialog);
                    },
                  )
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
