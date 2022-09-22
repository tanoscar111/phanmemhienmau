//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BoolDonationApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Khamsanloc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Khamsanloc()
        {
            this.Ketquakhams = new HashSet<Ketquakham>();
        }
    
        public int KhamsanlocID { get; set; }
        public Nullable<int> BloodID { get; set; }
        public Nullable<int> Blood_DetalID { get; set; }
        public string doituonghienmau { get; set; }
        public string hinhthuchienmau { get; set; }
        public Nullable<int> huyetsacto { get; set; }
        public Nullable<int> tieucau { get; set; }
        public Nullable<bool> veinkhongdat { get; set; }
        public Nullable<int> cannang { get; set; }
        public Nullable<int> mach { get; set; }
        public Nullable<int> huyetaptamtruong { get; set; }
        public Nullable<int> huyetaptamthu { get; set; }
        public string tinhtranglamsan { get; set; }
        public string ketluan { get; set; }
        public string Lydo { get; set; }
        public string ktvketluan { get; set; }
        public Nullable<bool> HBV { get; set; }
        public Nullable<bool> HCV { get; set; }
        public Nullable<bool> HIV { get; set; }
        public Nullable<bool> Giangmai { get; set; }
        public Nullable<bool> HBsAg { get; set; }
        public Nullable<bool> huyettuongduc { get; set; }
        public string username { get; set; }
    
        public virtual BloodDonation BloodDonation { get; set; }
        public virtual BloodDonation_Detail BloodDonation_Detail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ketquakham> Ketquakhams { get; set; }
    }
}
