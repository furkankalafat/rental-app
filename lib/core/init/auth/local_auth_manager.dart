import 'package:get/route_manager.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthManager {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<void> authenticate() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      if (canCheckBiometrics) {
        bool didAuthenticate = await _auth.authenticate(
            localizedReason: "Use biometric to authenticate",
            options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              biometricOnly: true,
            ));
        if (didAuthenticate) {
          Get.offAndToNamed("/home");
        }
      } else {
        //TODO device not supported biometrics.

        print("not supported");
      }
    } catch (e) {}
  }
}
