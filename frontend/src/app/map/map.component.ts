import { Component, OnInit } from '@angular/core';
import { MapService } from '../../shared/services/map.service';
import { MatProgressSpinner } from '@angular/material/progress-spinner';

@Component({
  selector: 'app-map',
  standalone: true,
  imports: [MatProgressSpinner],
  templateUrl: './map.component.html',
  styleUrl: './map.component.css'
})
export class MapComponent implements OnInit {
  map: any = null;
  loading = true;

  constructor(private mapService: MapService) {

  }

  ngOnInit(): void {
    this.mapService.loadLeaflet().then(_ => {
      this.loading = false;
      this.setupMap();
    });
  }

  async setupMap(): Promise<void> {
    if (this.mapService.L) {
      this.map = this.mapService.L.map('map').setView([0, 0], 13);

      // Add a tilelayer
      this.mapService.L.tileLayer(
        'https://tile.openstreetmap.org/{z}/{x}/{y}.png'
      ).addTo(this.map);

      this.getCurrentLocation();
    }
  }

  getCurrentLocation() {
    navigator.geolocation.getCurrentPosition(
      position => {
        console.log('asd');
        this.map.setView([position.coords.latitude, position.coords.longitude]);
      },
      error => {
        // alert("Geolocation is not supported by this browser.");
        console.error(error);
      });
  }
}
