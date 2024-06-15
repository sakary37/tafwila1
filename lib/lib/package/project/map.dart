import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {

  static const String routeName="map";

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  List<Marker> markers = [];
  StreamSubscription<Position>? positionStream;

  GoogleMapController? gmc;
  CameraPosition cameraPosition =
  CameraPosition(target: LatLng(26.644390, 29.658293), zoom: 5);

  initalstream() async {
    bool serviceEnabled;
    LocationPermission premission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("service location not enable");
      return;
    }
    premission = await Geolocator.checkPermission();
    if (premission == LocationPermission.denied) {
      premission = await Geolocator.requestPermission();
      if (premission == LocationPermission.denied) {
        return Future.error("LocationPermission are denied");
      }
    }
    if (premission == LocationPermission.whileInUse) {
      positionStream =
          Geolocator.getPositionStream().listen((Position? position) {
            markers.add(Marker(
                markerId: MarkerId("1"),
                position: LatLng(position!.latitude, position.longitude)));
            gmc!.animateCamera(CameraUpdate.newLatLng(
                LatLng(position.latitude, position.longitude)));
            setState(() {});
          });
    }
  }

  @override
  void initState() {
    initalstream();
    super.initState();
  }

  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("map")),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: GoogleMap(
                    onTap: (LatLng latLng) async {
                      List<Placemark> placemarks = await placemarkFromCoordinates(
                          latLng.latitude, latLng.longitude);
                      print("================================================");
                      print(placemarks[0].country);
                      print(placemarks[0].street);
                      print(placemarks[0].locality);
                      print(placemarks[0].postalCode);
                      print(placemarks[0].administrativeArea);
                      // print("===============================");
                      // print(latLng.latitude);
                      // print(latLng.longitude);

                      // print("===============================");
                      // markers.add(Marker(
                      //     markerId: MarkerId("1"),
                      //     position: LatLng(latLng.latitude, latLng.longitude)));
                      // setState(() {});
                    },
                    markers: markers.toSet(),
                    initialCameraPosition: cameraPosition,
                    mapType: MapType.normal,
                    onMapCreated: (MapController) {
                      gmc = MapController;
                    },
                  ))
            ],
          ),
        ));
  }
}
