using Microsoft.AspNetCore.Mvc;

namespace EdoSign.Lab_3.Controllers
{
    public class ClientsController : Controller
    {
        public IActionResult Index()
        {
            return View(); // просто контейнер, який вирішує V1/V2
        }

        public IActionResult IndexV1()
        {
            return View();
        }

        public IActionResult IndexV2()
        {
            return View();
        }
    }
}


