import 'package:palmfarm/data/repository/response.dart';
import 'package:palmfarm/utils/dev_log.dart';

class PalmFarmResponseParseException implements Exception {
  const PalmFarmResponseParseException(this.cause, this.stackTrace);

  final dynamic cause;
  final StackTrace stackTrace;
}

class PalmFarmPowerOffException implements Exception {
  const PalmFarmPowerOffException(this.cause, this.stackTrace);

  final dynamic cause;
  final StackTrace stackTrace;
}

const queryCurrentStatus = 'AAQS';
const setCurrentTime = 'AACT';
const setGrowingMode = 'AAMD';
const setLedMode = 'AALM';
const setLedOnTime = 'AALS';
const setLedOffTime = 'AALE';
const setLedOn = 'AALN';
const setLedOff = 'AALF';
const setPumpDuration = 'AAPD';
const setPumpOn = 'AAPN';
const setPumpOff = 'AAPF';

const setPowerOn = 'AAON';


const powerOff = 'AAMD00';

PalmFarmResponse parseResponse(String data) {
  try {
    //1302540205150730213010
    //130254
    //02
    //0515
    //0730
    //2130
    //1
    //0

    //0702070010200700
    //0707360110200700

    if(data.startsWith(setCurrentTime)){
      Log.d(":::setCurrentTime data " + data);
      return PalmFarmSetCurrentTimeResponse(data: data);
    }

    Log.d(":::..data " + data);
    Log.d(":::..data SIZE " + data.length.toString());
    if (data.startsWith(queryCurrentStatus)) {
      final values = data.substring(queryCurrentStatus.length);

      final String growingMode = values.substring(6, 8);

      if (growingMode == "00") {
        return PalmFarmPowerOffResponse(isPowerOn: false);
      } else {
        return PalmFarmCurrentStatusResponse(
          currentTime: values.substring(0, 6),
          currentMode: values.substring(6, 8),
          pumpOnInterval: values.substring(8, 10),
          pumpOffInterval: values.substring(10, 12),
          ledOnTime: values.substring(12, 16),
          ledOffTime: values.substring(16, 20),
          ledStatus: values.substring(20, 21),
          pumpStatus: values.substring(21, 22),
        );
      }
    }
    if(data.startsWith(setPowerOn)){
      return PalmFarmPowerOffResponse(isPowerOn: true);
    }

    if(data.startsWith(setGrowingMode) || data.startsWith(powerOff)){
      Log.d(":::growing parse => " + data);
      return PalmFarmSetGrowingModeResponse(data: data, isSet: data == powerOff ? false : true);
    }
    return PalmFarmUnknownResponse(data: data);
  } catch (e, t) {
    Log.d(":::parseResponse error.... " + e.toString());
    throw PalmFarmResponseParseException(e, t);
  }
}




