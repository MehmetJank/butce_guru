import 'package:connectivity_plus/connectivity_plus.dart';

Future<String> checkConnectionStatus() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return 'Mobil veri kullanıyor';
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return 'Wi-Fi kullanıyor';
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    return 'Ethernet kullanıyor';
  } else if (connectivityResult == ConnectivityResult.vpn) {
    return 'VPN kullanıyor';
  } else if (connectivityResult == ConnectivityResult.bluetooth) {
    return 'Bluetooth kullanıyor';
  } else if (connectivityResult == ConnectivityResult.none) {
    return 'Herhangi bir ağa bağlı değil';
  } else {
    return 'Bağlantı durumu bilinmiyor';
  }
}
