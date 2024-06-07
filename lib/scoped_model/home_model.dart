import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_guide/services/storage_service.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeModel extends Model {
  StorageService storageService = locator<StorageService>();

  String title = "HomeModel";

  Future saveData() async {
    setTitle("Saving Data");
    await storageService.saveData();
    setTitle("Data Saved");
  }

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }
}
