import { Bydlisko } from "./bydlisko";

export interface Pouzivatel {
  id: number;
  email: string;
  token: string;
  fotka: string;
  fullName: string;
  expirationDateToken: Date;
  poslednePrihlasenie: Date | null;
  datNarodenia: Date | null;
  bydliskos: Bydlisko[];
  roleStoreBase: string[];
  registrovany: Date
}