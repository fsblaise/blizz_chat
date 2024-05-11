import { isPlatformBrowser } from '@angular/common';
import { Inject, Injectable, PLATFORM_ID } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MapService {
  public L: any = null;

  constructor(@Inject(PLATFORM_ID) private platformId: Object) {
    if (isPlatformBrowser(this.platformId)) {
      this.loadLeaflet();
    }
  }

  async loadLeaflet(): Promise<void> {
    if (isPlatformBrowser(this.platformId)) {
      try {
        const { default: L } = await import('leaflet');
        this.L = L;
      } catch (error) {
        console.error('Failed to load Leaflet:', error);
      }
    }
  }
}
