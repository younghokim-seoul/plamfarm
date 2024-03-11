import 'package:palmfarm/data/repository/response.dart';
import 'package:palmfarm/utils/dev_log.dart';

class PalmFarmResponseParseException implements Exception {
  const PalmFarmResponseParseException(this.cause, this.stackTrace);
  final dynamic cause;
  final StackTrace stackTrace;
}

const queryCurrentStatus = 'AAQS';

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

    if (data.startsWith(queryCurrentStatus)) {
      final values = data.substring(queryCurrentStatus.length);
      Log.d(":::데이터는?? " + values.toString());

      String currentTime = values.substring(0,6);
      Log.i(":::currentTime " + currentTime);
      String currentMode = values.substring(7,9);
      Log.i(":::currentMode " + currentMode);
      String pumpInterval = values.substring(0,6);

    }
    return PalmFarmUnknownResponse(data: data);
  }catch (e, t) {
    throw PalmFarmResponseParseException(e, t);
  }
}