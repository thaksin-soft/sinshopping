import 'package:flutter/material.dart';

class MyConstant{
  //General
static String appName = 'SIN SHOPPING';

//Route
static String routeAuthen = '/authen';
static String routeCreateAccount = '/createAccount';
static String routeBuyerService = 'buyerService';
static String routeSaleService = 'salerService';
static String routeRiderService = 'riderService';


//image
static String image1 = 'images/LOGO.png';



//Color
static Color Primary = Color(0xff87861d);
static Color Dark = Color(0xff575900);
static Color Light = Color(0xffb9b6e4);


//Style
TextStyle h1Style()=>TextStyle(
  fontSize: 24,
  color: Dark,
  fontWeight: FontWeight.bold,

);
TextStyle h2Style()=>TextStyle(
  fontSize: 18,
  color: Dark,
  fontWeight: FontWeight.w700,

);
TextStyle h3Style()=>TextStyle(
  fontSize: 13,
  color: Dark,
  fontWeight: FontWeight.normal,

);


ButtonStyle sinButtonStyle() => ElevatedButton.styleFrom(
                primary: MyConstant.Primary,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              );


}