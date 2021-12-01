import 'package:cupboard/services/categories_service.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBar(),
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              const CategorieCard()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[600],
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'addProduct'),
      ),
    );
  }
}

class CategorieCard extends StatelessWidget {
  const CategorieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesService = Provider.of<CategoriesService>(context);

    //if (categoriesService.isLoading) return LoadingPage();

    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      decoration: _cardBorder(),
      child: Stack(
        children: const [
          // TODO: Aca va el nombre de cada categoria
          CategoryName(name: 'Categories'),

          Positioned(
              top: 40,
              left: 30,
              child: EditeOption(
                titleOption: 'Edite',
                iconOption: Icons.edit,
              )),

          Positioned(
              top: 40,
              right: 30,
              child: EditeOption(
                titleOption: 'Delete',
                iconOption: Icons.delete,
              ))
        ],
      ),
    );
  }

  BoxDecoration _cardBorder() {
    return BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.grey, offset: Offset(0, 7), blurRadius: 10)
      ],
      // TODO: efecto de cirulos en este card
      /*  gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffFDF9FE),
          Color(0xffA11CDB),
        ]  
      ) */
    );
  }
}

class CategoryName extends StatelessWidget {
  final String name;

  const CategoryName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          //topLeft: Radius.circular(60)
        ),
        color: Colors.purple,
        //borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}

class EditeOption extends StatelessWidget {
  final IconData iconOption;
  final String titleOption;

  const EditeOption({
    Key? key,
    required this.iconOption,
    required this.titleOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        //color: Colors.red,
        width: 120,
        height: 50,
        child: Column(
          children: [
            Icon(iconOption),
            Text(titleOption),
          ],
        ),
      ),
    );
  }
}




/* class _BackGroundImage extends StatelessWidget {
  const _BackGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        //color: Colors.red,
        width: double.infinity,
        height: 100,
        child:const FadeInImage(
          fit: BoxFit.fitHeight,
          placeholder: AssetImage('assets/purple-loading.gif'),
          image:  AssetImage('assets/food-preview.png'),
        ),
      ),
    ); 
  }
} */