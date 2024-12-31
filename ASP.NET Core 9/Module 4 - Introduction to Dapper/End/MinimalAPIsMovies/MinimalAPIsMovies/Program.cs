using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.OutputCaching;
using MinimalAPIsMovies.Endpoints;
using MinimalAPIsMovies.Entities;
using MinimalAPIsMovies.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Services zone - BEGIN

builder.Services.AddScoped<IGenresRepository, GenresRepository>();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(configuration =>
    {
        configuration.WithOrigins(builder.Configuration["allowedOrigins"]!).AllowAnyMethod()
        .AllowAnyHeader();
    });

    options.AddPolicy("free", configuration =>
    {
        configuration.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
    });
});

builder.Services.AddOutputCache();
builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Services zone - END

var app = builder.Build();
// Middlewares zone - BEGIN

//if (builder.Environment.IsDevelopment())
//{
   
//}
app.UseSwagger();
app.UseSwaggerUI();

app.UseCors();

app.UseOutputCache();

app.MapGet("/", () => "Hello, world");

app.MapGroup("/genres").MapGenres();

// Middlewares zone - END
app.Run();
