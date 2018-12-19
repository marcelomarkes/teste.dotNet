using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DAO
{
    public partial class Db_BibliotecaContext : DbContext
    {
        public Db_BibliotecaContext()
        {
        }

        public Db_BibliotecaContext(DbContextOptions<Db_BibliotecaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TbAutor> TbAutor { get; set; }
        public virtual DbSet<TbCategoria> TbCategoria { get; set; }
        public virtual DbSet<TbEditora> TbEditora { get; set; }
        public virtual DbSet<TbUsuario> TbUsuario { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-O9NT82F\\SQLEXPRESS;Initial Catalog=db_biblioteca;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TbAutor>(entity =>
            {
                entity.HasKey(e => e.AuCod);

                entity.ToTable("tb_autor");

                entity.Property(e => e.AuCod).HasColumnName("au_cod");

                entity.Property(e => e.AuNome)
                    .IsRequired()
                    .HasColumnName("au_nome")
                    .HasMaxLength(50);

                entity.Property(e => e.UsCod).HasColumnName("us_cod");

                entity.HasOne(d => d.UsCodNavigation)
                    .WithMany(p => p.TbAutor)
                    .HasForeignKey(d => d.UsCod)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tb_autor__us_cod__4BAC3F29");
            });

            modelBuilder.Entity<TbCategoria>(entity =>
            {
                entity.HasKey(e => e.CtCod);

                entity.ToTable("tb_categoria");

                entity.Property(e => e.CtCod).HasColumnName("ct_cod");

                entity.Property(e => e.CtNome)
                    .IsRequired()
                    .HasColumnName("ct_nome")
                    .HasMaxLength(50);

                entity.Property(e => e.UsCod).HasColumnName("us_cod");

                entity.HasOne(d => d.UsCodNavigation)
                    .WithMany(p => p.TbCategoria)
                    .HasForeignKey(d => d.UsCod)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tb_catego__us_co__3A81B327");
            });

            modelBuilder.Entity<TbEditora>(entity =>
            {
                entity.HasKey(e => e.EdCod);

                entity.ToTable("tb_editora");

                entity.Property(e => e.EdCod).HasColumnName("ed_cod");

                entity.Property(e => e.EdNome)
                    .IsRequired()
                    .HasColumnName("ed_nome")
                    .HasMaxLength(50);

                entity.Property(e => e.UsCod).HasColumnName("us_cod");

                entity.HasOne(d => d.UsCodNavigation)
                    .WithMany(p => p.TbEditora)
                    .HasForeignKey(d => d.UsCod)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tb_editor__us_co__5AEE82B9");
            });

            modelBuilder.Entity<TbUsuario>(entity =>
            {
                entity.HasKey(e => e.UsCod);

                entity.ToTable("tb_usuario");

                entity.Property(e => e.UsCod).HasColumnName("us_cod");

                entity.Property(e => e.UsLogin)
                    .IsRequired()
                    .HasColumnName("us_login")
                    .HasMaxLength(50);

                entity.Property(e => e.UsSenha)
                    .HasColumnName("us_senha")
                    .HasMaxLength(10);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
