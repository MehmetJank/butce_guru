import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionInfo {
  String? status;
  Icon? icon;

  ConnectionInfo({this.status, this.icon});
}

Future<ConnectionInfo> getConnectionInfo() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile) {
    return ConnectionInfo(
      status: 'Mobil veri kullanıyor',
      icon: const Icon(Icons.cell_tower),
    );
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return ConnectionInfo(
      status: 'Wi-Fi kullanıyor',
      icon: const Icon(Icons.wifi),
    );
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    return ConnectionInfo(
      status: 'Ethernet kullanıyor',
      icon: const Icon(Icons.settings_ethernet),
    );
  } else if (connectivityResult == ConnectivityResult.vpn) {
    return ConnectionInfo(
      status: 'VPN kullanıyor',
      icon: const Icon(Icons.vpn_key),
    );
  } else if (connectivityResult == ConnectivityResult.bluetooth) {
    return ConnectionInfo(
      status: 'Bluetooth kullanıyor',
      icon: const Icon(Icons.bluetooth_audio),
    );
  } else if (connectivityResult == ConnectivityResult.none) {
    return ConnectionInfo(
      status: 'Herhangi bir ağa bağlı değil',
      icon: const Icon(Icons.signal_wifi_connected_no_internet_4),
    );
  } else {
    return ConnectionInfo(
      status: 'Bağlantı durumu bilinmiyor',
      icon: const Icon(Icons.device_unknown),
    );
  }
}
