import 'package:flutter/material.dart';
import 'package:sinshopping/states/authen.dart';
import 'package:sinshopping/states/buyer_service.dart';
import 'package:sinshopping/states/create_service.dart';
import 'package:sinshopping/states/rider_service.dart';
import 'package:sinshopping/states/saler_service.dart';
import 'package:sinshopping/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  'buyerService': (BuildContext context) => BuyerService(),
  'salerService': (BuildContext context) => SalerService(),
  'riderService': (BuildContext context) => RiderService(),
};

String? initialRoute;

void main(){
  initialRoute = MyConstant.routeAuthen;
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initialRoute,
    );
  }
}