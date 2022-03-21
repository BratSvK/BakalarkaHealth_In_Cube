import { Injectable } from '@angular/core';
import { compare, Operation } from 'fast-json-patch';
import { PacientZdravotnaKartaDetail } from '../models/pacient/pacientZdravotnaKartaDetail';

@Injectable({
  providedIn: 'root'
})
export class HealthRecordPatchService {

  constructor() {
  }

  createPatch(
    originalDocumnent: PacientZdravotnaKartaDetail,
    changedModel: Partial<PacientZdravotnaKartaDetail>
    ) : Operation[]
    {
      const documentChanges = compare(originalDocumnent, changedModel);
      return documentChanges.filter(op => op.op === 'replace');
    }
  }

  
