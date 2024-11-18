import { Component, model, OnDestroy, OnInit, signal } from '@angular/core';
import { CompanyService } from '../../shared/services/company.service';
import { firstValueFrom, Subscription } from 'rxjs';
import { AuthService } from '../../shared/services/auth.service';
import { Company } from '../../shared/models/company.model';
import { AsyncPipe } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatIcon, MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from "@angular/platform-browser";
import { MatButtonModule } from '@angular/material/button';
import { MatDialog } from '@angular/material/dialog';
import { CompanyDetails, CompanyFormDialogComponent } from '../../shared/components/dialogs/company-form-dialog/company-form-dialog.component';

@Component({
  selector: 'app-company',
  standalone: true,
  imports: [
    AsyncPipe,
    MatCardModule,
    MatProgressSpinnerModule,
    MatExpansionModule,
    MatIcon,
    MatButtonModule,
  ],
  templateUrl: './company.component.html',
  styleUrl: './company.component.css'
})
export class CompanyComponent implements OnInit, OnDestroy {
  subscriptions: Subscription[] = [];
  companies: Company[] = [];
  loading = true;
  readonly apiUrl = signal('');
  readonly name = signal('');

  constructor(
    protected companyService: CompanyService,
    private auth: AuthService,
    private matIconRegistry: MatIconRegistry,
    private domSanitizer: DomSanitizer,
    private dialog: MatDialog,
  ) {
    this.matIconRegistry.addSvgIcon(
      'docker',
      this.domSanitizer.bypassSecurityTrustResourceUrl('assets/icons/docker.svg')
    );
  }

  ngOnInit() {
    firstValueFrom(this.auth.user$).then(user => {
      console.log('User', user);

      this.subscriptions.push(this.companyService.getCompanies(user.email).subscribe(companies => { }));
    });
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach(sub => sub.unsubscribe());
  }

  create() {
    const dialogRef = this.dialog.open(CompanyFormDialogComponent, {
      data: { name: '', apiUrl: '' }
    });

    dialogRef.afterClosed().subscribe((result: CompanyDetails) => {
      console.log('The dialog was closed');
      if (result !== undefined) {
        this.apiUrl.set(result.apiUrl);
        this.name.set(result.name);
        console.log('Company', result);
        this.subscriptions.push(
          this.companyService.createCompany({ name: this.name(), apiUrl: this.apiUrl() })
            .subscribe(company => {
              console.log(company);
            })
        );
      }
    });
  }
}
