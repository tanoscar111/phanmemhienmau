using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BoolDonationApp.Models;
namespace BoolDonationApp.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        BoodDonationAppEntities db = new BoodDonationAppEntities();
        public ActionResult Index()
        {
           
                return View(db.Users.ToList());
           
        }

   
        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(User dbuser)
        {

            if (db.Users.Any(x => x.UserName == dbuser.UserName && x.Password == dbuser.Password))
            {
                ViewBag.Notification = "Tài khoản đã tồn tại";
                return View();
            }

            else
            {
                User t = new User();
                t.RoleID = Int32.Parse("2");
                t.UserName = dbuser.UserName;
                t.Password = dbuser.Password;
                db.Users.Add(t);
                db.SaveChanges();
                Session["IdUserSS"] = dbuser.IdUser.ToString();
                Session["UserNameSS"] = dbuser.UserName.ToString();
                return RedirectToAction("Login", "User");
            }


        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login", "User");
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]

        public ActionResult Login(User dbuser)
        {
            var checkLogin = db.Users.SingleOrDefault(x => x.UserName == dbuser.UserName);
            if (checkLogin != null)
            {

                Session["IdRole"] = checkLogin.RoleID;
                Session["IdUserSS"] = checkLogin.IdUser.ToString();
                Session["UserNameSS"] = checkLogin.UserName.ToString();
                return RedirectToAction("Index", "Home");

            }
            else
            {
                ViewBag.Notification = "userName hoặc Password không đúng";
            }
            return View();

        }
        public ActionResult Edit(int id)
        {

            return View(db.Users.Where(x => x.IdUser == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(int id, User user)
        {
            try
            {

                User users = db.Users.Where(x => x.IdUser == id).FirstOrDefault();
                users.UserName = user.UserName;
                users.Password = user.Password;
                users.RoleID = user.RoleID;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Delete(int id)
        {
            User users = db.Users.Where(x => x.IdUser == id).FirstOrDefault();
            db.Users.Remove(users);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}