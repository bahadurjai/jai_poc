// import 'package:flutter/material.dart';
//
//
// class HeatMap extends StatelessWidget {
//   final List<Map<String, dynamic>> populationData = [
//     {'state': 'Andhra Pradesh', 'population': 53508900},
//     {'state': 'Arunachal Pradesh', 'population': 1229967},
//     // Add more states and their population data
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Population Heat Map'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(20.5937, 78.9629), // Center of India
//           zoom: 4.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//           HeatmapLayerOptions(
//             heatmaps: [
//               Heatmap(
//                 points: _generateHeatMapPoints(),
//                 radius: 30.0,
//                 color: Colors.red,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<LatLng> _generateHeatMapPoints() {
//     return populationData.map((data) {
//       final String state = data['state'];
//       final double population = data['population'].toDouble();
//       final double lat = _getStateLatitude(state);
//       final double lon = _getStateLongitude(state);
//       return LatLng(lat, lon, intensity: population / 1000000); // Adjust intensity as needed
//     }).toList();
//   }
//
//   double _getStateLatitude(String state) {
//     // Dummy latitude data, replace with real data
//     return 20.0;
//   }
//
//   double _getStateLongitude(String state) {
//     // Dummy longitude data, replace with real data
//     return 78.0;
//   }
// }