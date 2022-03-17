using System.Net.Http.Json;
using BlazorIntro.Models;

namespace BlazorIntro.Services
{
    public class JsonPlaceHolderApi : IApiService
    {
        private HttpClient _httpClient;

        public JsonPlaceHolderApi(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public Task<TodoItem[]> GetTodos()
        {
            return _httpClient.GetFromJsonAsync<TodoItem[]>(
                "https://jsonplaceholder.typicode.com/todos"
            );
        }
    }
}
