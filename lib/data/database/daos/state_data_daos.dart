import 'package:hive/hive.dart';
import 'package:riverpod_sample/data/database/models/state_data.dart';

class SateDataDao{
  SateDataDao(this._stateDataBox);
  final Box<StateData> _stateDataBox;

  static String hiveBoxName = "State";
  static String Key = "sateStorage";

  void addState(StateData data){
    clear();
    _stateDataBox.put(Key,data);
  }

  StateData? getState(){
    return _stateDataBox.get(Key);
  }

  void clear() async {
    await _stateDataBox.clear();
  }

}