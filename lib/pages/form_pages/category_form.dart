import 'package:cupboard/widgets/box_form.dart';
import 'package:cupboard/widgets/form_card.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class FormCategory extends StatelessWidget {
  const FormCategory({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Nueva categoria'),
        backgroundColor: Colors.purple,
      ),
      body: BoxForm(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 100,),

              FormCard(child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10,), 

                    Text('New Product', style: Theme.of(context).textTheme.headline4,),

                    const _ProductForm(titlefield: 'Nombre de la categoria',),
                    const _ProductForm(titlefield: 'Marca'),
                    const _ProductForm(titlefield: 'Fecha de expiracion'),
                  ],
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}


class _ProductForm extends StatelessWidget {

  final String titlefield;
  final String? datafield;

  const _ProductForm({
    Key? key, 
    required this.titlefield, 
    this.datafield
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(
        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              decoration:  InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple
                  )
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 2
                  )
                ),
                labelText: titlefield,
                hintText: datafield,
                labelStyle: const TextStyle(color: Colors.blueGrey)
              ),
            )

          ],
        )
      ),
    );
  }
}