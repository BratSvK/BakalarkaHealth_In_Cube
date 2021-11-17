import { Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { FileUploader } from 'ng2-file-upload';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { map, take } from 'rxjs/operators';
import { Photo } from 'src/app/models/photo';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';
import { environment } from 'src/environments/environment';

import * as AuthActionsBundle from '../../../auth/store/auth.actions';

@Component({
  selector: 'app-photo-editor',
  templateUrl: './photo-editor.component.html',
  styleUrls: ['./photo-editor.component.css']
})
export class PhotoEditorComponent implements OnInit { 
  @Input() user: Observable<Pouzivatel>;

  hasBaseDropzoneOver = false;
  baseUrl = environment.apiUrl;
  uploader: FileUploader;
  userToken: string;

  constructor(private store: Store<AppState>) {
   }

  ngOnInit(): void {
    this.user.pipe(take(1), map(userData => {
      return userData.token;
    })).subscribe(token => {
      this.userToken = token;
    });
    this.initializeUploader();
  }

  // update dropzone 
  fileOverBase(e: any) {
    this.hasBaseDropzoneOver = e;
  }

  deletePhoto() {
    this.store.dispatch(new AuthActionsBundle.RemoveUserPhoto());
  }

  initializeUploader(){
    this.uploader = new FileUploader({
      url: this.baseUrl + 'pouzivatel/add-photo',
      authToken: 'Bearer ' +  this.userToken,
      isHTML5: true,
      allowedFileType: ['image'],
      removeAfterUpload: true,
      autoUpload: false,
      maxFileSize: 10 * 1024 * 1024, // 10MB is upload server max
    });

    // we are using a bearer token so we dont need it 
    this.uploader.onAfterAddingFile = (file) => {
      file.withCredentials = false;
    }

    // component code 
    this.uploader.onSuccessItem = (item, response, status, headers) => {
      console.log("som tu");
      this.store.dispatch(new AuthActionsBundle.FetchUserPhoto());
    }
  }

}
