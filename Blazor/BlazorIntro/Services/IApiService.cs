using BlazorIntro.Models;

namespace BlazorIntro.Services
{
    public interface IApiService
    {
        public Task<TodoItem[]> GetTodos();
    }
}
