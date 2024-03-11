import 'package:equatable/equatable.dart';

sealed class PalmFarmResponse extends Equatable  {
  @override
  List<Object?> get props;
}


class PalmFarmPowerOffResponse extends PalmFarmResponse {

  PalmFarmPowerOffResponse({required this.isPowerOn});


  final bool isPowerOn;


  @override
  // TODO: implement props
  List<Object?> get props => [isPowerOn];
}

class PalmFarmCurrentStatusResponse extends PalmFarmResponse {
  PalmFarmCurrentStatusResponse({
    required this.currentTime,
    required this.currentMode,
    required this.pumpOnInterval,
    required this.pumpOffInterval,
    required this.ledOnTime,
    required this.ledOffTime,
    required this.ledStatus,
    required this.pumpStatus,
  });

  final String currentTime;
  final String currentMode;
  final String pumpOnInterval;
  final String pumpOffInterval;
  final String ledOnTime;
  final String ledOffTime;
  final String ledStatus;
  final String pumpStatus;

  @override
  List<Object?> get props => [currentTime, currentMode,pumpOnInterval,pumpOffInterval,ledOnTime,ledOffTime,ledStatus,pumpStatus];
}

class PalmFarmUnknownResponse extends PalmFarmResponse {
  PalmFarmUnknownResponse({required this.data});

  final String data;

  @override
  List<Object?> get props => [data];
}
