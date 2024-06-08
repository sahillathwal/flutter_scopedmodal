import 'package:scoped_guide/scoped_model/base_model.dart';

class SuccessModel extends BaseModel {
  String title = "No Title Set Yet";

  Future fetchDuplicatedText(String text) async {
    setState(ViewState.busy);
    await Future.delayed(const Duration(seconds: 2));
    title = "$text $text";
    setState(ViewState.retrieved);
  }
}
