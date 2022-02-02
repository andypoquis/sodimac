import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/bottomappbar_controller.dart';

class BottomappbarPage extends GetView<BottomappbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Text('BottomappbarController'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          mini: true,
        ));
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
            )
          ],
        ));
  }
}
