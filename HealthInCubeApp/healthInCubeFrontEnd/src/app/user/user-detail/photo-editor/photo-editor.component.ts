import { Component, Input, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { FileUploader } from 'ng2-file-upload';
import { Photo } from 'src/app/models/photo';
import { Pouzivatel } from 'src/app/models/pouzivatel';
import { AppState } from 'src/app/_store/models/AppState';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-photo-editor',
  templateUrl: './photo-editor.component.html',
  styleUrls: ['./photo-editor.component.css']
})
export class PhotoEditorComponent implements OnInit {
  // recieve nour member 
  @Input() user: Pouzivatel;
  hasBaseDropzoneOver = false;
  baseUrl = environment.apiUrl;
  uploader: FileUploader;


  constructor(private store: Store<AppState>) {
   }

  ngOnInit(): void {
    this.initializeUploader();
  }

  // update dropzone 
  fileOverBase(e: any) {
    this.hasBaseDropzoneOver = e;
  }

  setMainPhoto(photo: Photo) {
    // this.memberService.setMainPhoto(photo.id).subscribe(() => {
    //   this.user.photoUrl = photo.url;
    //   this.accountService.setCurrentUser(this.user);
    //   this.member.photourl = photo.url;
    //   this.member.photos.forEach(p => {
    //     if (p.isMain) p.isMain = false;
    //     if (p.id === photo.id) p.isMain = true;
    //   })
    // });
  }

  deletePhoto(photoId: number) {
    // this.memberService.deletePhoto(photoId).subscribe(() => {
    //   this.member.photos = this.member.photos.filter(x => x.id !== photoId);    //return all photos without id which we wanna to delete 
    // })
  }

  initializeUploader(){
    this.uploader = new FileUploader({
      url: this.baseUrl + 'pouzivatel/add-photo',
      authToken: 'Bearer ' +  this.user.token,
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
      if (response){
        const photo: Photo = JSON.parse(response);
        if (photo.fotka){
          this.user.fotka = photo.fotka;
        }
      }
    }
  }

}
