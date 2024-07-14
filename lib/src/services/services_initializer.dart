
import 'local_storage/key_value_storage_base.dart';


class ServicesInitializer{
ServicesInitializer();

  Future<void> init() async {
await _initKeyValueStorage();

  }
Future<void> _initKeyValueStorage() async {
    await KeyValueStorageBase.init();
  }
}