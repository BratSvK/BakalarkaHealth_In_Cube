using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using HealthInCube_BackEnd.DTOs;
using HealthInCube_BackEnd.Entities;
using HealthInCube_BackEnd.Interfaces;
using Microsoft.EntityFrameworkCore;


namespace HealthInCube_BackEnd.Data
{
    public class ZiadankaRepository : IZiadankaRepository
    {
        private readonly HealthInCubeContext _context;
        private readonly IMapper _mapper;

        public ZiadankaRepository(HealthInCubeContext context, IMapper mapper)
        {
            _mapper = mapper;
            _context = context;

        }

        public void DeleteItem(Ziadanka ziadanka)
        {
            _context.Ziadanka.Remove(ziadanka);
        }

        public Task<ZiadankaDto> GetItemAsync(decimal itemId)
        {
            throw new System.NotImplementedException();
           
        }

        public async Task<bool> EntityExists(decimal itemId)
        {
            return await _context.Ziadanka.AnyAsync(l => l.IdUser == itemId);
        }

        public async Task<IEnumerable<ZiadankaDto>> GetItemsAsync()
        {
            return await _context.Ziadanka
                                .Include(z => z.IdPouzivatelNavigation)
                                .Include(z => z.IdLekarNavigation)
                                .ProjectTo<ZiadankaDto>(_mapper.ConfigurationProvider)
                                .ToListAsync();
        }

        public async Task<Ziadanka> GetZiadankaByDoctorId(int id)
        {
            return await _context.Ziadanka.Include(z => z.IdLekarNavigation).SingleOrDefaultAsync(z =>z.IdLekar == id);
        }

        public async Task<Ziadanka> GetZiadankaByPatientId(int id)
        {
            return await _context.Ziadanka.Include(z => z.IdPouzivatelNavigation).SingleOrDefaultAsync(z => z.IdUser == id);

        }

        public void InsertItem(Ziadanka item)
        {
            _context.Ziadanka.Add(item);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public void UpdateItem(Ziadanka item)
        {
           // nothing to change only mark entity that has been modifity 
            _context.Entry(item).State = EntityState.Modified;
        }

        public async Task<int> GetCountAsync()
        {
            return await _context.Ziadanka.CountAsync();
        }

        public async Task<Ziadanka> GetOriginItemAsync(decimal userId)
        {
            return await _context.Ziadanka.FindAsync(userId);
        }
    }
}