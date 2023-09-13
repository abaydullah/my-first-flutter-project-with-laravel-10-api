
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/providers/AuthProvider.dart';
import 'package:my_first_flutter_app/providers/TransactionProvider.dart';
import 'package:my_first_flutter_app/screens/categories.dart';
import 'package:my_first_flutter_app/screens/home.dart';
import 'package:my_first_flutter_app/screens/login.dart';
import 'package:my_first_flutter_app/screens/register.dart';

import 'package:my_first_flutter_app/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(builder: (context, authProvider,child){
        return MultiProvider(
            providers: [
              ChangeNotifierProvider<CategoryProvider>(
                  create: (context) => CategoryProvider(authProvider)),
              ChangeNotifierProvider<TransactionProvider>(
                  create: (context) => TransactionProvider(authProvider)),
            ],
            child: MaterialApp(
              title: 'Welcome To Flutter',
              routes: {
                '/' : (context){
                  final authProvider = Provider.of<AuthProvider>(context);
                  if(authProvider.isAuthenticated){
                    return Home();
                  }else{
                    return Login();
                  }
                },
                '/login' : (context) => Login(),
                '/register' : (context) => Register(),
                '/categories' : (context) => Categories(),

              },
            )
        );
      }),

    );
  }
}