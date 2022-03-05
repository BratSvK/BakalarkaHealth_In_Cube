import { Injectable } from '@angular/core';
import { HubConnection, HubConnectionBuilder } from '@microsoft/signalr';
import { BsModalService } from 'ngx-bootstrap/modal';
import { environment } from 'src/environments/environment';
import { Pouzivatel } from '../models/pouzivatel';
import { SprievodkaParams } from '../models/sprievodka/sprievodkaParams';
import { CalendarChangedModalComponent } from '../user/calendar/calendar-changed-modal/calendar-changed-modal.component';

export const SPRIEVODKA_HUB_ACTION_DELETE = "DeleteSprievodkaByPatient";
export const SPRIEVODKA_HUB_ACTION_CREATE = "CreateAppointmentByDoctor";


@Injectable({
  providedIn: 'root'
})
export class SprievodkaHubService {
  hubUrl = environment.hubUrl;

  constructor(private modalService: BsModalService) { }


  createAndBuildSignalRSprievodkaHubConnetion(sprievodkaParams: SprievodkaParams, user: Pouzivatel): HubConnection {
    let hubConnection: HubConnection;
    hubConnection = new HubConnectionBuilder()
      .withUrl(this.hubUrl + 'sprievodka?sprievodkaParams=' + JSON.stringify(sprievodkaParams), {
        accessTokenFactory: () => user.token,
      })
      .withAutomaticReconnect()
      .build();

    hubConnection.start().catch(error => console.log(error));
    return hubConnection;
  }

  listenSignalRToEditCalendar(hubConnection: HubConnection) {
    hubConnection.on('EditCalendar', (hlaska) => {
      this.showCalendarChangeMessageModal(hlaska).onHidden.subscribe(() => {
        window.location.reload();
      });
    });
  }

  stopHubConnection(hubConnection: HubConnection) {
    if(hubConnection)
    hubConnection.stop();
  }


  private showCalendarChangeMessageModal(hlaska: string) {
    const config = {
      class: 'modal-dialog-centered',
      initialState: {
        caption: `Váš kalendár bol zmenený - ${hlaska}`,
        message: 'Pre akatuálne údaje si obnovte stránku.',
        acceptButton: 'Obnoviť'
      },
      keyboard: false
    };

    return this.modalService.show(CalendarChangedModalComponent, config);
  }
}
