import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/Screen/Home/View/LocationScreen.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => LocationScreen(),
      },
    ),
  );
}