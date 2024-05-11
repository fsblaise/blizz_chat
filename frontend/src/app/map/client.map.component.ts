import { Component } from '@angular/core';
import { NgLeafletUniversalModule } from 'ng-leaflet-universal';

@Component({
  selector: 'app-client-map',
  standalone: true,
  imports: [NgLeafletUniversalModule],
  templateUrl: './client.map.component.html',
  styleUrl: './map.component.css'
})
export class ClientMapComponent {
  map: any = null;
  L: any = null;
  
  constructor() {
  }

  ngOnInit(): void {

  }

  async setupMap(): Promise<void> {
    if (this.L) {
      this.map = this.L.map('map').setView([0,0], 13);

      // Add a tilelayer
      this.L.tileLayer(
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
