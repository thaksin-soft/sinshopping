import 'package:flutter/material.dart';
import 'package:sinshopping/utility/my_constant.dart';
import 'package:sinshopping/widgets/show_image.dart';
import 'package:sinshopping/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            buildImage(size),
            buildAppName()
          ],
        ),
      ),
    );
  }

  Row buildAppName() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTitle(title: MyConstant.appName, textStyle: MyConstant().h1Style(),
              ),
            ],
          );
  }

  Row buildImage(double size) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: size*0.6,
            child: ShowImage(path: MyConstant.image1),
            ),
      ],
    );
  }
}
