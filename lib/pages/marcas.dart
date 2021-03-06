/* import 'package:cupboard/models/trademark_model.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Marcas extends StatelessWidget {
  const Marcas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    final markService = Provider.of<TrademarkService>(context);

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
      title: const Text('Marcas', style: TextStyle(fontSize: 30),),
      ),
      body: ListView.builder(
          itemCount: markService.trademarkslist.length,
          itemBuilder: (_, index) {
            return _CardContainer(
              mark: markService.trademarkslist[index],
            );
          }),

      persistentFooterButtons: const [
       DownButton(iconOption: Icons.home,  route: '/'),
       DownButton(iconOption: Icons.add,   route: '/'),
       DownButton(iconOption: Icons.close, route: '/'),
      ],

    );
  }
}

class _CardContainer extends StatelessWidget {

  final Trademark mark;

  const _CardContainer({Key? key, required this.mark}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final markService = Provider.of<TrademarkService>(context);
    final index = markService.trademarkslist.indexWhere((e) => e.idTrademark == mark.idTrademark); 
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(mark.mark, style: const TextStyle(fontSize: 25), maxLines: 2,),
            const SizedBox(height: 10,),

             Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    markService.selectedTrademark = markService.trademarkslist[index];
                    Navigator.pushNamed(context, 'detailmark');
                  },
                 )]
                ),
                
                const SizedBox(width: 10,),
              /*   IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.withOpacity(0.8),
                  ),
                  onPressed: () {
                    final dialog = AlertDialog(
                        title: Text('??Are you sure to delete ${mark.mark}?'),
                        content: const Text('Delete'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No')),
                          TextButton(
                            child: const Text('Yes, Delete'),
                            onPressed: () async {
                              await markService
                                  .deleteMark('${mark.idTrademark}');
                              Navigator.of(context).pop();
                            },
                          ),
                        ]);

                    showDialog(context: context, builder: (_) => dialog);
                  },
                ) */
              ],
            ),
          
        decoration: _cardDecoration(),
        ),
      );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 8), blurRadius: 10)
          ]);
}


































/* import 'package:cupboard/models/trademarks.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Marcas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
  final marcas = Provider.of<TrademarkService>(context);
  
    return Scaffold(

      appBar: AppBar(
        title: const Text('Marcas'),
      ),

      body: ListView.builder(
        itemCount: marcas.trademarkslist.length,
        itemBuilder: (context, index) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(50),
            child: VistaMarcas(lista: marcas.trademarkslist[index])//--->> Vista del form
        ),
      ),
    );
  }
}


class VistaMarcas extends StatelessWidget {

  final Trademark lista;

  const VistaMarcas({
    Key? key, required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ListTile(title: Text(lista.mark),  subtitle: Text('${lista.idTrademark}')),
          const Divider(),

          Container(
            width: double.infinity,
            height: 40,
            color: Colors.red,
          )

        ],),
    );
  }
}
 */ */