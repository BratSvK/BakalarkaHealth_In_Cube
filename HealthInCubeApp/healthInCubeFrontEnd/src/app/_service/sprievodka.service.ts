import { HttpClient, HttpParams } from '@angular/common/http';
import { EventEmitter, Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { SprievodkaCreateModelApi } from '../models/sprievodka/sprievodkaFormModel';
import { SprievodkaModel } from '../models/sprievodka/sprievodkaModel';
import { SprievodkaParams } from '../models/sprievodka/sprievodkaParams';
import { extractKeyFromParams } from '../shared/common';
import { SPRIEVODKA_API } from '../_constants/endPointsApi';
import { HubConnection } from '@microsoft/signalr';
import { Pouzivatel } from '../models/pouzivatel';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { SprievodkaHubService, SPRIEVODKA_HUB_ACTION_CREATE, SPRIEVODKA_HUB_ACTION_DELETE } from './signalRSprievodkaHub.service';
import { SprievodkaDelete } from '../models/sprievodka/sprievodkaDelete';


@Injectable({
  providedIn: 'root'
})
export class SprievodkaService {
  baseUrl = environment.apiUrl;
  bsModalRef: BsModalRef;
  sprievodkaCache = new Map();

  private isDeletedEventSuccess: EventEmitter<number> = new EventEmitter<number>();

  private hubConnection: HubConnection;

  constructor(
    private http: HttpClient,
    private signalRSprievodkaHubService: SprievodkaHubService,
    private toastr: ToastrService
  ) { }

  get isDeletedListener$() {
    return this.isDeletedEventSuccess.asObservable();
  }

  createHubConnection(user: Pouzivatel, sprievodkaParams: SprievodkaParams) {
    this.hubConnection = this.signalRSprievodkaHubService.createAndBuildSignalRSprievodkaHubConnetion(sprievodkaParams, user);
    this.signalRSprievodkaHubService.listenSignalRToEditCalendar(this.hubConnection);
  }


  // createSprievodka(sprievodkaForm: SprievodkaCreateModelApi) {
  //   return this.http.post(this.baseUrl + `${SPRIEVODKA_API}/create`, sprievodkaForm);
  // }

  async createSprievodka(sprievodkaForm: SprievodkaCreateModelApi) {
    return this.hubConnection.invoke(SPRIEVODKA_HUB_ACTION_CREATE, sprievodkaForm)
      .catch(error => this.toastr.error(error));
  }

  async deleteSprievodka(sprievodkaModel: SprievodkaDelete) {
    return this.hubConnection.invoke(SPRIEVODKA_HUB_ACTION_DELETE, sprievodkaModel)
      .catch(error => this.toastr.error(error));
  }

  stopHubConnection() {
   this.signalRSprievodkaHubService.stopHubConnection(this.hubConnection);
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

    clearCacheOfRequestsSprievodka() {
      if (this.sprievodkaCache)
      this.sprievodkaCache.clear();
    }

    isDeletedSuccess(i: number) {
      console.log('deleted');
      this.isDeletedEventSuccess.emit(i);
    }
}
