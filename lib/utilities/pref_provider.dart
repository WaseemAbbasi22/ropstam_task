import '../data/base/base_vm.dart';

class PreferencesProvider extends BaseVm {
  bool _userAuthStatus = false;
  String _userName = "";
  get userAuthStatus => _userAuthStatus;

  String get userName => _userName;

  setUserAuthStatusInProvider(bool authStatus) {
    _userAuthStatus = authStatus;
    notifyListeners();
  }

  setUserNameInProvider(String userName) {
    _userName = userName;
    notifyListeners();
  }

  resetUsersData() {
    _userAuthStatus = false;
    _userName = "";
  }
}