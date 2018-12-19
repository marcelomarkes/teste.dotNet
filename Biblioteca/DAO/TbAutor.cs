using System;
using System.Collections.Generic;

namespace DAO
{
    public partial class TbAutor
    {
        public int AuCod { get; set; }
        public string AuNome { get; set; }
        public int UsCod { get; set; }

        public TbUsuario UsCodNavigation { get; set; }
    }
}
