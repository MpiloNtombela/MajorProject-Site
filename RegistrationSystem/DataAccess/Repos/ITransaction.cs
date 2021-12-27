using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationSystem.DataAccess.Repos
{
    public interface ITransaction
    {
        /// <summary>
        /// uses EF transaction
        /// </summary>
        /// <returns>DbContextTransaction</returns>
        DbContextTransaction DbTransaction();

        //DbContextTransaction UseTransaction();
    }
}
