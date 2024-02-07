import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/map/application/map_data.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final I10n _i10n = locator<I10n>();

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);
    final mapData = ref.watch(mapDataProvider);

    return location.when(data: (loc) {
      return Column(
        children: [
          Expanded(
            child: FlutterMap(options: MapOptions(initialCenter: LatLng(loc!.latitude!, loc.longitude!)), children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.fsblaise.blizz_chat',
              ),
              MarkerLayer(
                  markers: mapData.when(
                      data: (data) {
                        if (data != null) {
                          return data.map((e) {
                            List<String> coords = e.location['coords'].split('_');
                            LatLng formatCoords = LatLng(double.parse(coords[0]), double.parse(coords[1]));
                            print(e.fullName);
                            return Marker(
                              point: formatCoords,
                              child: const Icon(Icons.pin_drop),
                            );
                          }).toList();
                        } else {
                          return [];
                        }
                      },
                      error: (e, s) => [],
                      loading: () => []))
            ]),
          )
        ],
      );
    }, error: (e, s) {
      return Center(child: Text(_i10n.somethingWentWrong));
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
