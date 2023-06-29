import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  getGames() {
    return firebaseFirestore.collection('games').doc();
  }

  getChats(String id, String friendId) {
    return firebaseFirestore
        .collection('chats')
        .where(friendId, isGreaterThanOrEqualTo: friendId);
  }

  addChats(String id, String friendId, String message) {
    return firebaseFirestore
        .collection('chats')
        .add({id: id, friendId: friendId, message: message});
  }

  Map<String, dynamic> notifications(String id) {
    return {};
  }

  registerIntheGame(String gameId,String userId) {
    final remainingSlots = findRemainingSlotsInGame(gameId);
    if(remainingSlots !=0){
      //process the payment if successful continue registering
      
      //register user in the game
    }
    //FirebaseFirestore.collection('game').doc(id).update();
  }

  int findRemainingSlotsInGame(String id) {
    return 0;
  }
}
