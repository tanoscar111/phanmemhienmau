using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace BoolDonationApp.Common
{
    public class connectBoodandUserbatch
    {
        [Display(Name = "ID")]
         public int BloodID { get; set; }
        [Display(Name = "Họ và Tên")]
        [Required(ErrorMessage = "Vui lòng nhập Họ và Tên")]
        public string Hovaten { get; set; }
        [Display(Name = "Ngày sinh")]
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Required(ErrorMessage = "Vui lòng nhập ngày sinh")]
        public Nullable<System.DateTime> NgaySinh { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        [Display(Name = "Số điện thoại")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Số điện thoại không hợp lệ")]
        public string Phone { get; set; }
        [Display(Name = "Địa Chỉ ")]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ ")]
        public string DiaChi { get; set; }
        [Display(Name = "Email ")] [Required(ErrorMessage = "Vui lòng nhập địa chỉ Email")] [DataType(DataType.EmailAddress, ErrorMessage = "E-mail không hợp lệ")] 
        public string Email { get; set; }
        [Display(Name = "Nhóm máu ")]
        [Required(ErrorMessage = "Vui lòng nhập nhóm máu ")]
        public string NhomMau { get; set; }
        public Nullable<int> Solanhienmau { get; set; }
        [Display(Name = "Số CMND")]
        [Required(ErrorMessage = "Vui lòng nhập số CMND ")]
        public string CMND { get; set; }
        public int IdUser { get; set; }
        [Display(Name = "Giới tính ")]
        [Required(ErrorMessage = "Vui lòng nhập giới tính ")]
        public Nullable<int> gioitinh { get; set; }
        public int BatchID { get; set; }
        [Display(Name = "Trạng thái ")]
        public Nullable<int> IsActive { get; set; }
        [Display(Name = "Tên đợt hiến  ")]
        public string BatchName { get; set; }
        public Nullable<System.DateTime> Thoigianhien { get; set; }
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Thời gian thêm đợt hiến hiến")]
        public Nullable<System.DateTime> Thoigianthemluothien { get; set; }
        [Display(Name = "Người tạo đợt hiến máu")]
        public string Nguoitaohien { get; set; }
        [Display(Name = "Người tạo đợt hiến máu")]
        public string UserName { get; set; }
        [Display(Name = "Thời gian kết thúc hiến")]
        [DataType(DataType.Time), DisplayFormat(DataFormatString = "{0:HH:mm}", ApplyFormatInEditMode = true)]
        public int IDPhuong { get; set; }
        public string TenP { get; set; }
        public int IDQuan { get; set; }
        public string TenQ { get; set; }
        public int IDTinh { get; set; }
        public string TenT { get; set; }
        public int IDQuocGia { get; set; }
        public string TenQG { get; set; }
        public string Nest { get; set; }
        public string sonha { get; set; }
        public string duong { get; set; }
        public Nullable<System.DateTime> Thoigianketthuc { get; set; }
    }
}