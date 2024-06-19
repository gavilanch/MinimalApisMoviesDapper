using Dapper;
using Microsoft.Data.SqlClient;
using MinimalAPIsMovies.DTOs;
using MinimalAPIsMovies.Entities;
using System.Data;

namespace MinimalAPIsMovies.Repositories
{
    public class ActorsRepository : IActorsRepository
    {
        private readonly string connectionString;
        private readonly HttpContext httpContext;

        public ActorsRepository(IConfiguration configuration, 
            IHttpContextAccessor httpContextAccessor)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
            httpContext = httpContextAccessor.HttpContext!;
        }

        public async Task<int> Create(Actor actor)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                var id = await connection.QuerySingleAsync<int>("Actors_Create",
                    new { actor.Name, actor.DateOfBirth, actor.Picture },
                    commandType: CommandType.StoredProcedure);

                actor.Id = id;
                return id;
            }
        }

        public async Task<List<Actor>> GetAll(PaginationDTO pagination)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                var actors = await connection.QueryAsync<Actor>("Actors_GetAll",
                    new {pagination.Page, pagination.RecordsPerPage}
                    ,commandType: CommandType.StoredProcedure);

                var actorsCount = await connection.QuerySingleAsync<int>("Actors_Count",
                    commandType: CommandType.StoredProcedure);

                httpContext.Response.Headers.Append("totalAmountOfRecords", actorsCount.ToString());

                return actors.ToList();
            }
        }

        public async Task<Actor?> GetById(int id)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                var actor = await connection.QueryFirstOrDefaultAsync<Actor>("Actors_GetById",
                    new { id }, commandType: CommandType.StoredProcedure);
                return actor;
            }
        }

        public async Task<bool> Exist(int id)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                var exists = await connection.QuerySingleAsync<bool>("Actors_Exist",
                    new { id }, commandType: CommandType.StoredProcedure);
                return exists;
            }
        }

        public async Task<List<int>> Exists(List<int> ids)
        {
            var dt = new DataTable();
            dt.Columns.Add("Id", typeof(int));

            foreach (var id in ids)
            {
                dt.Rows.Add(id);
            }

            using (var connection = new SqlConnection(connectionString))
            {
                var idsOfExistingActors = await connection.QueryAsync<int>
                    ("Actors_GetBySeveralIds", new { actorsIds = dt },
                    commandType: CommandType.StoredProcedure);
                return idsOfExistingActors.ToList();
            }
        }

        public async Task Update(Actor actor)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.ExecuteAsync("Actors_Update", new
                {
                    actor.Id,
                    actor.Name,
                    actor.DateOfBirth,
                    actor.Picture
                }, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task Delete(int id)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.ExecuteAsync("Actors_Delete",
                    new { id }, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<Actor>> GetByName(string name)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                var actors = await connection.QueryAsync<Actor>("Actors_GetByName",
                    new { name }, commandType: CommandType.StoredProcedure);

                return actors.ToList();
            }
        }
    }
}
