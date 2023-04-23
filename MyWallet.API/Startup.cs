using ControleFinanceiro.BLL.Models;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MyWallet.API;
using MyWallet.API.Extensions;
using MyWallet.API.Validacoes;
using MyWallet.API.ViewModels;
using MyWallet.BLL.Models;
using MyWallet.DAL;
using MyWallet.DAL.Interfaces;
using MyWallet.DAL.Repositorios;
using System.IO;
using System.Text;

namespace ControleFinanceiro.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }


        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<Contexto>(opcoes => opcoes.UseSqlServer(Configuration.GetConnectionString("ConexaoDB")));
            services.AddIdentity<Usuario, Funcao>().AddEntityFrameworkStores<Contexto>();

            services.ConfigurarSenhaUsuario();

            services.AddScoped<ICartaoRepositorio, CartaoRepositorio>();
            services.AddScoped<ICategoriaRepositorio, CategoriaRepositorio>();
            services.AddScoped<IDespesaRepositorio, DespesaRepositorio>();
            services.AddScoped<IReservaRepositorio, ReservaRepositorio>();
            services.AddScoped<ITipoMovimentacaoRepositorio, TipoMovimentacaoRepositorio>();
            services.AddScoped<IMetaRepositorio, MetaRepositorio>();
            services.AddScoped<IMesRepositorio, MesRepositorio>();
            services.AddScoped<IGanhosRepositorio, GanhoRepositorio>();
            services.AddScoped<IFuncaoRepositorio, FuncaoRepositorio>();
            services.AddScoped<IUsuarioRepositorio, UsuarioRepositorio>();
            services.AddScoped<IGraficoRepositorio, GraficoRepositorio>();

            services.AddTransient<IValidator<Categoria>, CategoriaValidator>();
            services.AddTransient<IValidator<Cartao>, CartaoValidator>();
            services.AddTransient<IValidator<Despesa>, DespesaValidator>();
            services.AddTransient<IValidator<Ganho>, GanhoValidator>();
            services.AddTransient<IValidator<Reserva>, ReservaValidator>();
            services.AddTransient<IValidator<TipoMovimentacao>, TipoMovimentacaoValidator>();
            services.AddTransient<IValidator<Meta>, MetaValidator>();

            services.AddTransient<IValidator<FuncoesViewModel>, FuncoesViewModelValidator>();
            services.AddTransient<IValidator<RegistroViewModel>, RegistroViewModelValidator>();
            services.AddTransient<IValidator<LoginViewModel>, LoginViewModelValidator>();
            services.AddTransient<IValidator<AtualizarUsuarioViewModel>, AtualizarUsuarioViewModelValidator>();

            services.AddCors();

            //services.AddSpaStaticFiles(diretorio =>
            //{
            //    diretorio.RootPath = "MyWallet-UI";
            //});

            var key = Encoding.ASCII.GetBytes(Settings.ChaveSecreta);
            services.AddAuthentication(opcoes =>
            {
                opcoes.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                opcoes.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
                .AddJwtBearer(opcoes =>
                {
                    opcoes.RequireHttpsMetadata = false;
                    opcoes.SaveToken = true;
                    opcoes.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ValidateIssuer = false,
                        ValidateAudience = false
                    };
                });

            services.AddControllers()
                .AddFluentValidation()
                .AddJsonOptions(opcoes =>
                {
                    opcoes.JsonSerializerOptions.IgnoreNullValues = true;
                })
                .AddNewtonsoftJson(opcoes =>
                {
                    opcoes.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
                });
            services.AddRazorPages();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "MyWallet", Version = "v1" });

                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = "Autenticação baseada em Json Web Token (JWT)",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });
            });
        }


        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseAuthentication();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                app.UseHsts();
            }

            app.UseCors(opcoes => opcoes
                                    .AllowAnyOrigin()
                                    .AllowAnyMethod()
                                    .AllowAnyHeader());

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseStaticFiles();

            //app.UseSpaStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseSwagger();

            app.UseSwaggerUI(c => {
                c.RoutePrefix = "swagger";
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
            });

            //app.UseSpa(spa =>
            //{
            //    spa.Options.SourcePath = Path.Combine(Directory.GetCurrentDirectory(), "MyWallet-UI");

            //    if (env.IsDevelopment())
            //    {
            //        spa.UseProxyToSpaDevelopmentServer($"http://localhost:4200/");
            //    }
            //});
        }
    }
}
