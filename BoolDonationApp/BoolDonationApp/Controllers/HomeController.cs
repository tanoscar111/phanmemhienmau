using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BoolDonationApp.Models;
using BoolDonationApp.Common;
using PagedList;
using OfficeOpenXml;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using QRCoder;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace BoolDonationApp.Controllers
{
    public class HomeController : Controller
    {
        BoodDonationAppEntities db = new BoodDonationAppEntities();


        [HttpGet]
        public ActionResult Index(string currentFilter, string searchString, int? page, DateTime? fromDate, DateTime? toDate)
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
                                  BatchID = bat.BatchID
                              });


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
                var links = result.OrderBy(x => x.BloodID).ToList();
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

        public void ExportToExcel()
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
                              BatchName = bat.BatchName,
                              Thoigianhien = bat.Thoigianhien,


                          }).ToList();
            ExcelPackage pck = new ExcelPackage();
            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Report");
            ws.Cells["A6"].Value = "BloodID";
            ws.Cells["B6"].Value = "Hovaten";
            ws.Cells["C6"].Value = "Email";
            ws.Cells["D6"].Value = "Phone";
            ws.Cells["E6"].Value = "NgaySinh";
            ws.Cells["F6"].Value = "DiaChi";
            ws.Cells["G6"].Value = "UserName";
            ws.Cells["H6"].Value = "NhomMau";
            ws.Cells["I6"].Value = "Solanhienmau";
            ws.Cells["J6"].Value = "CMND";
            ws.Cells["K6"].Value = "gioitinh";
            ws.Cells["L6"].Value = "IsActive";
            ws.Cells["M6"].Value = "BatchName";
            ws.Cells["N6"].Value = "Thoigianhien";
            int rowStart = 7;
            foreach (var item in result)
            {
                ws.Cells[string.Format("A{0}", rowStart)].Value = item.BloodID;
                ws.Cells[string.Format("B{0}", rowStart)].Value = item.Hovaten;
                ws.Cells[string.Format("C{0}", rowStart)].Value = item.Email;
                ws.Cells[string.Format("D{0}", rowStart)].Value = item.Phone;
                ws.Cells[string.Format("E{0}", rowStart)].Value = item.NgaySinh;
                ws.Cells[string.Format("F{0}", rowStart)].Value = item.DiaChi;
                ws.Cells[string.Format("G{0}", rowStart)].Value = item.UserName;
                ws.Cells[string.Format("H{0}", rowStart)].Value = item.NhomMau;
                ws.Cells[string.Format("I{0}", rowStart)].Value = item.Solanhienmau;
                ws.Cells[string.Format("J{0}", rowStart)].Value = item.CMND;
                ws.Cells[string.Format("K{0}", rowStart)].Value = item.gioitinh;
                ws.Cells[string.Format("L{0}", rowStart)].Value = item.IsActive;
                ws.Cells[string.Format("M{0}", rowStart)].Value = item.BatchName;
                ws.Cells[string.Format("N{0}", rowStart)].Value = item.Thoigianhien;

                rowStart++;

            }
            ws.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename=" + "ExcelReport.xlsx");
            Response.BinaryWrite(pck.GetAsByteArray());
            Response.End();

        }
        [HttpGet]
        public ActionResult FormHienMau(Tinh t, Quan q)
        {

            var lists = db.Batches.ToList();
            var listPhuong = db.Phuongs.ToList();
            var listQuan = db.Quans.ToList();
            var listTinh = db.Tinhs.ToList();
            var listQuocGia = db.QuocGias.ToList();
            ViewBag.ListOfBatch = new SelectList(lists, "BatchID", "BatchName");
            ViewBag.ListOfPhuong = new SelectList(listPhuong, "IDPhuong", "TenP", q.IDQuan);
            ViewBag.ListOfQuan = new SelectList(listQuan, "IDQuan", "TenQ", t.IDTinh);
            ViewBag.ListOfTinh = new SelectList(listTinh, "IDTinh", "TenT");
            ViewBag.ListOfQuocGia = new SelectList(listQuocGia, "IDQuocGia", "TenQG");

            return View();

        }


        [HttpPost]
        public ActionResult FormHienMau(BloodDonation dbBlood, string Gioitinhform, Batch bats, BloodDonation_Detail dbbloodDetail)
        {
            var truecau1 = Request.Form["cau1true"];
            var falsecau1 = Request.Form["cau1false"];
            var truecau2 = Request.Form["cau2true"];
            var falsecau2 = Request.Form["cau2false"];
            var truecau3 = Request.Form["cau3true"];
            var falsecau3 = Request.Form["cau3false"];
            var truecau4 = Request.Form["cau4true"];
            var falsecau4 = Request.Form["cau4false"];
            var truecau5 = Request.Form["cau5true"];
            var falsecau5 = Request.Form["cau5false"];
            var truecau6 = Request.Form["cau6true"];
            var falsecau6 = Request.Form["cau6false"];
            var truecau7 = Request.Form["cau7true"];
            var falsecau7 = Request.Form["cau7false"];
            var truecau8 = Request.Form["cau8true"];
            var falsecau8 = Request.Form["cau8false"];
            var truecau9 = Request.Form["cau9true"];
            var falsecau9 = Request.Form["cau9false"];
            var truecau10 = Request.Form["cau10true"];
            var falsecau10 = Request.Form["cau10false"];
            var truecau11 = Request.Form["cau6true"];
            var falsecau11 = Request.Form["cau6false"];
            var truecau12 = Request.Form["cau12true"];
            var falsecau12 = Request.Form["cau12false"];
            var truecau13 = Request.Form["cau13true"];
            var falsecau13 = Request.Form["cau13false"];
            var truecau14 = Request.Form["cau14true"];
            var falsecau14 = Request.Form["cau14false"];
            var truecau15 = Request.Form["cau15true"];
            var falsecau15 = Request.Form["cau15false"];
            var truecau16 = Request.Form["cau16true"];
            var falsecau16 = Request.Form["cau16false"];
            var truecau17 = Request.Form["cau17true"];
            var falsecau17 = Request.Form["cau17false"];
            var truecau18 = Request.Form["cau18true"];
            var falsecau18 = Request.Form["cau18false"];
            var lists = db.Batches.ToList();
            var listPhuong = db.Phuongs.ToList();
            var listQuan = db.Quans.ToList();
            var listTinh = db.Tinhs.ToList();
            var listQuocGia = db.QuocGias.ToList();
            ViewBag.ListOfBatch = new SelectList(lists, "BatchID", "BatchName");
            ViewBag.ListOfPhuong = new SelectList(listPhuong, "IDPhuong", "TenP");
            ViewBag.ListOfQuan = new SelectList(listQuan, "IDQuan", "TenQ");
            ViewBag.ListOfTinh = new SelectList(listTinh, "IDTinh", "TenT");
            ViewBag.ListOfQuocGia = new SelectList(listQuocGia, "IDQuocGia", "TenQG");

            try
            {
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
                                  BatchID = bat.BatchID

                              }).Where(x => x.BatchID == dbBlood.BatchID).Count();

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["hienmauConnectionString"].ConnectionString);//conect DB
                con.Open();
                int soluongdemfinish = 0;


                string sqlsoluongdem = "select Soluongdukien from Batch where BatchID= '" + dbBlood.BatchID + "' ";

                SqlCommand cmdsoluongdem = new SqlCommand(sqlsoluongdem, con);//connect

                SqlDataReader drsoluongdem = cmdsoluongdem.ExecuteReader();


                while (drsoluongdem.Read())
                {
                    soluongdemfinish = drsoluongdem.GetInt32(0);//đọc từng dòng vị trí thứ 0

                }

                drsoluongdem.Dispose(); drsoluongdem.Close();
                cmdsoluongdem.Dispose(); cmdsoluongdem.Clone();

                var list = db.BloodDonations.ToList();
                if (list.Any(m => m.BatchID == dbBlood.BatchID) && result >= soluongdemfinish)
                {

                    ViewBag.Danger = "Đợt hiến máu đã đủ vui lòng chọn đợt hiến khác";
                    return View(dbBlood);
                }
                var listSelector = list.Any(m => m.Hovaten == dbBlood.Hovaten);

                if (listSelector)
                {
                    if (list.Any(m => m.BatchID == dbBlood.BatchID))
                    {

                        ViewBag.Danger = "Tài khoản đã tồn tại hoặc  vui lòng chọn đợt khác";
                        return View(dbBlood);
                    }


                }
                BloodDonation BD = new BloodDonation();
                BD.Hovaten = dbBlood.Hovaten;
                DateTime startTime = DateTime.Parse(dbBlood.NgaySinh.ToString());
                DateTime endTime = DateTime.Today;
                TimeSpan timespan = endTime.Subtract(startTime);
                var totalDays = timespan.TotalDays;
                var totalYears = Math.Truncate(totalDays / 365);
                var totalMonths = Math.Truncate((totalDays % 365) / 30);
                var remainingDays = Math.Truncate((totalDays % 365) % 30);
                if (Gioitinhform != null)
                {
                    BD.gioitinh = Convert.ToInt32(Gioitinhform);
                }
                else
                {
                    ViewBag.Danger = "Vui lòng chọn giới tính";
                    return View(dbBlood);
                }
                var gioitinhs = Convert.ToInt32(Gioitinhform);
                if ((gioitinhs == 1 && ((18 <= Convert.ToInt32(totalYears)) && (Convert.ToInt32(totalYears) <= 60))) || gioitinhs == 0 && ((18 <= Convert.ToInt32(totalYears)) && (Convert.ToInt32(totalYears) <= 55)))
                {
                    BD.NgaySinh = dbBlood.NgaySinh;
                }
                else
                {
                    ViewBag.Danger = "Bạn đã chưa đủ tuổi hoặc quá tuổi đăng kí hiến máu";
                    return View(dbBlood);
                }
                BD.Phone = dbBlood.Phone;

                string BaID = dbBlood.BatchID.ToString();
                DateTime gFinish = Convert.ToDateTime("1900-01-01");
                DateTime thoigianhiens = Convert.ToDateTime("1900-01-01");
                String tenphuongs = "";
                String tentinhs = "";
                String tenquans = "";
                //DateTime timeBlood = Convert.ToDateTime("1900-01-01");
                // mở dB
                string sql = "select Thoigianketthuc from Batch where BatchID= '" + dbBlood.BatchID + "' ";
                string sqls = "select Thoigianhien from Batch where BatchID= '" + dbBlood.BatchID + "'";
                string tenphuong = "select TenP from Phuong where IDPhuong= '" + dbBlood.IDPhuong + "'";
                string tenquan = "select TenQ from Quan where IDQuan= '" + dbBlood.IDQuan + "'";
                string tentinh = "select TenT from Tinh where IDTinh= '" + dbBlood.IDTinh + "'";
                string tenqg = "select TenQG from QuocGia where IDQuocGia= '" + dbBlood.IDQuocGia + "'";
                SqlCommand cmd = new SqlCommand(sql, con);//connect

                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {
                    gFinish = dr.GetDateTime(0);//đọc từng dòng vị trí thứ 0

                }

                dr.Dispose(); dr.Close();
                cmd.Dispose(); cmd.Clone();


                SqlCommand cmdthoigianhien = new SqlCommand(sqls, con);
                SqlDataReader drthoigianhien = cmd.ExecuteReader();
                while (drthoigianhien.Read())
                {
                    thoigianhiens = drthoigianhien.GetDateTime(0);//đọc từng dòng vị trí thứ 0

                }

                drthoigianhien.Dispose(); drthoigianhien.Close();
                cmdthoigianhien.Dispose(); cmdthoigianhien.Clone();


                SqlCommand cmdtenphuong = new SqlCommand(tenphuong, con);
                SqlDataReader drtenphuong = cmdtenphuong.ExecuteReader();
                while (drtenphuong.Read())
                {

                    tenphuongs = drtenphuong.GetString(0);
                }
                drtenphuong.Dispose(); drtenphuong.Close();
                cmdtenphuong.Dispose(); cmdtenphuong.Clone();


                SqlCommand cmdtinh = new SqlCommand(tentinh, con);
                SqlDataReader drtentinh = cmdtinh.ExecuteReader();
                while (drtentinh.Read())
                {

                    tentinhs = drtentinh.GetString(0);
                }
                drtentinh.Dispose(); drtentinh.Close();
                cmdtinh.Dispose(); cmdtinh.Clone();


                SqlCommand cmdtenquan = new SqlCommand(tenquan, con);
                SqlDataReader drtenquan = cmdtenquan.ExecuteReader();
                while (drtenquan.Read())
                {

                    tenquans = drtenquan.GetString(0);
                }
                drtenquan.Dispose(); drtenquan.Close();
                cmdtenquan.Dispose(); cmdtenquan.Clone();

                int compare = DateTime.Compare(DateTime.Now.ToLocalTime(), gFinish);
                if (compare > 0)
                {
                    ViewBag.Danger = "Đã hết thời gian hiến máu vui lòng chọn đợt hiến máu khác";
                    return View(dbBlood);
                }
                BD.BatchID = dbBlood.BatchID;

                BD.Nest = dbBlood.Nest;
                BD.sonha = dbBlood.sonha;
                BD.duong = dbBlood.duong;
                BD.IDPhuong = dbBlood.IDPhuong;
                BD.IDQuan = dbBlood.IDQuan;
                BD.IDTinh = dbBlood.IDTinh;
                BD.IDQuocGia = dbBlood.IDQuocGia;
                BD.DiaChi = "Tổ" + dbBlood.Nest + "," + "Số nhà" + dbBlood.sonha + "," + "Đường" + dbBlood.duong + "," + tenphuongs + "," + tenquans + "," + tentinhs + "," + "Việt Nam";
                BD.Email = dbBlood.Email;
                BD.CMND = dbBlood.CMND;
                BD.NhomMau = dbBlood.NhomMau;
                BD.IsActive = 1;
                BD.Solanhienmau = 0;
                BD.IdUser = 1;
                BloodDonation_Detail bldt = new BloodDonation_Detail();

                bldt.BatchID = dbBlood.BatchID;
                bldt.CMND = dbBlood.CMND;
                bldt.Thoigianhien = thoigianhiens;
                db.BloodDonation_Detail.Add(bldt);
                db.SaveChanges();

                if (truecau1 != null)
                {
                    BD.truocdayquividatunghienmauchuacau1 = true;

                }
                else if (falsecau1 != null)
                {
                    BD.truocdayquividatunghienmauchuacau1 = false;
                }
                else if (truecau1 == null && falsecau1 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau2 != null)
                {
                    BD.tamthankinhcau2 = true;

                }
                else if (falsecau2 != null)
                {
                    BD.tamthankinhcau2 = false;
                }
                else if (truecau2 == null && falsecau2 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau2 != null)
                {
                    BD.tamthankinhcau2 = true;

                }
                else if (falsecau2 != null)
                {
                    BD.tamthankinhcau2 = false;
                }
                else if (truecau2 == null && falsecau2 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau3 != null)
                {
                    BD.sutcan4kgcau3 = true;

                }
                else if (falsecau3 != null)
                {
                    BD.sutcan4kgcau3 = false;
                }
                else if (truecau3 == null && falsecau3 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau4 != null)
                {
                    BD.noihachkeodaicau4 = true;

                }
                else if (falsecau3 != null)
                {
                    BD.noihachkeodaicau4 = false;
                }
                else if (truecau4 == null && falsecau4 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau5 != null)
                {
                    BD.sutcan4kgcau3 = true;

                }
                else if (falsecau5 != null)
                {
                    BD.phauthuatcau5 = false;
                }
                else if (truecau5 == null && falsecau5 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau6 != null)
                {
                    BD.sutcan4kgcau3 = true;

                }
                else if (falsecau6 != null)
                {
                    BD.xamminhxolocau6 = false;
                }
                else if (truecau6 == null && falsecau6 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau7 != null)
                {
                    BD.duoctruyenmaucau7 = true;

                }
                else if (falsecau7 != null)
                {
                    BD.duoctruyenmaucau7 = false;
                }
                else if (truecau7 == null && falsecau7 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau8 != null)
                {
                    BD.sudungmatuycau8 = true;

                }
                else if (falsecau8 != null)
                {
                    BD.sudungmatuycau8 = false;
                }
                else if (truecau8 == null && falsecau8 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau9 != null)
                {
                    BD.quanhetinhduccau9 = true;

                }
                else if (falsecau9 != null)
                {
                    BD.quanhetinhduccau9 = false;
                }
                else if (truecau9 == null && falsecau9 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau10 != null)
                {
                    BD.quanhetinhducvoinguoidonggioicau10 = true;

                }
                else if (falsecau10 != null)
                {
                    BD.quanhetinhducvoinguoidonggioicau10 = false;
                }
                else if (truecau10 == null && falsecau10 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau11 != null)
                {
                    BD.tiemvacxinphongbenhcau11 = true;

                }
                else if (falsecau11 != null)
                {
                    BD.tiemvacxinphongbenhcau11 = false;
                }
                else if (truecau11 == null && falsecau11 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau12 != null)
                {
                    BD.songtrongvungcodichluuhanhcau12 = true;

                }
                else if (falsecau12 != null)
                {
                    BD.songtrongvungcodichluuhanhcau12 = false;
                }
                else if (truecau12 == null && falsecau12 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau3 != null)
                {
                    BD.sutcan4kgcau3 = true;

                }
                else if (falsecau12 != null)
                {
                    BD.bicumhonhucdausotcau13 = false;
                }
                else if (truecau13 == null && falsecau13 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau14 != null)
                {
                    BD.dungthuockhangsinhcau14 = true;

                }
                else if (falsecau14 != null)
                {
                    BD.dungthuockhangsinhcau14 = false;
                }
                else if (truecau14 == null && falsecau14 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau15 != null)
                {
                    BD.denkhamsuckhoelamxetnghiemchuarangcau15 = true;

                }
                else if (falsecau15 != null)
                {
                    BD.denkhamsuckhoelamxetnghiemchuarangcau15 = false;
                }
                else if (truecau15 == null && falsecau15 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau16 != null)
                {
                    BD.quivihienladoituongtantatcau16 = true;

                }
                else if (falsecau16 != null)
                {
                    BD.quivihienladoituongtantatcau16 = false;
                }
                else if (truecau16 == null && falsecau16 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau17 != null)
                {
                    BD.chihiendangnuoiconduoi12thangtuoicau17 = true;

                }
                else if (falsecau17 != null)
                {
                    BD.chihiendangnuoiconduoi12thangtuoicau17 = false;
                }
                else if (truecau17 == null && falsecau17 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }
                if (truecau18 != null)
                {
                    BD.chidatungcothaihoacsinhconchuacau18 = true;

                }
                else if (falsecau18 != null)
                {
                    BD.chidatungcothaihoacsinhconchuacau18 = false;
                }
                else if (truecau18 == null && falsecau18 == null)
                {
                    ViewBag.Danger = "Vui lòng trả lời câu hỏi ";
                    return View(dbBlood);
                }

                db.BloodDonations.Add(BD);
                db.SaveChanges();
                //return RedirectToAction("Index", "Home");
                var codecheck = dbBlood.BatchID + "|" + dbBlood.CMND;
                return (RedirectToAction("Qrcode", "Home", new { codecheck = codecheck }));


            }
            catch
            {
                return View(dbBlood);
            }
        }

        [HttpGet]
        public ActionResult Qrcode(string codecheck)
        {

            QRCodeGenerator qrcpdes = new QRCodeGenerator();
            QRCodeData qrcodedata = qrcpdes.CreateQrCode(codecheck, QRCodeGenerator.ECCLevel.Q);
            QRCode qrcodes = new QRCode(qrcodedata);
            using (MemoryStream memory = new MemoryStream())
            {
                using (Bitmap bitmap = qrcodes.GetGraphic(20))
                {
                    bitmap.Save(memory, ImageFormat.Png);
                    ViewBag.QrCodeImage = "data:image/png;base64," + Convert.ToBase64String(memory.ToArray());
                    ViewBag.Qrcodechecks = codecheck;
                }
            }
            return View();
        }
        [HttpGet]
        public ActionResult Details(int id)
        {

            return View(db.BloodDonations.Where(x => x.BloodID == id).FirstOrDefault());
        }
        [HttpGet]
        public ActionResult Khamsanloc(int id, int idBatch, string CMND)
        {

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
                              Thoigianketthuc = bat.Thoigianketthuc

                          });
            ViewBag.datimeBlood = db.BloodDonation_Detail.Where(x => x.BatchID == idBatch && x.CMND == CMND).ToList();

            var locationResult = (from bat in db.Batches
                                  join lo in db.Locations
                                  on bat.idLocaltion equals lo.idLocaltion
                                  select new conectbatchLocaltion
                                  {
                                      BatchID = bat.BatchID,
                                      TenDiachi = lo.TenDiachi
                                  });
            ViewBag.BloodLocation = locationResult.Where(x => x.BatchID == idBatch).ToList();
            Session["BloodID"] = id;
            Session["BatchID"] = idBatch;
            Session["cmnd"] = CMND;
            return View(result.Where(x => x.BloodID == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Khamsanloc(string Doituongform, string Hinhthucform, int? huyetsacto, int? tieucau, string luongmau350, string luongmau250, string veinkhongdat,string huyettuongdung, string Hsabgform, int? cannang, string ketluan,string lido)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["hienmauConnectionString"].ConnectionString);//conect DB
            con.Open();
            int idBloodDetail = 0;
            string sql = "select Blood_DetalID from BloodDonation_Detail where BatchID= '" + Convert.ToInt32(Session["BatchID"]) + "'and CMND= '" + Session["cmnd"] + "' ";
            SqlCommand cmd = new SqlCommand(sql, con);//connect

            SqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                idBloodDetail = dr.GetInt32(0);//đọc từng dòng vị trí thứ 0

            }

            dr.Dispose(); dr.Close();
            cmd.Dispose(); cmd.Clone();

            Khamsanloc ksl = new Khamsanloc();
            ksl.BloodID = Convert.ToInt32(Session["BloodID"]);
            ksl.BatchID = Convert.ToInt32(Session["BatchID"]);
            ksl.Blood_DetalID = idBloodDetail;
            ksl.doituonghienmau = Doituongform;
            ksl.hinhthuchienmau = Hinhthucform;
            if (luongmau350 == "on" && Hinhthucform == "Toàn phần")
            {
                if (Hinhthucform == "Toàn phần")
                {
                    ksl.Luongmau = 350;
                }
            }
            else
            {
                ksl.Luongmau = 0;
            }
            if (luongmau250 == "on")
            {
                if (Hinhthucform == "Toàn phần")
                {
                    ksl.Luongmau = 250;
                }
            }
            else
            {
                ksl.Luongmau = 0;
            }
            ksl.huyetsacto = huyetsacto;
            ksl.tieucau = tieucau;
            if (veinkhongdat == "on")
            {
                ksl.veinkhongdat = true;
                ksl.ketluan = ketluan;
            }
            if(huyettuongdung== "on")
            {
                ksl.huyettuongduc = true;

                ksl.ketluan = ketluan;
            }
            ksl.HBsAg = Hsabgform;
            

            var asdasd = "";
            return View();
        }


        public ActionResult Edit(int id)
        {
            var userssession = Session["UserNameSS"];
            if (userssession != null)
            {
                return View(db.BloodDonations.Where(x => x.BloodID == id).FirstOrDefault());
            }
            else
            {
                return RedirectToAction("Login", "User");
            }
        }

        // POST: ErrorsProduct/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, BloodDonation dbBlood, Log log, string Gioitinhform)
        {
            var userssession = Session["UserNameSS"];
            if (userssession != null)
            {

                BloodDonation product = db.BloodDonations.Where(x => x.BloodID == id).FirstOrDefault();
                product.Hovaten = dbBlood.Hovaten;
                product.NgaySinh = dbBlood.NgaySinh;
                product.Phone = dbBlood.Phone;
                product.DiaChi = dbBlood.DiaChi;
                product.Nest = dbBlood.Nest;
                product.sonha = dbBlood.sonha;
                product.duong = dbBlood.duong;
                product.IDPhuong = dbBlood.IDPhuong;
                product.IDQuan = dbBlood.IDQuan;
                product.IDTinh = dbBlood.IDTinh;
                product.IDQuocGia = dbBlood.IDQuocGia;
                product.NhomMau = dbBlood.NhomMau;
                product.Solanhienmau = dbBlood.Solanhienmau + 1;
                product.Email = dbBlood.Email;
                product.CMND = dbBlood.CMND;
                product.gioitinh = Convert.ToInt32(Gioitinhform);

                product.IsActive = 2;
                product.IdUser = 1;
                db.SaveChanges();
                Log logs = new Log();
                logs.Log_Time = DateTime.Now;
                logs.nguoithaotac = userssession.ToString();
                logs.action = "sửa";
                log.BloodID = dbBlood.BloodID;
                db.Logs.Add(logs);
                db.SaveChanges();

                return RedirectToAction("Index");

            }
            else
            {
                return RedirectToAction("Login", "User");
            }


        }
        [HttpGet]
        public ActionResult Susssess()
        {
            return View();

        }
        [HttpGet]
        public ActionResult history()
        {
            return View(db.Logs.ToList());

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            BloodDonation bt = db.BloodDonations.Where(x => x.BloodID == id).FirstOrDefault();


            if (bt != null)
            {
                db.BloodDonations.Remove(bt);
                db.SaveChanges();
                TempData["Message"] = " Customer deleted successfully.";
                return RedirectToAction("Index", "Home");
            }

            return new EmptyResult();
        }
        [HttpGet]
        public ActionResult SortBy()
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
                              Solanhienmau = bo.Solanhienmau + 1,
                              CMND = bo.CMND,
                              gioitinh = bo.gioitinh,
                              IsActive = bo.IsActive,
                              BatchName = bat.BatchName,
                              Thoigianhien = bat.Thoigianhien,


                          }); ;
            var sortByStatus = result.Where(x => x.IsActive == 1).OrderByDescending(x => x.IsActive).ToList();
            return View(sortByStatus);

        }
        [HttpGet]
        public ActionResult SortByNo()
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
                              Solanhienmau = bo.Solanhienmau + 1,
                              CMND = bo.CMND,
                              gioitinh = bo.gioitinh,
                              IsActive = bo.IsActive,
                              BatchName = bat.BatchName,
                              Thoigianhien = bat.Thoigianhien,


                          }); ;
            var sortByStatus = result.Where(x => x.IsActive == 2).OrderByDescending(x => x.IsActive).ToList();
            return View(sortByStatus);

        }
    }
}