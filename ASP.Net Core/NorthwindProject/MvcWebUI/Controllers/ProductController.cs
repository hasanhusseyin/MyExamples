using Business.Abstract;
using Microsoft.AspNetCore.Mvc;
using MvcWebUI.Models;

namespace MvcWebUI.Controllers
{
    public class ProductController : Controller
    {

        private IProductService _prodctService;

        public ProductController(IProductService prodctService)
        {
            _prodctService = prodctService;
        }
        public IActionResult Index(int category)
        {
            var model = new ProductListViewModel
            {
                Products = category > 0
                ? _prodctService.GetByCategory(category)
                : _prodctService.GetAll()
            };
            return View(model);
        }
    }
}
