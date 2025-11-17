using Microsoft.EntityFrameworkCore;
using TodoApi.Models;
using TodoApi.Data;
using TodoApi.DTOs;
using TodoApi.Profiles;
using TodoApi.Controllers;
using AutoMapper;

var builder = WebApplication.CreateBuilder();

builder.Services.AddDbContext<AppDbContext>(options => options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddAutoMapper(typeof(MappingProfile));

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
  app.UseSwagger();
  app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.MapControllers();

app.Run();
