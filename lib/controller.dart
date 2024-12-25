import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'firebaseService.dart';

class CurdController extends GetxController {
  FirestoreService firebase = FirestoreService();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  var isLoading = false.obs;
  RxList<dynamic> userList = [].obs;

  clearController() {
    nameController.clear();
    ageController.clear();
    phoneNumberController.clear();
    placeController.clear();
  }

  void createUser() {
    firebase.createPatient(doc: nameController.text, data: {
      "name": nameController.text,
      "age": ageController.text,
      "place": placeController.text,
      "phoneNumber": phoneNumberController.text,
    });
    fetchUser();
    clearController();
  }

  void fetchUser() async {
    isLoading.value = true;
    dynamic res = await firebase.getUserList();
    userList.clear();
    for (var doc in res.docs) {
      final userData = doc.data() as Map<String, dynamic>;
      userList.add(userData);
    }

    isLoading.value = false;
  }

  void populateControllers(Map<String, dynamic> user) {
    nameController.text = user['name'] ?? '';
    ageController.text = user['age']?.toString() ?? '';
    placeController.text = user['place'] ?? '';
    phoneNumberController.text = user['phoneNumber'] ?? '';
  }

  updateUser() {
    firebase.updateUser(data: {
      "name": nameController.text,
      "age": ageController.text,
      "place": placeController.text,
      "phoneNumber": phoneNumberController.text,
    }, doc: nameController.text);

    fetchUser();
  }

  void deleteUser(String docId) {
    firebase.deleteUser(
      doc: docId,
    );

    fetchUser();
  }
}
