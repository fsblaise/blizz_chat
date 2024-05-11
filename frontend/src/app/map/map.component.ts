import { afterNextRender, Component } from '@angular/core';

@Component({
  selector: 'app-map',
  standalone: true,
  imports: [],
  templateUrl: './map.component.html',
  styleUrl: './map.component.css'
})
export class MapComponent {
  map: any;
  L: any = null;

  constructor() {
    afterNextRender(async () => {
      this.L = await import('leaflet');
      this.setupMap();
    })
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
