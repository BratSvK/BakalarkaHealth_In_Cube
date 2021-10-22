export class Pouzivatel {

    constructor(
        public email: string,
        public userId: string,
        public fullName: string,
        public fotka: any,
        public token: string,
        public tokenExpi: Date,
        public roleStoreBase: string [],
      ) {}

      // check validity 

  // getter user.token -> special type of property with code 
  // get token() {

  //   console.log(this._tokenExpirationDate);
  //   console.log("som tu");

  //   // token expired
  //   if (!this._tokenExpirationDate || new Date().getTime() > this._tokenExpirationDate.getTime()) {
  //       return null;
  //   }

  //   return this._token;
  // }

  // get tokenExpi() {
  //   return this._tokenExpirationDate;
  // }

    
}