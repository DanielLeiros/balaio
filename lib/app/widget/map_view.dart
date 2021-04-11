import 'package:balaio/app/service/location.dart';
import 'package:balaio/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final controller = MapController(
    location: LatLng(-5.8837056, -35.1644988),
  );

  void _onDoubleTap() {
    controller.zoom += 0.5;
  }

  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
    }
  }

  void teste() async {
    var loc = await Location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    //final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    //controller.tileSize = 256 / devicePixelRatio;

    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onScaleEnd: (details) {
        print(
            "Location: ${controller.center.latitude}, ${controller.center.longitude}");
      },
      child: Stack(
        children: [
          Map(
            controller: controller,
            builder: (context, x, y, z) {
              final url =
                  'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

              return CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
              );
            },
          ),
          Center(
            child: Icon(
              Icons.location_pin,
              color: BalaioTheme.primary,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
