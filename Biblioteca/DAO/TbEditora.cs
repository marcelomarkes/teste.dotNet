using System;
using System.Collections.Generic;

namespace DAO
{
    public partial class TbEditora
    {
        public int EdCod { get; set; }
        public string EdNome { get; set; }
        public int UsCod { get; set; }

        public TbUsuario UsCodNavigation { get; set; }
    }
}
