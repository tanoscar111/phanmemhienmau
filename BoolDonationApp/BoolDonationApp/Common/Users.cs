using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ErrorsApp.Common
{
    public partial class Users
    {
        public int IdUser { get; set; }
        [Display(Name = "Tên Đăng Nhập")]
        public string UserName { get; set; }
        [DataType(DataType.Password)]
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập")]
        public string Password { get; set; }
        [Display(Name = " Nhập lại Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Mật khẩu không trùng")]
        public string ConfirmPasswordUser { get; set; }
    }
}