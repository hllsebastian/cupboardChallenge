import 'package:cupboard/providers/trademark_provider.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:cupboard/widgets/box_form.dart';
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/form_card.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeMarkForm extends StatelessWidget {
  const TradeMarkForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final trademarkService = Provider.of<TrademarkService>(context);

    return ChangeNotifierProvider(
      create: (_) => TrademarkProvider(trademarkService.selectedTrademark),
      child: TradeMarkFormContainer(markService: trademarkService),
    );
  }
}



class TradeMarkFormContainer extends StatelessWidget {

  final TrademarkService markService;

  const TradeMarkFormContainer({ 
    Key? key,
    required this.markService,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final tradeMarkForm = Provider.of<TrademarkProvider>(context);
    final tradeMark = tradeMarkForm.mark;

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Ingresa nueva marca'),
        backgroundColor: Colors.purple,
      ),
      body: BoxForm(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              FormCard(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nueva Marca',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const _ProductForm(titlefield: 'Nombre de la marca'),
                    /* const _ProductForm(
                      titlefield: 'Nombre de la marca',
                    ), */
                  ],
                ),
              ),
              const SizedBox(height: 80),
              
              TextButton.icon(
                //style: ButtonStyle(backgroundColor:  ),
                icon: const Icon(Icons.save_outlined,size: 45, color: Colors.deepPurple),
                label: const Text('Guardar', style: TextStyle(color: Colors.black54, fontSize: 26)),
                onPressed: markService.isSaving 
                          ? null
                          : () async {
                            if(!tradeMarkForm.isValidForm()) return;
                            await markService.saveOrCreateMark(tradeMark);
                            Navigator.of(context).pop();
                          } 

              ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  icon: const Icon(Icons.cancel_outlined,
                      size: 45, color: Colors.deepPurple),
                  onPressed: () => Navigator.of(context).pop(),
                  label: const Text('Cancelar',
                      style: TextStyle(color: Colors.black54, fontSize: 26)))
            ],
          ),
        ),
      ),
      persistentFooterButtons: const [
        Padding(
          padding: EdgeInsets.only(right: 70),
          child: DownButton(iconOption: Icons.home, route: '/'),
        ),
        //DownButton(iconOption: Icons.add,   route: 'addBrand'),
        Padding(
          padding: EdgeInsets.only(right: 40),
          child: DownButton(iconOption: Icons.close, route: 'login'),
        ),
      ],
    );
  }
}

class _ProductForm extends StatelessWidget {

  final String titlefield;
  
  const _ProductForm({Key? key, required this.titlefield})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final trademarkForm = Provider.of<TrademarkProvider>(context);
    final newTrademark = trademarkForm.mark;

    // ignore: avoid_unnecessary_containers
    return Form(
      key: trademarkForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          autocorrect: false,
          decoration: _formStyle(),
          onChanged: (value) => newTrademark.mark = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingresa una categoria para guardar';
            }
          },
        )
      ],
    ));
  }

  InputDecoration _formStyle() {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2)),
      labelText: titlefield,
      hintText: 'Ingrese nueva marca',
      labelStyle: const TextStyle(color: Colors.blueGrey),
    );
  }
}


