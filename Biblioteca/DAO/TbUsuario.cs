using System;
using System.Collections.Generic;

namespace DAO
{
    public partial class TbUsuario
    {
        public TbUsuario()
        {
            TbAutor = new HashSet<TbAutor>();
            TbCategoria = new HashSet<TbCategoria>();
            TbEditora = new HashSet<TbEditora>();
        }

        public int UsCod { get; set; }
        public string UsLogin { get; set; }
        public string UsSenha { get; set; }

        public ICollection<TbAutor> TbAutor { get; set; }
        public ICollection<TbCategoria> TbCategoria { get; set; }
        public ICollection<TbEditora> TbEditora { get; set; }
    }
}
