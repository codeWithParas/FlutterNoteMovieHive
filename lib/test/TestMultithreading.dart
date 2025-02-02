

void main() {

  // Phone thread is running
  print("--------1 HIT SERVER FROM PHONE MAIN THREAD ------");
  hitNetworkAPI();
  print("--------3 PHONE MAIN THREAD TERMINATES ------");
}

// Network Server Call
void hitNetworkAPI() async {
  print("--------2 SWITCH TO SERVER or DIFFERENT THREAD ------");
  String output = await downloadFileFromDummyNetwork();
  print("OUTPUT ----- $output");
  print("--------4 SERVER THREAD TERMINATES ------");
}

// Server
Future<String> downloadFileFromDummyNetwork() {
  Future<String> objectFuture = Future.delayed(const Duration(seconds: 10), () {
    return "My File Content";
  });

  return objectFuture;
}