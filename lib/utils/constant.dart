import 'package:palmfarm/utils/dev_log.dart';

class Const {
  static LogLevel logLevel = LogLevel.v;
  static bool useProxy = false;
  static String proxyAddress = "192.168.206.119:8888";
}

const String serviceUuid = "21408141-1fb5-459e-8fcc-c5c9c2140814";
const String writeUuid = "2140814e-36e1-4688-b7f5-ea0732140814";
const String notifyUuid = "2140814e-36e1-4688-b7f5-ea0732140814";

const dialog_disconnect_title = "팜팜 이지 기기와의 연결이 실패했습니다.\n다음과 같이 상황을 확인해보세요.";
const dialog_disconnect_content = "1.휴대폰의 블루투스 기능이 켜져 있는지\n2.팜팜이지 기기 전원이 켜져 있는지\n3.기기와 휴대폰의 거리가 너무 멀리 떨어져 있거나,장애물이 있는지";
