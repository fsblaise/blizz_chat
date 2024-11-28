import { Component, model, OnDestroy, OnInit, signal } from '@angular/core';
import { CompanyService } from '../../shared/services/company.service';
import { firstValueFrom, Subscription } from 'rxjs';
import { AuthService } from '../../shared/services/auth.service';
import { Company, Member } from '../../shared/models/company.model';
import { AsyncPipe, TitleCasePipe } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatIcon, MatIconRegistry } from '@angular/material/icon';
import { DomSanitizer } from "@angular/platform-browser";
import { MatButtonModule } from '@angular/material/button';
import { MatDialog } from '@angular/material/dialog';
import { CompanyDetails, CompanyFormDialogComponent } from '../../shared/components/dialogs/company-form-dialog/company-form-dialog.component';
import { User } from '../../shared/models/user.model';
import { AddMemberDialogComponent } from '../../shared/components/dialogs/add-member-dialog/add-member-dialog.component';
import { ConfirmDialogComponent } from '../../shared/components/dialogs/confirm-dialog/confirm-dialog.component';

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
    TitleCasePipe
  ],
  templateUrl: './company.component.html',
  styleUrl: './company.component.css'
})
export class CompanyComponent implements OnInit, OnDestroy {
  subscriptions: Subscription[] = [];
  companies: Company[] = [];
  loading = true;
  user!: User;
  readonly apiUrl = signal('');
  readonly name = signal('');
  readonly memberEmail = signal('');
  readonly memberName = signal('');
  readonly memberRole = signal('');

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
      this.user = user;

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

  addMember(id: string) {
    const dialogRef = this.dialog.open(AddMemberDialogComponent, {
      data: { fullName: '', email: '', role: '' }
    });

    dialogRef.afterClosed().subscribe((result: Member) => {
      console.log('The dialog was closed');
      if (result !== undefined) {
        this.memberEmail.set(result.email);
        this.memberName.set(result.fullName);
        this.memberRole.set(result.role);
        console.log('Member', result);
        this.subscriptions.push(
          this.companyService.addMember(id, { fullName: this.memberName(), email: this.memberEmail(), role: this.memberRole() })
            .subscribe(company => {
              console.log(company);
            })
        );
      }
    });
  }

  updateMember(companyId: string, member: Member) {
    this.memberEmail.set(member.email);
    this.memberName.set(member.fullName);
    this.memberRole.set(member.role);

    const dialogRef = this.dialog.open(AddMemberDialogComponent, {
      data: { fullName: this.memberName(), email: this.memberEmail(), role: this.memberRole() }
    });

    dialogRef.afterClosed().subscribe((result: Member) => {
      console.log('The dialog was closed');
      if (result !== undefined) {
        this.memberEmail.set(result.email);
        this.memberName.set(result.fullName);
        this.memberRole.set(result.role);
        console.log('Updated Member', result);
        this.subscriptions.push(
          this.companyService.updateMember(companyId, { fullName: this.memberName(), email: this.memberEmail(), role: this.memberRole() })
            .subscribe(company => {
              console.log(company);
            })
        );
      }
    });
  }

  deleteMember(company: Company, email: string) {
    this.subscriptions.push(
      this.companyService.deleteMember(company, email)
        .subscribe(company => {
          console.log(company);
        })
    );
  }

  delete(id: string) {

    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      data: { message: 'Are you sure you want to delete this workspace?' }
    });

    dialogRef.afterClosed().subscribe((result: boolean ) => {
      console.log('The dialog was closed: ', result);

      if (!result) {
        return;
      }

      this.subscriptions.push(
        this.companyService.deleteCompany(id)
          .subscribe(() => {
            console.log('Company deleted');
          })
      );
    });
  }

  update(company: Company) {
    this.name.set(company.name);
    this.apiUrl.set(company.apiUrl);

    const dialogRef = this.dialog.open(CompanyFormDialogComponent, {
      data: { name: this.name(), apiUrl: this.apiUrl() }
    });

    dialogRef.afterClosed().subscribe((result: CompanyDetails) => {
      console.log('The dialog was closed');
      if (result !== undefined) {
        this.apiUrl.set(result.apiUrl);
        this.name.set(result.name);
        company.apiUrl = this.apiUrl();
        company.name = this.name();
        console.log('Company', result);

        this.subscriptions.push(
          this.companyService.updateCompany(company)
            .subscribe(company => {
              console.log(company);
            })
        );
      }
    });
  }

}
