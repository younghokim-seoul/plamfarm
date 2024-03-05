import 'package:palmfarm/data/repository/ble_channel_listener.dart';

abstract class BleRepository {
  void startScan();

  Future<void> stopScan();

  Future<void> connect(String address);

  Future<void> disconnect();

  void addChannelListener(String tag, BleChannelListener listener);

  void removeChannelListener(String tag);

  void removeAllChannelListener();
}
