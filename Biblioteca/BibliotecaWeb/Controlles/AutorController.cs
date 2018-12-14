using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace BibliotecaWeb.Controlles
{
    public class AutorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}