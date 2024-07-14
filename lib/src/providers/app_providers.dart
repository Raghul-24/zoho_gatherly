import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/services/connectivity_service_provider.dart/data_connection_checker.dart';

enum ConnectionStatus { connected, disconnected }

class AppProvider with ChangeNotifier {
  late DataConnectionChecker _dataConnectionChecker;
  bool? _isConnected;
  internetConnectionProvider() {
    _dataConnectionChecker = DataConnectionChecker();
    _isConnected = true;

    _dataConnectionChecker.onStatusChange.listen((status) {
      _isConnected = status == DataConnectionStatus.connected;
      notifyListeners();
    });
  }

  bool get isConnected => _isConnected ?? false;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
