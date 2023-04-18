import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationControllor extends GetxController{

  RxDouble lon = 0.0.obs;
  RxDouble lat = 0.0.obs;

  RxList<Placemark> locatioList = <Placemark>[].obs;


}