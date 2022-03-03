import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { SprievodkaCreateModelApi } from '../models/sprievodka/sprievodkaFormModel';
import { SprievodkaModel } from '../models/sprievodka/sprievodkaModel';
import { SprievodkaParams } from '../models/sprievodka/sprievodkaParams';
import { extractKeyFromParams } from '../shared/common';
import { SPRIEVODKA_API } from '../_constants/endPointsApi';
import { HubConnection, HubConnectionBuilder } from '@microsoft/signalr';
import { Pouzivatel } from '../models/pouzivatel';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { CalendarChangedModalComponent } from '../user/calendar/calendar-changed-modal/calendar-changed-modal.component';
import { ToastrService } from 'ngx-toastr';


@Injectable({
  providedIn: 'root'
})
export class SprievodkaService {
  baseUrl = environment.apiUrl;
  hubUrl = environment.hubUrl;

  bsModalRef: BsModalRef;
  sprievodkaCache = new Map();

  private hubConnection: HubConnection;

  constructor(
    private http: HttpClient,
    private modalService: BsModalService,
    private toastr: ToastrService
  ) { }

  createHubConnection(user: Pouzivatel, sprievodkaParams: SprievodkaParams) {
    this.hubConnection = new HubConnectionBuilder()
      .withUrl(this.hubUrl + 'sprievodka?sprievodkaParams=' + JSON.stringify(sprievodkaParams), {
        accessTokenFactory: () => user.token,
      })
      .withAutomaticReconnect()
      .build();

      this.hubConnection.start().catch(error => console.log(error));

      this.hubConnection.on('ListenToSprievodkaCalendar', () => {});

      this.hubConnection.on('NewSprievodka', (hlaska) => {
         this.showCalendarChangeMessageModal().onHidden.subscribe(() => {
           window.location.reload();
         });
      });

  }

  


  stopHubConnection() {
    if(this.hubConnection)
    this.hubConnection.stop();
  }

  // createSprievodka(sprievodkaForm: SprievodkaCreateModelApi) {
  //   return this.http.post(this.baseUrl + `${SPRIEVODKA_API}/create`, sprievodkaForm);
  // }

  async createSprievodka(sprievodkaForm: SprievodkaCreateModelApi) {
    return this.hubConnection.invoke('CreateAppointmentByDoctor', sprievodkaForm)
      .catch(error => this.toastr.error(error));
  }

  chechAvailabilityInDay(idLekar: number, termin: string): Observable<boolean> {
    let params = new HttpParams();
    params = params.append('idLekar', idLekar.toString());
    params = params.append('terminDatum', termin.toString());
    return this.http.get<boolean>(this.baseUrl + `${SPRIEVODKA_API}/availability`, {params: params});
  }

  getSprievodkyByParams(sprievodkaParams: SprievodkaParams): Observable<SprievodkaModel[]> {
    const keyFromParams = extractKeyFromParams(sprievodkaParams);
    var response = this.sprievodkaCache.get(keyFromParams);
    if (response) {
      return of(response);
    }
    let params = new HttpParams();

    if (sprievodkaParams.idLekar) {
      params = params.append('idLekar', sprievodkaParams.idLekar.toString());
    }

    if (sprievodkaParams.idPacient) {
      params = params.append('idPacient', sprievodkaParams.idPacient.toString());
    }
    params = params.append('startWeekBy', sprievodkaParams.startWeekBy.toString());
    return this.http.get<SprievodkaModel[]>(this.baseUrl + `${SPRIEVODKA_API}/byWeek`, {params: params})
    .pipe(
      map(response => {
        this.sprievodkaCache.set(keyFromParams, response);
        return response;
      }));
    }


    private showCalendarChangeMessageModal() {
      const config = {
        class: 'modal-dialog-centered',
        initialState: {
          caption: 'Váš kalendár bol zmenený',
          message: 'Pre katualne údaje si obnovte stránku.',
          acceptButton: 'Obnoviť'
        },
        keyboard: false
      };
  
      return this.modalService.show(CalendarChangedModalComponent, config);
    }
}
