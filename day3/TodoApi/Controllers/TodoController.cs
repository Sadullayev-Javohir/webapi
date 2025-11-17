using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using TodoApi.Models;
using TodoApi.Data;
using TodoApi.DTOs;
using AutoMapper;

namespace TodoApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class TodoController : Controller
{
  private readonly AppDbContext _dbcontext;
  private readonly IMapper _mapper;

  public TodoController(AppDbContext dbcontext, IMapper mapper)
  {
    _dbcontext = dbcontext;
    _mapper = mapper;
  }

  [HttpGet]
  public async Task<ActionResult<IEnumerable<TodoItemDto>>> GetTodos()
  {
    var todos = await _dbcontext.TodoItems.ToListAsync();
    return Ok(_mapper.Map<IEnumerable<TodoItemDto>>(todos));
  }

  [HttpPost]
  public async Task<ActionResult<TodoItemDto>> CreateTodo(TodoItemDto dto)
  {
    var todo = _mapper.Map<TodoItem>(dto);
    _dbcontext.TodoItems.Add(todo);
    await _dbcontext.SaveChangesAsync();
    return CreatedAtAction(nameof(GetTodos), new {id = todo.Id}, _mapper.Map<TodoItemDto>(todo));
  }
}

