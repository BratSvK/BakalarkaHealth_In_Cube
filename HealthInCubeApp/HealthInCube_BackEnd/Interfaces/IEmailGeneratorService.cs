using HealthInCube_BackEnd.Entities;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Interfaces
{
    /// <summary>
    /// Interface for email generator.
    /// </summary>
    public interface IEmailGeneratorService
    {
        /// <summary>
        /// Generate email for patient succesfull creation.
        /// </summary>
        /// <param name="userToPatient">The receiver of the email.(Patient)</param>
        Task GenerateEmailForPatientCreation(Pouzivatel userToPatient);

        /// <summary>
        /// Generate email for doctor succesfull activation.
        /// </summary>
        /// <param name="userToDoctor">The receiver of the email.(Doctor)</param>
        Task GenerateEmailForDoctorCreation(Pouzivatel userToDoctor);
    }
}
