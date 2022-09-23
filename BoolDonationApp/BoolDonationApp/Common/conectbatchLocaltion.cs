using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BoolDonationApp.Common
{
    public class conectbatchLocaltion
    {
        public int BatchID { get; set; }
        [Display(Name = "Tên đợt hiến")]
        public string BatchName { get; set; }

        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Thời gian dự kiến hiến")]
        public Nullable<System.DateTime> Thoigianhien { get; set; }
        [Display(Name = "Người tạo đợt hiến máu")]
        public string Nguoitaohien { get; set; }
        public Nullable<int> StatusDothien { get; set; }
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:HH:mm}", ApplyFormatInEditMode = true)]
        [Display(Name = "Thời gian thêm đợt hiến hiến")]
        public Nullable<System.DateTime> Thoigianthemluothien { get; set; }
        [Display(Name = "Thời gian bắt đầu hiến")]
        [DataType(DataType.Time), DisplayFormat(DataFormatString = "{0:HH:mm}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> Thoigianbatdau { get; set; }
        [Display(Name = "Thời gian kết thúc hiến")]
        [DataType(DataType.Time), DisplayFormat(DataFormatString = "{0:HH:mm}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> Thoigianketthuc { get; set; }
        [Display(Name = "Số lượng dự kiến")]
        public Nullable<int> Soluongdukien { get; set; }
        public Nullable<int> Soluongdem { get; set; }
        public Nullable<int> idLocaltion { get; set; }
        public string CMND { get; set; }
        public string TenDiachi { get; set; }

    }
}