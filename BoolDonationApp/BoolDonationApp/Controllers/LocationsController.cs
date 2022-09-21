using BoolDonationApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BoolDonationApp.Controllers
{
    public class LocationsController : Controller
    {
        BoodDonationAppEntities db = new BoodDonationAppEntities();
        public ActionResult Index()
        {

            return View(db.Locations.ToList());
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Create(Location b)
        {
            Location lct = new Location();
            lct.TenDiachi = b.TenDiachi;
            db.Locations.Add(lct);
            db.SaveChanges();
            return RedirectToAction("Index", "Locations");
        }
    }
}