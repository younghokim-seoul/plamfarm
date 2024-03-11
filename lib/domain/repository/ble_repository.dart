import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/request.dart';
import 'package:palmfarm/data/repository/response.dart';

abstract class BleRepository {
  void startScan();

  Future<void> stopScan();

  Future<void> connect(String address);

  Future<void> disconnect();

  Future<PalmFarmResponse> write(Request request);

  void addChannelListener(String tag, BleChannelListener listener);

  void removeChannelListener(String tag);

  void removeAllChannelListener();
}
