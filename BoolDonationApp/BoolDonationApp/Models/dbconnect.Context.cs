﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BoodDonationAppEntities : DbContext
    {
        public BoodDonationAppEntities()
            : base("name=BoodDonationAppEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Batch> Batches { get; set; }
        public virtual DbSet<BloodDonation> BloodDonations { get; set; }
        public virtual DbSet<BloodDonation_Detail> BloodDonation_Detail { get; set; }
        public virtual DbSet<Ketquakham> Ketquakhams { get; set; }
        public virtual DbSet<Khamsanloc> Khamsanlocs { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Log> Logs { get; set; }
        public virtual DbSet<Phuong> Phuongs { get; set; }
        public virtual DbSet<Quan> Quans { get; set; }
        public virtual DbSet<QuocGia> QuocGias { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Tinh> Tinhs { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}