export class CompanyDto {
    id: string;
    name: string;
    apiUrl: string;
    members: MemberDto[];
}

export class MemberDto {
    fullName: string;
    email: string;
    role: string;
}
