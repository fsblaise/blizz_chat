export class CompanyDto {
    name: string;
    apiUrl: string;
    members: MemberDto[];
}

export class MemberDto {
    fullName: string;
    email: string;
    role: string;
}
