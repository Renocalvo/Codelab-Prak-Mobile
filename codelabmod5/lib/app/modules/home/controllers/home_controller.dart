import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler

class HomeController extends GetxController {
  var currentPosition = Rx<Position?>(null);
  var locationMessage = "Mencari Lat dan Long...".obs;
  var isLoading = false.obs;
  var markers = <Marker>{}.obs;
  GoogleMapController? mapController;

  // Mendapatkan lokasi saat ini
  Future<void> getCurrentLocation() async {
    isLoading.value = true;
    try {
      // Cek izin lokasi
      await _checkLocationPermission();

      // Pastikan layanan lokasi aktif
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        throw Exception('Layanan lokasi tidak aktif');
      }

      // Ambil lokasi
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      currentPosition.value = position;
      locationMessage.value =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";

      // Update marker dan kamera
      updateMarker(position);
      moveCamera(position);
    } catch (e) {
      locationMessage.value = "Gagal mendapatkan lokasi: $e";
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk membuka Google Maps
  void openGoogleMaps() async {
    // Periksa apakah currentPosition memiliki nilai
    if (currentPosition.value != null) {
      final latitude = currentPosition.value!.latitude;
      final longitude = currentPosition.value!.longitude;

      final url = 'https://www.google.com/maps?q=$latitude,$longitude';

      // Cek apakah URL dapat diluncurkan
      if (await canLaunch(url)) {
        // Buka URL di aplikasi atau browser
        await launch(url);
      } else {
        // Jika tidak dapat diluncurkan, tampilkan pesan error
        throw 'Tidak dapat membuka $url';
      }
    } else {
      // Jika currentPosition belum diisi, tampilkan pesan error
      throw 'Lokasi tidak ditemukan';
    }
  }

  // Fungsi untuk memperbarui marker
  void updateMarker(Position position) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId("currentLocation"),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(title: "Lokasi Saya"),
      ),
    );
  }

  // Fungsi untuk memindahkan kamera
  void moveCamera(Position position) {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(position.latitude, position.longitude),
          16, // Zoom level
        ),
      );
    }
  }

  // Fungsi untuk memeriksa dan meminta izin lokasi
  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;

    if (!status.isGranted) {
      // Jika izin tidak diberikan, minta izin
      if (status.isDenied) {
        // Izin ditolak, minta izin
        await Permission.location.request();
      }

      // Jika masih ditolak atau izin tidak ada, beri tahu pengguna
      if (status.isPermanentlyDenied) {
        openAppSettings(); // Arahkan pengguna untuk membuka pengaturan aplikasi
        throw Exception('Izin lokasi diperlukan, buka pengaturan aplikasi.');
      }

      // Pastikan izin diberikan
      status = await Permission.location.request();
      if (!status.isGranted) {
        throw Exception('Izin lokasi ditolak');
      }
    }
  }
}
