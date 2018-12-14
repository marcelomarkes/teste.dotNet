using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace BibliotecaWeb.Controlles
{
    public class AcessoController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }
    }
}