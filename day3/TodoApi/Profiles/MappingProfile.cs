using AutoMapper;
using TodoApi.Models;
using TodoApi.DTOs;

namespace TodoApi.Profiles;

public class MappingProfile : Profile
{
  public MappingProfile()
  {
    CreateMap<TodoItem, TodoItemDto>().ReverseMap();
  }
}
