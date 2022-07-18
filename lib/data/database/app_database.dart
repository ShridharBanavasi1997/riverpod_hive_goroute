import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';
import 'package:riverpod_sample/data/model/state_model.dart';

import 'daos/state_data_daos.dart';
import 'models/state_data.dart';

class AppDatabase {
  AppDatabase();
  late SateDataDao stateDataDao;

  late final HiveAesCipher _hiveAesCipher;

  final String secureStorageHiveKey = "yd_encryption_key";

  /// Helper which generates and saves the generated encryption to [FlutterSecureStorage]
  Future<List<int>> _setUpHiveEncryptionKey() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage(iOptions:IOSOptions(accessibility: IOSAccessibility.first_unlock));
    // Read the existing hive encryption key
    String? base64Encoded = await secureStorage.read(key: secureStorageHiveKey);
    // If it exists just return the same
    if (base64Encoded != null) return base64Url.decode(base64Encoded);
    // else generate a encryption key and stores it to secure storage
    List<int> generatedEncryptionKey = Hive.generateSecureKey();

    await secureStorage.write(
      key: secureStorageHiveKey,
      value: base64UrlEncode(generatedEncryptionKey),
    );

    return generatedEncryptionKey;
  }

  Future<void> initialize() async{
      Hive.init((await getApplicationSupportDirectory()).path);

      Hive.registerAdapter(StateDataAdapter());

      _hiveAesCipher = HiveAesCipher(await _setUpHiveEncryptionKey());

      stateDataDao = SateDataDao(await Hive.openBox<StateData>(StateData.hiveBoxName,encryptionCipher: _hiveAesCipher));
  }





}