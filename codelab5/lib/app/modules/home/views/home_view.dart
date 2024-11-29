import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Based App"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: homeController.getCurrentLocation,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Google Maps widget
          Obx(
            () => GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-7.983908, 112.621391), // Default Malang
                zoom: 12,
              ),
              markers: homeController.markers.toSet(),
              onMapCreated: (GoogleMapController controller) {
                homeController.mapController = controller;
              },
            ),
          ),
          // Overlay UI
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => Text(
                        homeController.locationMessage.value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => homeController.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: homeController.getCurrentLocation,
                          child: const Text("Cari Lokasi"),
                        ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: homeController.openGoogleMaps,
                  child: const Text("Buka di Google Maps"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
