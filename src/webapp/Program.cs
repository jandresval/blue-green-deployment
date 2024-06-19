var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");

var settingsFile = environment == "Production" ? "appsettings.json" : "appsettings.Development.json";

var config = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile(settingsFile, optional: false, reloadOnChange: true)
    .AddEnvironmentVariables()
    .Build();

var appSettings = config.Get<AppSettings>();

var builder = WebApplication.CreateBuilder(args);

var  MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy  =>
                      {
                          policy.AllowAnyOrigin() 
                                .AllowAnyMethod()
                                .AllowAnyHeader();
                      });
});

builder.Services.AddSingleton<DatabaseContext>(_ => new DatabaseContext(appSettings!));
builder.Services.AddScoped<GreetingRepository>();

var app = builder.Build();

app.UseCors();

app.MapGet("/greeting", (GreetingRepository greetingRepository) => greetingRepository.GetGreeting()).RequireCors(MyAllowSpecificOrigins);

app.MapGet("/", () => $"Hello World!");

app.Run();