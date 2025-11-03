using Microsoft.AspNetCore.Mvc;
using TodoApp.Models;

[ApiController]
[Route("api/[controller]")]
public class TodoController : ControllerBase
{
  private static readonly List<TodoItem> _todos = new();

  [HttpGet]
  public IActionResult GetAll() => Ok(_todos);

  [HttpPost]
  public IActionResult Create(TodoItem newTodo)
  {
    newTodo.Id = _todos.Count + 1;
    _todos.Add(newTodo);
    return CreatedAtAction(nameof(GetAll), new { id = newTodo.Id }, newTodo);
  }

  [HttpPut("{id}")]
  public IActionResult Update(int id, TodoItem updatedTodo)
  {
    var todo = _todos.FirstOrDefault(t => t.Id == id);
    if (todo == null) return NotFound($"Todo with ID = {id} not found");

    todo.Title = updatedTodo.Title;
    todo.IsCompleted = updatedTodo.IsCompleted;
    return Ok(todo);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(int id)
  {
    var todo = _todos.FirstOrDefault(t => t.Id == id);
    if (todo == null) return NotFound($"Todo with id = {id} not found");

    _todos.Remove(todo);
    return NoContent();
  }
}
