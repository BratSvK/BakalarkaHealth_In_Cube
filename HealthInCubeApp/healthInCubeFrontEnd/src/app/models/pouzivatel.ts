export class Pouzivatel {

    constructor(
        public email: string,
        public userId: string,
        public fullName: string,
        public fotka: any,
        private _token: string,
        private _tokenExpirationDate: Date,
        public roleStoreBase: string [],
      ) {}

      // check validity 

  // getter user.token -> special type of property with code 
  get token() {

    // token expired
    if (!this._tokenExpirationDate ||new Date() > this._tokenExpirationDate) {
        return null;
    }

    return this._token;
  }

  get tokenExpi() {
    return this._tokenExpirationDate;
  }

    
}