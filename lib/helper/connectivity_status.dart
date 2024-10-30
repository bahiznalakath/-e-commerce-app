import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> connectivityStatus() async {
  bool connected = false;
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    connected = true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    connected = true;
  }
  return connected;
}
