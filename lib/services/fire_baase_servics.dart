class FirebaseStoreServices {
  static FirebaseStoreServices? _firebaseStoreServices;
  FirebaseStoreServices._internal();
  factory FirebaseStoreServices(){
    return _firebaseStoreServices ??=FirebaseStoreServices._internal();
  }
  
}