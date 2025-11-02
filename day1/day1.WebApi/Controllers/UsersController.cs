using Microsoft.AspNetCore.Mvc;
using day1.WebApi.Models;

namespace day1.WebApi.Controllers;
[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
  private static readonly List<User> Users = new()
  {
    new User {Id = 1, Name = "Alice"},
    new User {Id = 2, Name = "Bob"},
    new User {Id = 3, Name = "Charlie"}
  };

  [HttpGet]
  public IActionResult GetAll() => Ok(Users);

  [HttpGet("{id}")]
  public IActionResult GetById(int id)
  {
    var user = Users.FirstOrDefault(u => u.Id == id);
    if (user == null) return NotFound(new { message = "User not found" });
    return Ok(user);
  }

  [HttpPost]
  public IActionResult Create([FromBody] User newUser)
  {
    newUser.Id = Users.Max(u => u.Id) + 1;
    Users.Add(newUser);
    return CreatedAtAction(nameof(GetById), new { id = newUser.Id }, newUser);
  }
}
