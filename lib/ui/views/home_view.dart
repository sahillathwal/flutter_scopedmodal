// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_states.dart';
import 'package:scoped_guide/scoped_model/home_model.dart';
import 'package:scoped_guide/ui/views/base_view.dart';
import 'package:scoped_guide/ui/views/error_view.dart';
import 'package:scoped_guide/ui/views/success_view.dart';
import 'package:scoped_guide/ui/widgets/busy_overlay.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) => BusyOverlay(
        show: model.state == ViewState.busy,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var result = await model.saveData();
              if (result) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SuccessView(title: "Success")),
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ErrorView()));
              }
            },
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _getBodyUi(model.state),
                Text(model.title),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBodyUi(ViewState? state) {
    switch (state) {
      case ViewState.busy:
        return const CircularProgressIndicator();
      case ViewState.retrieved:
      default:
        return const Text('Done');
    }
  }
}
