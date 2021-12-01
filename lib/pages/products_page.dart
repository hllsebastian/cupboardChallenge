import 'package:cupboard/widgets/generic_list.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class ProducstPage extends StatelessWidget {
  const ProducstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericList(
      listTitle: 'Products',
    );
  }
}
