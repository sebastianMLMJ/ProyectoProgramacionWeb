﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Proyecto.Models;

public partial class StoreContext : DbContext
{
    public StoreContext()
    {
    }

    public StoreContext(DbContextOptions<StoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Card> Cards { get; set; }

    public virtual DbSet<Contact> Contacts { get; set; }

    public virtual DbSet<Departamento> Departamentos { get; set; }

    public virtual DbSet<Municipio> Municipios { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAPTOP-01QD5BS8\\SQLEXPRESS; Database=store; Trusted_Connection=True; Encrypt=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Card>(entity =>
        {
            entity.HasKey(e => e.IdCard).HasName("PK__card__C71FE3671E2E3EC5");

            entity.ToTable("card");

            entity.Property(e => e.IdCard).HasColumnName("id_card");
            entity.Property(e => e.Cardtype)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("cardtype");
            entity.Property(e => e.ExpMonth)
                .HasMaxLength(2)
                .HasColumnName("exp_month");
            entity.Property(e => e.ExpYear)
                .HasMaxLength(2)
                .HasColumnName("exp_year");
            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.Number)
                .HasMaxLength(16)
                .HasColumnName("number");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Cards)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("fk_card_user");
        });

        modelBuilder.Entity<Contact>(entity =>
        {
            entity.HasKey(e => e.IdContact).HasName("PK__contact__3D4F725E9D796EE0");

            entity.ToTable("contact");

            entity.Property(e => e.IdContact).HasColumnName("id_contact");
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("first_name");
            entity.Property(e => e.HomeAddress)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("home_address");
            entity.Property(e => e.IdMunicipio).HasColumnName("id_municipio");
            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("last_name");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("phone_number");

            entity.HasOne(d => d.IdMunicipioNavigation).WithMany(p => p.Contacts)
                .HasForeignKey(d => d.IdMunicipio)
                .HasConstraintName("fk_contacts_municipio");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Contacts)
                .HasForeignKey(d => d.IdUser)
                .HasConstraintName("fk_contacts_user");
        });

        modelBuilder.Entity<Departamento>(entity =>
        {
            entity.HasKey(e => e.IdDepartamento).HasName("PK__departam__64F37A16486B3D7E");

            entity.ToTable("departamento");

            entity.Property(e => e.IdDepartamento).HasColumnName("id_departamento");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Municipio>(entity =>
        {
            entity.HasKey(e => e.IdMunicipio).HasName("PK__municipi__01C9EB9978D2368F");

            entity.ToTable("municipio");

            entity.Property(e => e.IdMunicipio).HasColumnName("id_municipio");
            entity.Property(e => e.IdDepartamento).HasColumnName("id_departamento");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");

            entity.HasOne(d => d.IdDepartamentoNavigation).WithMany(p => p.Municipios)
                .HasForeignKey(d => d.IdDepartamento)
                .HasConstraintName("fk_municipio_departamento");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.IdRole).HasName("PK__roles__3D48441DF82D3DA2");

            entity.ToTable("roles");

            entity.Property(e => e.IdRole).HasColumnName("id_role");
            entity.Property(e => e.Name)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("name");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.IdUser).HasName("PK__users__D2D146373A11AC40");

            entity.ToTable("users");

            entity.Property(e => e.IdUser).HasColumnName("id_user");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.IdRole).HasColumnName("id_role");
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("password");

            entity.HasOne(d => d.IdRoleNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.IdRole)
                .HasConstraintName("fk_user_rol");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
