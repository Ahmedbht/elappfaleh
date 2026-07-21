import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> signup({
    required String email,
    required String password,
    required String fullName,
    String? phone,
    required String accountType,
  }) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.signup(
        email: email,
        password: password,
        fullName: fullName,
        phone: phone,
        accountType: accountType,
      );
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceAll("Exception: ", "");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.login(email: email, password: password);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceAll("Exception: ", "");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}