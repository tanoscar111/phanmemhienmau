using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using BoolDonationApp.Models;
using System.Data.SqlClient;
using System.Configuration;
using BoolDonationApp.Common;

namespace BoolDonationApp.Controllers
{
    public class BatchController : Controller
    {
        // GET: Batch
        BoodDonationAppEntities db = new BoodDonationAppEntities();
        [HttpGet]
        public ActionResult Index(string currentFilter, string searchString, int? page)
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
                var result = from batch in db.Batches
                             select batch;
                if (!String.IsNullOrEmpty(searchString))
                {
                    result = result.Where(x => x.BatchName.Contains(searchString));

                };
                if (page == null) page = 1;
                var links = result.OrderBy(x => x.BatchID).ToList();
                int pageSize = 5;
                int pageNumber = (page ?? 1);

                return View(links.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "User");
            }
        }
        public ActionResult ListofBatch(int? BatchID)
        {
            return View();
        }
        public ActionResult Create()
        {
            var lists = db.Locations.ToList();
            ViewBag.ListOfLocation = new SelectList(lists, "idLocaltion", "TenDiachi");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Batch b)
        {
            var lists = db.Locations.ToList();
            ViewBag.ListOfLocation = new SelectList(lists, "idLocaltion", "TenDiachi");
            var userssession = Session["UserNameSS"];
            String diachi = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["hienmauConnectionString"].ConnectionString);//conect DB
            con.Open(); // mở dB
            string sql = "select TenDiachi from Location where idLocaltion= '" + b.idLocaltion + "' ";
            SqlCommand cmd = new SqlCommand(sql, con);//connect

            SqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                diachi = dr.GetString(0);//đọc từng dòng vị trí thứ 0

            }

            dr.Dispose(); dr.Close();
            cmd.Dispose(); cmd.Clone();
            Batch bt = new Batch();

            string[] c = b.Thoigianhien.ToString().Split(' ');
            string newThoigianhien = c[0] + " 00:00:00";
            bt.Thoigianhien = Convert.ToDateTime(newThoigianhien);
            bt.Thoigianthemluothien = DateTime.Now;
            bt.Nguoitaohien = $"{ userssession}";
            string[] cStart = b.Thoigianbatdau.ToString().Split(' ');
            bt.Thoigianbatdau = Convert.ToDateTime(c[0] + " " + cStart[1] + " " + cStart[2]);
            string[] cFinish = b.Thoigianketthuc.ToString().Split(' ');
            bt.Thoigianketthuc = Convert.ToDateTime(c[0] + " " + cFinish[1] + " " + cFinish[2]);
            bt.idLocaltion = b.idLocaltion;
            var totalsoluong = Math.Round(Convert.ToDouble(b.Soluongdukien + (b.Soluongdukien * 20 / 100)), 0, MidpointRounding.ToEven);
            bt.Soluongdukien = Convert.ToInt32(totalsoluong);
            bt.BatchName = $"Lúc {DateTime.Parse(b.Thoigianbatdau.ToString()).ToString("HH:mm")} đến {DateTime.Parse(b.Thoigianketthuc.ToString()).ToString("HH:mm")},Ngày {Convert.ToDateTime(b.Thoigianhien).ToString("dd/MM/yyyy")} tại {diachi}";
            db.Batches.Add(bt);
            db.SaveChanges();
            return RedirectToAction("Index", "Batch");
        }
        public ActionResult Edit(int id)
        {

            return View(db.Batches.Where(x => x.BatchID == id).FirstOrDefault());
        }

        // POST: ErrorsProduct/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Batch b)
        {
            try
            {
                String diachi = "";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["hienmauConnectionString"].ConnectionString);//conect DB
                con.Open(); // mở dB
                string sql = "select TenDiachi from Location where BatchID= '" + b.idLocaltion + "' ";
                SqlCommand cmd = new SqlCommand(sql, con);//connect

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    diachi = dr.GetString(0);//đọc từng dòng vị trí thứ 0

                }

                dr.Dispose(); dr.Close();
                cmd.Dispose(); cmd.Clone();


                Batch bt = db.Batches.Where(x => x.BatchID == id).FirstOrDefault();

                bt.BatchName = $"Lúc {DateTime.Parse(b.Thoigianbatdau.ToString()).ToString("HH:mm")} đến {DateTime.Parse(b.Thoigianketthuc.ToString()).ToString("HH:mm")},Ngày {Convert.ToDateTime(b.Thoigianhien).ToString("dd/MM/yyyy")} tại {diachi}";

                bt.Thoigianhien = b.Thoigianhien;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        [HttpGet]
        public ActionResult ListBatch(int id, string currentFilter, string searchString, int? page, DateTime? fromDate, DateTime? toDate)

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
                              join us in db.Users
                              on bo.IdUser equals us.IdUser
                              join bat in db.Batches
                              on bo.BatchID equals bat.BatchID
                              

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
                                  BatchName = bat.BatchName,
                                  Thoigianhien = bat.Thoigianhien,
                                  Thoigianketthuc = bat.Thoigianketthuc,
                                  BatchID=bat.BatchID

                              }); ;


                if (!String.IsNullOrEmpty(searchString))
                {
                    result = result.Where(s => s.Hovaten.Contains(searchString) || searchString == null || s.Email.Contains(searchString) || s.DiaChi.Contains(searchString) || s.Phone.Contains(searchString) || s.CMND.Contains(searchString));

                }
                else if (fromDate.HasValue || toDate.HasValue)
                {
                    if (!fromDate.HasValue) fromDate = DateTime.Now.Date;
                    if (!toDate.HasValue) toDate = fromDate.GetValueOrDefault(DateTime.Now.Date).Date.AddDays(1);
                    if (toDate < fromDate) toDate = fromDate.GetValueOrDefault(DateTime.Now.Date).Date.AddDays(1);
                    ViewBag.fromDate = fromDate;
                    ViewBag.toDate = toDate;
                    result = result.Where(s => s.Thoigianhien >= fromDate && s.Thoigianhien <= toDate || s.Thoigianketthuc >= fromDate && s.Thoigianketthuc <= toDate);
                };
                if (page == null) page = 1;
                var links = result.Where(s => s.BatchID == id).ToList();
                var count = links.Count();
                int pageSize = 5;
                int pageNumber = (page ?? 1);

                return View(links.ToPagedList(pageNumber, pageSize));
            }
            else
            {
                return RedirectToAction("Login", "User");
            }
        } 
            public ActionResult Delete(int id)
        {
            Batch bt = db.Batches.Where(x => x.BatchID == id).FirstOrDefault();
            {
                db.Batches.Remove(bt);
                db.SaveChanges();
               
                return RedirectToAction("Index", "Batch");
            }

            return new EmptyResult();
        }
    }
}