import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/repository/ble_channel_listener.dart';
import 'package:palmfarm/data/repository/request.dart';
import 'package:palmfarm/data/repository/response.dart';

abstract class BleRepository {
  void startScan();

  void scanFilter(List<PalmFarmDevice> filters);

  Future<void> stopScan();

  Future<void> connect(String address);

  Future<void> disconnect({int code = 0});

  Future<PalmFarmResponse> write(Request request);

  void addChannelListener(String tag, BleChannelListener listener);

  void removeChannelListener(String tag);

  void removeAllChannelListener();
}
