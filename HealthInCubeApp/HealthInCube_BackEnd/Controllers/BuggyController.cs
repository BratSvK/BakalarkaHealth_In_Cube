using HealthInCube_BackEnd.Data;
using HealthInCube_BackEnd.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HealthInCube_BackEnd.Controllers
{
    /// <summary>
    /// Generate 4 general errors.
    /// </summary>
    public class BuggyController : BaseApiController
    {
        private readonly HealthInCubeContext _context;
        public BuggyController(HealthInCubeContext context)
        {
            _context = context;
        }

        
        [Authorize]
        [HttpGet("auth")]
        public ActionResult<string> GetSecret()
        {
            return "secret text";
        }

        [HttpGet("not-found")]
        public ActionResult<Pouzivatel> GetNotFound()
        {
            var thing = _context.Users.Find(-1);

            if (thing == null) return NotFound();

            return Ok(thing);
        }
        [HttpGet("server-error")]
        public ActionResult<string> GetServerError()
        {
                var thing = _context.Users.Find(-1);
                // try to execute method at null object
                var thingToReturn = thing.ToString();         
                return thingToReturn;
        }
        [HttpGet("bad-request")]
        public ActionResult<string> GetBadRequest()
        {
            return BadRequest("This was not a good request");
        }

    }
}
