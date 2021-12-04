// import { Injectable } from "@angular/core";
// import { ActivatedRouteSnapshot, Resolve } from "@angular/router";
// import { Observable, of } from "rxjs";
// import { mergeMap } from "rxjs/operators";
// import { PacientCard } from "src/app/models/pacientCard";
// import { PatientsService } from "src/app/_service/patients.service";

// // this is not a component
// @Injectable({
//     providedIn: 'root'
// })
// export class PatientListResolver implements Resolve<Observable<PacientCard[]>> {

//     constructor(private patientService: PatientsService) {}

//     resolve(route: ActivatedRouteSnapshot):  Observable<Observable<PacientCard[]>>{
//        return this.patientService.getDoctorIdByUserId().pipe(
//             mergeMap(idLekar => {
//                 return of(this.patientService.getPatientsByDoctorId(idLekar));
//             })
//         )
//     }

// }