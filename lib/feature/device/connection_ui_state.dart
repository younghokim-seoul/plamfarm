sealed class ConnectionUiState {}

class Idle extends ConnectionUiState {}

class Connected extends ConnectionUiState {}

class Disconnected extends ConnectionUiState {
  Disconnected({required this.code});

  final int code;
}

class Error extends ConnectionUiState {}
