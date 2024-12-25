import 'package:firecrudapp/CustomeWidget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'CRUDOperationUi/homeScreen.dart';
import 'Dashboard/dashboard_screen.dart';
import 'const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Rectangular shape
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: 'Task One',
                        align: TextAlign.center,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: 'Firebase CRUD Operation',
                        align: TextAlign.center,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Task Two button press
                    Get.to(DashboardScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Rectangular shape
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: 'Task Two',
                        align: TextAlign.center,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: 'Dashboard UI',
                        align: TextAlign.center,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
