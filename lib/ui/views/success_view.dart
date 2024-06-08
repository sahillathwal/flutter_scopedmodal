import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_states.dart';
import 'package:scoped_guide/scoped_model/success_model.dart';
import 'package:scoped_guide/ui/widgets/busy_overlay.dart';

import 'base_view.dart';

class SuccessView extends StatelessWidget {
  // const SuccessView({super.key});

  final String? title;

  const SuccessView({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return BaseView<SuccessModel>(
        onModelReady: (modal) => modal.fetchDuplicatedText(title!),
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.busy,
              child: Scaffold(
                body: Center(
                  child: Text(model.title),
                ),
              ),
            ));
  }
}
