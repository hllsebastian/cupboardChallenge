import 'package:cupboard/models/trademarks.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Marcas extends StatelessWidget {
  const Marcas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final markService = Provider.of<TrademarkService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Marks'),
      ),
      drawer: SideBar(),
      body: Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: markService.trademarkslist.length,
            itemBuilder: (BuildContext context, int index) {
              return _CardContainer(
                mark: markService.trademarkslist[index],
              );
            }),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo[600],
          onPressed: () => {
                markService.selectedTrademark = Trademark(mark: ''),
                Navigator.pushNamed(context, 'detailmark')
              }),
    );
  }
}

class _CardContainer extends StatelessWidget {
  final Trademark mark;

  const _CardContainer({Key? key, required this.mark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final markService = Provider.of<TrademarkService>(context);
    final index =
        markService.trademarkslist.indexWhere((e) => e.idTrademark == mark.idTrademark);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(top: 20, bottom: 20),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${mark.mark}',
              style: TextStyle(fontSize: 25),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            /* Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    markService.selectedMark = markService.marks[index];
                    Navigator.pushNamed(context, 'detailmark');
                  },
                ), */
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.withOpacity(0.8),
                  ),
                  onPressed: () {
                    final dialog = AlertDialog(
                        title: Text('¿Are you sure to delete ${mark.mark}?'),
                        content: Text('Delete'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No')),
                          TextButton(
                            child: Text('Yes, Delete'),
                            onPressed: () async {
                              await markService
                                  .deleteMark('${mark.idTrademark}');
                              Navigator.of(context).pop();
                            },
                          ),
                        ]);

                    showDialog(context: context, builder: (_) => dialog);
                  },
                )
              ],
            ),
          
        decoration: _cardDecoration(),
        ),
      );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
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
 */