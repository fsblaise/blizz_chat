export interface Company {
  id: string;
  name: string;
  apiUrl: string;
  members: Member[];
}

export interface Member {
  fullName: string;
  email: string;
  role: string;
}