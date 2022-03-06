using AutoMapper;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.DTOs.Sprievodka;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Data
{
    public class ZdravotnaKartaRepository : IZdravotnaKartaRepository
    {

        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        /// <summary>
        /// Ctor.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="mapper"></param>
        public ZdravotnaKartaRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }
        public void DeleteItem(ZdravotnaKartum item)
        {
            _context.ZdravotnaKarta.Remove(item);
        }

        /// <summary>
        /// Order of composit PK e.Od, e.IdLekar, e.IdPacient.
        /// </summary>
        public async Task DeleteZdravotnaKartaPovolenieByPatient(SprievodkaDeleteDto sprievodkaDelete)
        {
            ZdravKartaPovolenium kartaPovolenium = 
                await _context.ZdravKartaPovolenia
                .FindAsync(new object[] { sprievodkaDelete.TerminOd, sprievodkaDelete.IdLekar, sprievodkaDelete.IdPacient });

            _context.ZdravKartaPovolenia.Remove(kartaPovolenium);
        }

        public Task<bool> EntityExists(decimal itemId)
        {
            throw new NotImplementedException();
        }

        public Task<int> GetCountAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ZdratovnaKartaDto> GetItemAsync(decimal itemId)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<ZdratovnaKartaDto>> GetItemsAsync()
        {
            throw new NotImplementedException();
        }

        public Task<ZdravotnaKartum> GetOriginItemAsync(decimal itemId)
        {
            throw new NotImplementedException();
        }

        public void InsertItem(ZdravotnaKartum item)
        {
            _context.ZdravotnaKarta.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(ZdravotnaKartum item)
        {
            _context.Entry(item).State = EntityState.Modified;
        }
    }
}
