import 'package:whollet/redux/actions/index.dart';
import 'package:whollet/models/app_state.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  switch (action) {
    case ActionLogin:
      newState.login = action.payload;
      break;
    default:
  }
}
