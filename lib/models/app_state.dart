import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:localstorage/localstorage.dart';

import 'package:whollet/classes/stateApp.dart';

part 'app_state.g.dart';

class InitProvider extends ChangeNotifier {
  InitState _state;
  final String _stateKey = 'state';
  final _storage = LocalStorage('Init-State');

  void init() async {
    await _storage.ready;
    final _data = _storage.getItem((_stateKey));
    try {
      if (_data != null) {
        _state = await _fetchState(_data);
      }
    } catch (e) {
      print('Error Loading Task State:$e');
    }
    if (_data == null) {
      _state = InitState(state: []);
    }
    notifyListeners();
  }

  List<StateApp> get stateApp => _state?.state;

  void AddState(StateApp value) {
    _state.state.add(value);
    notifyListeners();
    _saveState();
  }

  void EditState(int index, StateApp value) {
    _state.state[index] = value;
    notifyListeners();
    _saveState();
  }

  void DeleteState(int index) {
    _state.state.removeAt(index);
    notifyListeners();
    _saveState();
  }

  void clearAll() {
    _state.state.clear();
    notifyListeners();
    _saveState();
  }

  void _saveState() async => await _storage.setItem(_stateKey, _state.toJson());
}

Future<InitState> _fetchState(Map<String, dynamic> data) async {
  final _data = json.encode(data);
  return compute(_parseState, _data);
}

InitState _parseState(String data) {
  return InitState.fromJson(json.decode(data));
}

@JsonSerializable(nullable: false, explicitToJson: true)
class InitState {
  InitState({this.state});

  factory InitState.fromJson(Map<String, dynamic> json) =>
      _$InitStateFromJson(json);

  List<StateApp> state;

  Map<String, dynamic> toJson() => _$InitStateToJson(this);
}
