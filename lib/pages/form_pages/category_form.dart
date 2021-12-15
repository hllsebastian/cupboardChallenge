import 'package:cupboard/pages/categories_page.dart';
import 'package:cupboard/providers/category_provider.dart';
import 'package:cupboard/services/category_service.dart';
import 'package:cupboard/widgets/box_form.dart';
import 'package:cupboard/widgets/form_card.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryForm extends StatelessWidget {
  const CategoryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categoryService = Provider.of<CategoryService>(context);
    final CategoryProvider myProvider = CategoryProvider(categoryService.selectedCategory);

    return ChangeNotifierProvider(
        create: (context) => myProvider,
        child: _FormCategory(service: categoryService)
    );
  }
}

class _FormCategory extends StatelessWidget {

  final CategoryService service;
  const _FormCategory({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryProvider>(context);
    final categoryM = categoryForm.categoryModel;

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Agregar categoria'),
        backgroundColor: Colors.purple,
      ),
      body: BoxForm(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),

              FormCard(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Text('Ingresar nueva categoria', style: Theme.of(context).textTheme.headline4),

                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                          labelText: 'Nombre de la categoria',
                          hintText: 'Ingresar datos',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      initialValue: categoryM.name,
                      onChanged: (value) => categoryM.name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obligatorio';
                        }
                      },
                    ),
                    TextButton.icon(
                        //style: ButtonStyle(backgroundColor:  ),
                        icon: const Icon(Icons.save_outlined,
                            size: 45, color: Colors.deepPurple),
                        label: const Text('Guardar',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 26)),
                        onPressed: service.isSaving
                            ? null
                            : () async {
                                if (categoryForm.isValidForm()) return;
                                await service.saveOrUpdateCategory(categoryM);
                                Navigator.of(context).pop();
                                const CategoriesPage();
                              }),
                    const SizedBox(
                      height: 30,
                    ),

                    TextButton.icon(
                        icon: const Icon(Icons.cancel_outlined,
                            size: 45, color: Colors.deepPurple),
                        onPressed: () => Navigator.of(context).pop(),
                        label: const Text('Cancelar', style: TextStyle(color: Colors.black54, fontSize: 26)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/* class _ProductForm extends StatelessWidget {
  final String? titlefield;
  final String? datafield;
 

  const _ProductForm({Key? key, this.titlefield, this.datafield})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(
          child: Column(
        children: [
          
        ],
      )),
    );
  }
}
 */