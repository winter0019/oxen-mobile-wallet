class SetupWalletException implements Exception {
  SetupWalletException({required this.message});
  
  final String message;

  @override
  String toString() => message;
}
