import 'package:flutter/material.dart';
import 'package:scoped_guide/scoped_model/error_model.dart';

import 'base_view.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ErrorModel>(
        builder: (context, child, model) => Scaffold(
              body: Center(
                child: Text(runtimeType.toString()),
              ),
            ));
  }
}
