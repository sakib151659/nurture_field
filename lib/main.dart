import 'package:flutter/material.dart';
import 'package:nurture_field/screens/splash/splash_screen.dart';
import 'package:nurture_field/utils/app_constants.dart';
import 'package:nurture_field/utils/local_storage_manager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final isOnBoardingCompleted = await LocalStorageManager.readData(AppConstant.isOnBoardingCompleted)??false;
  runApp(MyApp(isOnBoardingCompleted: isOnBoardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool ?isOnBoardingCompleted;
  const MyApp({super.key, this.isOnBoardingCompleted});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nurture Field',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(isOnBoardingCompleted: isOnBoardingCompleted!),
    );
  }
}



