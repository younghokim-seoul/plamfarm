abstract class BlePacket{
  String get header;
  String get body;

  String get command => header + body;
}

class QueryCurrentStatus extends BlePacket{
  @override
  String get header => "AA";

  @override
  String get body => "PN";
}