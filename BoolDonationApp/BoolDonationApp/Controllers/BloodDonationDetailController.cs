using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BoolDonationApp.Models;
using BoolDonationApp.Common;
using PagedList;
using OfficeOpenXml;

namespace BoolDonationApp.Controllers
{
    public class BloodDonationDetailController : Controller
    {
        // GET: BloodDonationDetail
        BoodDonationAppEntities db = new BoodDonationAppEntities();


        [HttpGet]
        public ActionResult Index(string currentFilter, string searchString, int? page, int? BatchID)
        {
            var userssession = Session["UserNameSS"];
            if (userssession != null)
            {
                if (searchString != null)
                {
                    page = 1;
                }
                else
                {
                    searchString = currentFilter;
                }
                ViewBag.CurrentFilter = searchString;
                var result = (from bo in db.BloodDonations
                              join us in db.Users on bo.IdUser equals us.IdUser
                              join bat in db.Batches on bo.BatchID equals bat.BatchID
                              select new connectBoodandUserbatch
                              {
                                  BloodID = bo.BloodID,
                                  IdUser = us.IdUser,
                                  Hovaten = bo.Hovaten,
                                  NgaySinh = bo.NgaySinh,
                                  Phone = bo.Phone,
                                  DiaChi = bo.DiaChi,
                                  Email = bo.Email,
                                  UserName = us.UserName,
                                  NhomMau = bo.NhomMau,
                                  Solanhienmau = bo.Solanhienmau,
                                  CMND = bo.CMND,
                                  gioitinh = bo.gioitinh,
                                  IsActive = bo.IsActive,
                                  BatchID = bat.BatchID,
                                  BatchName = bat.BatchName,
                                  Thoigianhien = bat.Thoigianhien,
                                  Nguoitaohien = bat.Nguoitaohien,



                              });
                if (!String.IsNullOrEmpty(searchString))
                {
                    result = result.Where(s => s.Hovaten.Contains(searchString) || searchString == null || s.Email.Contains(searchString) || s.DiaChi.Contains(searchString) || s.Phone.Contains(searchString) || s.CMND.Contains(searchString));

                };
                if (page == null) page = 1;
                var links = result.Where(s => s.BatchID == BatchID).ToList();
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                return View(links.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "User");
            }

            }
        public ActionResult Details(int BatchID)
        {
            var result = (from bo in db.BloodDonations
                          join us in db.Users on bo.IdUser equals us.IdUser
                          join bat in db.Batches on bo.BatchID equals bat.BatchID
                          select new connectBoodandUserbatch
                          {
                              BloodID = bo.BloodID,
                              IdUser = us.IdUser,
                              Hovaten = bo.Hovaten,
                              NgaySinh = bo.NgaySinh,
                              Phone = bo.Phone,
                              DiaChi = bo.DiaChi,
                              Email = bo.Email,
                              UserName = us.UserName,
                              NhomMau = bo.NhomMau,
                              Solanhienmau = bo.Solanhienmau,
                              CMND = bo.CMND,
                              gioitinh = bo.gioitinh,
                              IsActive = bo.IsActive,
                              BatchID = bat.BatchID,
                              BatchName = bat.BatchName,
                              Thoigianhien = bat.Thoigianhien,
                              Nguoitaohien = bat.Nguoitaohien,
                          });

            return View(result.Where(s => s.BatchID == BatchID).FirstOrDefault());
        }
    }
    



}