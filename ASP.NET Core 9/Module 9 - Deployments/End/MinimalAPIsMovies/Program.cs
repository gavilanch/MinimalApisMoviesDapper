using FluentValidation;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.OutputCaching;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MinimalAPIsMovies.Endpoints;
using MinimalAPIsMovies.Entities;
using MinimalAPIsMovies.Repositories;
using MinimalAPIsMovies.Services;
using MinimalAPIsMovies.Swagger;
using MinimalAPIsMovies.Utilities;

var builder = WebApplication.CreateBuilder(args);

// Services zone - BEGIN

builder.Services.AddTransient<IUserStore<IdentityUser>, UserStore>();
builder.Services.AddIdentityCore<IdentityUser>();
builder.Services.AddTransient<SignInManager<IdentityUser>>(); 

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

//builder.Services.AddOutputCache();
builder.Services.AddStackExchangeRedisOutputCache(options =>
{
    options.Configuration = builder.Configuration.GetConnectionString("redis");
});
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "Movies API",
        Description = "This is a web api for working with movie data",
        Contact = new Microsoft.OpenApi.Models.OpenApiContact
        {
            Email = "felipe@hotmail.com",
            Name = "Felipe Gavilán",
            Url = new Uri("https://gavilan.blog")
        },
        License = new Microsoft.OpenApi.Models.OpenApiLicense
        {
            Name = "MIT",
            Url = new Uri("https://opensource.org/license/mit/")
        }
    });

    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header
    });

    options.OperationFilter<AuthorizationFilter>();

    //options.AddSecurityRequirement(new OpenApiSecurityRequirement
    //{
    //    {
    //        new OpenApiSecurityScheme
    //        {
    //            Reference = new OpenApiReference
    //            {
    //                Type = ReferenceType.SecurityScheme,
    //                Id = "Bearer"
    //            }
    //        },
    //        new string[]{}
    //    }
    //});
});

builder.Services.AddScoped<IGenresRepository, GenresRepository>();
builder.Services.AddScoped<IActorsRepository, ActorsRepository>();
builder.Services.AddScoped<IMoviesRepository, MoviesRepository>();
builder.Services.AddScoped<ICommentsRepository, CommentsRepository>();
builder.Services.AddScoped<IErrorsRepository, ErrorsRepository>();
builder.Services.AddScoped<IUsersRepository, UsersRepository>();

builder.Services.AddTransient<IUsersService, UsersService>();
builder.Services.AddTransient<IFileStorage, AzureFileStorage>();
builder.Services.AddHttpContextAccessor();

builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddValidatorsFromAssemblyContaining<Program>();

builder.Services.AddProblemDetails();

builder.Services.AddAuthentication().AddJwtBearer(options =>
{
    options.MapInboundClaims = false;

    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = false,
        ValidateAudience = false,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ClockSkew = TimeSpan.Zero,
        IssuerSigningKeys = KeysHandler.GetAllKeys(builder.Configuration),
        //IssuerSigningKey = KeysHandler.GetKey(builder.Configuration).First() 
    };
});
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("isadmin", policy => policy.RequireClaim("isadmin"));
});


// Services zone - END

var app = builder.Build();
// Middlewares zone - BEGIN

app.UseSwagger();
app.UseSwaggerUI();

app.UseExceptionHandler(exceptionHandlerApp => exceptionHandlerApp.Run(async context =>
{
    var exceptionHandlerFeature = context.Features.Get<IExceptionHandlerFeature>();
    var exception = exceptionHandlerFeature?.Error!;

    var error = new Error();
    error.Date = DateTime.UtcNow;
    error.ErrorMessage = exception.Message;
    error.StackTrace = exception.StackTrace;

    var repository = context.RequestServices.GetRequiredService<IErrorsRepository>();
    await repository.Create(error);

    await Results.BadRequest(new
    {
        type = "error",
        message = "an unexpected exception has occurred",
        status = 500
    }).ExecuteAsync(context);
}));
app.UseStatusCodePages();

app.UseCors();

app.UseOutputCache();

app.UseAuthorization();

app.MapGet("/", () => "Hello, world from Azure DevOps - this works");
app.MapGet("/error", () =>
{
    throw new InvalidOperationException("example error");
});

app.MapPost("/modelbinding/{name}", ([FromRoute] string? name) =>
{
    if (name is null) name = "Empty";
    return TypedResults.Ok(name);
});

app.MapGroup("/genres").MapGenres();
app.MapGroup("/actors").MapActors();
app.MapGroup("/movies").MapMovies();
app.MapGroup("/movie/{movieId:int}/comments").MapComments();
app.MapGroup("/users").MapUsers();

// Middlewares zone - END
app.Run();
