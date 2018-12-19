using System;
using System.Collections.Generic;

namespace DAO
{
    public partial class TbCategoria
    {
        public int CtCod { get; set; }
        public string CtNome { get; set; }
        public int UsCod { get; set; }

        public TbUsuario UsCodNavigation { get; set; }
    }
}
