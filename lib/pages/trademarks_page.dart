import 'package:cupboard/models/trademarks.dart';
import 'package:cupboard/pages/loading_page.dart';
import 'package:cupboard/providers/trademark_provider.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrademarksPage extends StatelessWidget {
  const TrademarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trademarkService = Provider.of<TrademarkService>(context);

    //if (trademarkService.isLoading) return LoadingPage();

    return Scaffold(
      endDrawer: SideBar(),
      appBar: AppBar(
        title: const Text('Brands', style: TextStyle(fontSize: 30),),
      ),
      body: ListView.builder(
          itemCount: trademarkService.trademarkslist.length,
          itemBuilder: (context, index) => Container(
              color: Colors.black,
              child: _TrademarkProperties(
                  trademark: trademarkService.trademarkslist[index])
          )),
      persistentFooterButtons: const [
        DownButton(iconOption: Icons.home, route: '/'),
        DownButton(iconOption: Icons.add, route: '/'),
        DownButton(iconOption: Icons.close, route: '/'),
      ],
    );
  }
}

class _TrademarkProperties extends StatelessWidget {
  final Trademark trademark;

  const _TrademarkProperties({
    Key? key,
    required this.trademark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final trademarkService = Provider.of<TrademarkService>(context);
    //final index = trademarkService.trademarkslist.indexWhere((x) => x.idTrademark == trademark.idTrademark);

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
                  '${trademark.mark}',
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
                    onPressed: () => _showForm(context),
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
                    'Delete',
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.deepPurple,
                      ))
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  _showForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text('Editing Brand'),
            content: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 3,
                    )),

                    /*  enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple
                        )
                      ), */
                    /*  border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ), */
                    labelStyle: TextStyle(color: Colors.black),
                    labelText: 'New name',
                    hintText: 'Insert new brand name',
                  ),
                ),

                /*  IconButton(
                    onPressed: (){}, 
                    icon:  const Icon(Icons.save, color: Colors.deepPurple)
                  ) */
              ],
            )),
            actions: [
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.purpleAccent),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(
                width: 60,
              ),
              TextButton(
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.purpleAccent),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          );
        });
  }
}