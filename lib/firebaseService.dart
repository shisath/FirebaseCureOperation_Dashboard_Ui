import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customeWidget/snackBar.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var mainCollection = 'users';

  /// Create user
  void createPatient({
    required Map<String, dynamic> data,
    required String doc,
  }) async {
    try {
      await firestore.collection(mainCollection).doc(doc).set(data);

      SnackBarModel.show(Get.context!, 'User Create successfully',
          backgroundColor: Colors.green);
    } catch (e) {
      if (e is FirebaseException) {
        SnackBarModel.show(Get.context!, '${e.message}',
            backgroundColor: Colors.red);
      } else {
        SnackBarModel.show(Get.context!, e.toString(),
            backgroundColor: Colors.red);
      }
    }
  }

  ///Update user
  void updateUser({
    required Map<String, dynamic> data,
    required String doc,
  }) async {
    try {
      await firestore.collection('').doc(doc).update(data);

      SnackBarModel.show(Get.context!, 'User Update successfully',
          backgroundColor: Colors.green);
    } catch (e) {
      if (e is FirebaseException) {
        SnackBarModel.show(Get.context!, '${e.message}',
            backgroundColor: Colors.red);
      } else {
        SnackBarModel.show(Get.context!, e.toString(),
            backgroundColor: Colors.red);
      }
    }
  }

  Future<QuerySnapshot?> getUserList() async {
    try {
      QuerySnapshot res = await firestore.collection('users').get();

      return res;
    } catch (e) {
      if (e is FirebaseException) {
        SnackBarModel.show(Get.context!, '${e.message}',
            backgroundColor: Colors.red);
      } else {
        SnackBarModel.show(Get.context!, e.toString(),
            backgroundColor: Colors.red);
      }
      return null;
    }
  }

  ///Delete user
  void deleteUser({
    required String doc,
  }) async {
    try {
      await firestore.collection(mainCollection).doc(doc).delete();

      SnackBarModel.show(Get.context!, 'User Delete successfully',
          backgroundColor: Colors.green);
    } catch (e) {
      if (e is FirebaseException) {
        SnackBarModel.show(Get.context!, '${e.message}',
            backgroundColor: Colors.red);
      } else {
        SnackBarModel.show(Get.context!, e.toString(),
            backgroundColor: Colors.red);
      }
    }
  }
}
