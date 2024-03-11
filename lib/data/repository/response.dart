sealed class PalmFarmResponse {
  @override
  List<Object?> get props;
}

// class PalmFarmCurrentResponse extends PalmFarmCurrentResponse{
//
// }

class PalmFarmUnknownResponse extends PalmFarmResponse {

  PalmFarmUnknownResponse({required this.data});

  final String data;

  @override
  List<Object?> get props => [data];
}
