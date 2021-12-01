import 'package:cupboard/widgets/box_form.dart';
import 'package:cupboard/widgets/form_card.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class AddProductsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBar(),
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Colors.purple,
      ),
      body: BoxForm(
        child: Column(
          children: [

            const SizedBox(height: 100,),

            FormCard(child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,), 

                  Text('New Product', style: Theme.of(context).textTheme.headline4,),

                  _ProductForm(titlefield: 'Product Name',),
                  _ProductForm(titlefield: 'Brand'),
                  _ProductForm(titlefield: 'Expiration date'),
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}


class _ProductForm extends StatelessWidget {

  final String titlefield;
  final String? datafield;

  _ProductForm({
    Key? key, 
    required this.titlefield, 
    this.datafield
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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