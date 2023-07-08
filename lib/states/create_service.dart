import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sinshopping/utility/my_constant.dart';
import 'package:sinshopping/widgets/show_image.dart';
import 'package:sinshopping/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  File? file;
  @override
  void initState(){
    super.initState();
    findLating();
  }

    Future<Null> findLating() async{
      bool locationService;
      LocationPermission locationPermission;

      locationService = await Geolocator.isLocationServiceEnabled();
      if(locationService) {
        print('Service Location Open');
      }else{
        print('Service Location Close');
      }

    }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            width: size * 0.6,
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: MyConstant().h3Style(),
                labelText: 'Name :',
                prefixIcon: Icon(
                  Icons.fingerprint,
                  color: MyConstant.Dark,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Dark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Light),
                ),
              ),
            )),
      ],
    );
  }

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            width: size * 0.6,
            child: TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelStyle: MyConstant().h3Style(),
                labelText: 'Address :',
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Icon(
                    Icons.home,
                    color: MyConstant.Dark,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Dark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Light),
                ),
              ),
            )),
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            width: size * 0.6,
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: MyConstant().h3Style(),
                labelText: 'Phone :',
                prefixIcon: Icon(
                  Icons.phone,
                  color: MyConstant.Dark,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Dark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Light),
                ),
              ),
            )),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            width: size * 0.6,
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: MyConstant().h3Style(),
                labelText: 'User :',
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: MyConstant.Dark,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Dark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Light),
                ),
              ),
            )),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            width: size * 0.6,
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: MyConstant().h3Style(),
                labelText: 'Password :',
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: MyConstant.Dark,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Dark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: MyConstant.Light),
                ),
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
        backgroundColor: MyConstant.Primary,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildTitle('ຂໍ້ມູນທົ່ວໄປ'),
            buildName(size),
            buildTitle('ຊະນິດຂອງ User :'),
            buildRadioBuyer(),
            buildRadioSeller(),
            buildRadioRider(),
            buildAddress(size),
            buildPhone(size),
            buildUser(size),
            buildPassword(size),
            buildTitle('ຮູບພາບ'),
            buildSubtitle(),
            buildAvatar(size),
          ],
        ),
      ),
    );
  }

  Future<Null> chooseimage(ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseimage(ImageSource.camera),
          icon: Icon(
            Icons.add_a_photo,
            size: 36,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: file == null
              ? ShowImage(path: MyConstant.avatar)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseimage(ImageSource.gallery),
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36,
            color: MyConstant.Dark,
          ),
        ),
      ],
    );
  }

  ShowTitle buildSubtitle() {
    return ShowTitle(
      title:
          'ເປັນຮູບພາຍທີ່ສະແດງຄວາມເປັນຕົວຕົນຂອງ User (ຖ້າບໍ່ໃສ່ແມ່ນເຮົາກະປ່ຽນເປັນຮູບແບບ Default ແທນ)',
      textStyle: MyConstant().h3Style(),
    );
  }

  RadioListTile<String> buildRadioBuyer() {
    return RadioListTile(
      value: 'buyer',
      groupValue: typeUser,
      onChanged: (value) {},
      title:
          ShowTitle(title: 'ຜູ້ຊື້ (Buyer)', textStyle: MyConstant().h3Style()),
    );
  }

  RadioListTile<String> buildRadioSeller() {
    return RadioListTile(
      value: 'seller',
      groupValue: typeUser,
      onChanged: (value) {},
      title: ShowTitle(
          title: 'ຜູ້ຂາຍ (Seller)', textStyle: MyConstant().h3Style()),
    );
  }

  RadioListTile<String> buildRadioRider() {
    return RadioListTile(
      value: 'rider',
      groupValue: typeUser,
      onChanged: (value) {},
      title: ShowTitle(
          title: 'ຜູ້ສົ່ງເຄື່ອງ (rider)', textStyle: MyConstant().h3Style()),
    );
  }

  Container buildTitle(title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h3Style(),
      ),
    );
  }
}
