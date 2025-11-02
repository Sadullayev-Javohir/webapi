using Microsoft.AspNetCore.Mvc;

namespace day1.WeApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class TimeController : ControllerBase
{
  [HttpGet]
  public IActionResult Get()
  {
    return Ok(new
    {
      utc = DateTime.UtcNow, local = DateTime.Now
    });
  }
}
