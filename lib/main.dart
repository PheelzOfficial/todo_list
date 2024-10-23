import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider_todo_list.dart';
import 'package:todo_list/providers/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Register',
            home: ProviderTodoList(),
          );
        });
  }
}
