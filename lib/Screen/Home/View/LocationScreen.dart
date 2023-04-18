import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/Screen/Home/Controllor/LocationControllor.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationControllor locationControllor = Get.put(
    LocationControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // body: GoogleMap(
        //   initialCameraPosition: CameraPosition(
        //     target: LatLng(
        //         locationControllor.lat.value, locationControllor.lon.value),
        //     bearing: 192.8334901395799,
        //     zoom: 19.151926040649414,
        //   ),
        // ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);

                  locationControllor.lat.value = position.latitude;
                  locationControllor.lon.value = position.longitude;
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: Text(
                    "Location",
                    style: GoogleFonts.lancelot(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Obx(
                () => Text(
                  "${locationControllor.lat}",
                  style: GoogleFonts.lancelot(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => Text(
                  "${locationControllor.lon}",
                  style: GoogleFonts.lancelot(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  List<Placemark> placemarks = await placemarkFromCoordinates(locationControllor.lat.value,locationControllor.lon.value);

                  locationControllor.locatioList.value = placemarks;
                },
                child: Container(
                  height: 50,
                  width: 150,
                  child: Text(
                    "Your Location",
                    style: GoogleFonts.lancelot(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Obx(
                    () => Text(
                      locationControllor.locatioList.value.isEmpty?"":
                  "${locationControllor.locatioList[0]}",
                  style: GoogleFonts.lancelot(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
