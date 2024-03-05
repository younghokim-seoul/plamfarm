

sealed class ConnectionUiState {}

class Idle extends ConnectionUiState {}
class Connected extends ConnectionUiState {}
class Disconnected extends ConnectionUiState {}
class Error extends ConnectionUiState {}
