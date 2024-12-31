using Dapper;
using Microsoft.Data.SqlClient;
using MinimalAPIsMovies.Entities;
using System.Data;

namespace MinimalAPIsMovies.Repositories
{
    public class ErrorsRepository : IErrorsRepository
    {
        private readonly string connectionString;

        public ErrorsRepository(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        public async Task<Guid> Create(Error error)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                error.Id = Guid.NewGuid();
                await connection.ExecuteAsync("Errors_Create", new
                {
                    error.Id,
                    error.ErrorMessage,
                    error.StackTrace,
                    error.Date
                }, commandType: CommandType.StoredProcedure);
                return error.Id;
            }
        }
    }
}
