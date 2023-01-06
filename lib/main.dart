import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zylu_task/controller/add_employee_controller.dart';
import 'package:zylu_task/controller/home_controller.dart';
import 'package:zylu_task/model/employee_model.dart';
import 'package:zylu_task/utils/employee_status.dart';
import 'package:zylu_task/view/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(EmployeeModelAdapter().typeId)) {
    Hive.registerAdapter(EmployeeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(EmployeeStatusAdapter().typeId)) {
    Hive.registerAdapter(EmployeeStatusAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => AddEmployeeController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
