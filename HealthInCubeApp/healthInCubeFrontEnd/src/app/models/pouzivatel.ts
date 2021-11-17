export interface Pouzivatel {
  id: number;
  email: string;
  token: string;
  fotka: string;
  fullName: string;
  expirationDateToken: Date;
  roleStoreBase: string[];
}