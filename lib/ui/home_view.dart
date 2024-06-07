import 'package:flutter/material.dart';
import 'package:scoped_guide/scoped_model/home_model.dart';
import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: locator<HomeModel>(),
      child: ScopedModelDescendant<HomeModel>(
        builder: (context, child, model) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.saveData();
            },
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: Text(model.title),
          ),
        ),
      ),
    );
  }
}
