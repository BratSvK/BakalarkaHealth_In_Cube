import { DomSanitizer } from "@angular/platform-browser";


// create as secure url to our photo
export function extractFotoFromApi(fotka: any,  sanitizer: DomSanitizer ) {
    let objectURL = 'data:image/png;base64,' + this.practitioner.fotka;
    return sanitizer.bypassSecurityTrustUrl(objectURL);
}