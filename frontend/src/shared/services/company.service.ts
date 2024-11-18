import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { BehaviorSubject, catchError, map, Observable, of } from 'rxjs';
import { Company, Member } from '../models/company.model';
import { CreateCompanyDto } from '../models/company.dtos';

@Injectable({
  providedIn: 'root'
})
export class CompanyService {
  private companiesSubject: BehaviorSubject<any> = new BehaviorSubject<any>(null);
  public companies$: Observable<Company[]> = this.companiesSubject.asObservable();

  constructor(private http: HttpClient) { }

  // check if email is in company

  getCompanies(email: string): Observable<Company[]> {
    console.log('Getting companies');
    console.log(`${environment.API_URL}/companies/init/${email}`);

    return this.http.get(`${environment.API_URL}/companies/init/${email}`, { observe: 'response' }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          console.log("Success");

          const companies = response.body as Company[];
          this.companiesSubject.next(companies);
          return companies;
        } else {
          throw new Error('Failed to get companies');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of([]);
      }),
    );
  }

  // company management

  createCompany(company: CreateCompanyDto): Observable<Company | null> {
    return this.http.post(`${environment.API_URL}/companies`, company, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const company = response.body as Company;
          const currentCompanies = this.companiesSubject.value;
          this.companiesSubject.next([...currentCompanies, company]);
          return company;
        } else {
          throw new Error('Failed to create company');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }

  updateCompany(company: Company): Observable<Company | null> {
    return this.http.patch(`${environment.API_URL}/companies/${company.id}`, company, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const company = response.body as Company;
          return company;
        } else {
          throw new Error('Failed to update company');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }

  deleteCompany(id: string): Observable<any> {
    return this.http.delete(`${environment.API_URL}/companies/${id}`, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok) {
          const currentCompanies = this.companiesSubject.value;
          const updatedCompanies = currentCompanies.filter((c: Company) => c.id !== id);
          this.companiesSubject.next(updatedCompanies);
          return response;
        } else {
          throw new Error('Failed to delete company');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }

  // members

  addMember(id: string, member: Member): Observable<Company | null> {
    return this.http.post(`${environment.API_URL}/companies/${id}/members`, member, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const company = response.body as Company;
          const currentCompanies = this.companiesSubject.value;
          const updatedCompanies = currentCompanies.map((c: Company) => c.id === company.id ? company : c);
          this.companiesSubject.next(updatedCompanies);
          return company;
        } else {
          throw new Error('Failed to add member');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }

  updateMember(id: string, member: Member): Observable<Company | null> {
    return this.http.patch(`${environment.API_URL}/companies/${id}/members/${member.email}`, member, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const company = response.body as Company;
          const currentCompanies = this.companiesSubject.value;
          const updatedCompanies = currentCompanies.map((c: Company) => c.id === company.id ? company : c);
          this.companiesSubject.next(updatedCompanies);
          return company;
        } else {
          throw new Error('Failed to update member');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }

  deleteMember(id: string, email: string): Observable<Company | null> {
    return this.http.delete(`${environment.API_URL}/companies/${id}/members/${email}`, { observe: 'response', withCredentials: true }).pipe(
      map((response: any) => {
        if (response.ok && response.body) {
          const company = response.body as Company;
          const currentCompanies = this.companiesSubject.value;
          const updatedCompanies = currentCompanies.map((c: Company) => c.id === company.id ? company : c);
          this.companiesSubject.next(updatedCompanies);
          return company;
        } else {
          throw new Error('Failed to delete member');
        }
      }),
      catchError((error: any) => {
        console.error(error);
        return of(null);
      }),
    );
  }


}