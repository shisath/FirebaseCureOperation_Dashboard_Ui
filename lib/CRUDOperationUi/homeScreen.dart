import 'package:firecrudapp/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../customeWidget/buttonWidget.dart';
import '../customeWidget/detailsColumnWidget.dart';
import '../customeWidget/iconButton.dart';
import '../customeWidget/textFormField.dart';
import '../firebaseService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirestoreService firebase = FirestoreService();
  @override
  void initState() {
    controller.fetchUser();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase CRUD Operation'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Create User",
                  backgroungColor: Colors.green,
                  onPressed: () async {
                    _showDialog(context);
                  },
                  icon: Icons.add,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: "Read",
                  backgroungColor: Colors.blue,
                  icon: Icons.download,
                  onPressed: () async {
                    controller.fetchUser();
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Expanded(
              child: controller.isLoading
                      .value // Use an observable to manage loading state
                  ? const Center(
                      child:
                          CircularProgressIndicator(), // Loader when fetching data
                    )
                  : controller.userList.isEmpty // Check if the list is empty
                      ? const Center(
                          child: Text(
                            'No users found',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.userList.length,
                          itemBuilder: (context, index) {
                            final users = controller.userList[index];

                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              color: Colors.grey.shade300,
                              child: ListTile(
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DetailColumn(
                                      label: 'Name',
                                      value: users['name'] ?? 'N/A',
                                    ),
                                    DetailColumn(
                                      label: 'Age',
                                      value: users['age']?.toString() ?? 'N/A',
                                    ),
                                    DetailColumn(
                                      label: 'Place',
                                      value: users['place'] ?? 'N/A',
                                    ),
                                    DetailColumn(
                                      label: 'Phone',
                                      value: users['phoneNumber'] ?? 'N/A',
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize
                                      .min, // Ensures the Row takes up minimal space

                                  children: [
                                    IconButtonModel(
                                      onDelete: () {
                                        controller.populateControllers(users);
                                        _showDialog(context,
                                            userId: users['name']);
                                      },
                                      Tooltip: 'Edit',
                                      icon: Icons.edit,
                                      iconColor: Colors.black45,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    IconButtonModel(
                                      onDelete: () {
                                        controller.deleteUser(users['name']);
                                      },
                                      Tooltip: 'Delete',
                                      icon: Icons.delete,
                                      iconColor: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }

  /// Form
  void _showDialog(BuildContext context, {String? userId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();

        return AlertDialog(
          title: Text('Fill the Details'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    length: 30,
                    controller: controller.nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                    labelText: 'Name',
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    length: 3,
                    controller: controller.ageController,
                    keyboardType: TextInputType.number,
                    labelText: "Age",
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an age' : null,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    length: 20,
                    controller: controller.placeController,
                    labelText: "Place",
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a place' : null,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    length: 10,
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    labelText: 'Phone Number',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a phone number' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.clearController();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Handle form submission
                  userId == null
                      ? controller.createUser()
                      : controller.updateUser();

                  Navigator.pop(context);
                }
              },
              child: Text(userId != null ? 'Update' : ' Create'),
            ),
          ],
        );
      },
    );
  }
}
