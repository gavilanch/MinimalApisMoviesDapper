using MinimalAPIsMovies.Entities;

namespace MinimalAPIsMovies.Repositories
{
    public interface IErrorsRepository
    {
        Task<Guid> Create(Error error);
    }
}