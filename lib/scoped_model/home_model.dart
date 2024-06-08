import 'package:scoped_guide/scoped_model/base_model.dart';
import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_guide/services/storage_service.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();

  String title = "HomeModel";

  Future<bool> saveData() async {
    setState(ViewState.busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data Saved";
    setState(ViewState.retrieved);

    return true;
  }
}
