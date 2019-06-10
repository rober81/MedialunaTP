namespace DAL
{
    public class backupDAL
    {
        public static string hacerBackup()
        {
            Acceso acceso = new Acceso();
            string sql = @"backup database Medialunas to disk='c:\back\backup.sql'";
            int afectadas = acceso.ejecutarSQL(sql, null/* TODO Change to default(_) if this is not a reference type */);
            return afectadas.ToString();
        }

        public static string restaurarBackup()
        {
            Acceso acceso = new Acceso();
            string antes = "alter database Medialunas set offline with rollback immediate";
            string despues = "alter database Medialunas set online";
            string sql = @"restore database Medialunas from disk='c:\back\backup.sql'";
            int antesI = acceso.ejecutarSQL(antes, null);
            int afectadas = acceso.ejecutarSQL(sql, null);
            int despuesI = acceso.ejecutarSQL(despues, null);
            return "Antes: " + antesI + "Restore: " + afectadas + "Despues: " + despuesI;
        }
    }

}