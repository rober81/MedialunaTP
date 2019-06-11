using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace MedialunaTP
{
    public partial class bitacora : Base
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogueado(BLL.PermisosBLL.Admin());
            lblUsuario.Text = usuario.ToString();
            cargarBitacora();
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            usuarioNoLogueado();
        }

        private void cargarBitacora()
        {
            List<BE.Bitacora> lista = BLL.BitacoraBLL.listar();

            foreach (var item in lista)
            {
                TableRow fila = new TableRow();

                TableCell id = new TableCell();
                TableCell usuario = new TableCell();
                TableCell usuario2 = new TableCell();
                TableCell accion = new TableCell();
                TableCell fecha = new TableCell();

                id.Text = item.id.ToString();
                if (item.usuario != null)
                {
                    usuario.Text = item.usuario.login;
                    usuario2.Text = item.usuario.ToString();
                }
                accion.Text = item.accion;
                fecha.Text = item.fecha.ToString("dd/MM/yyyy H:mm:ss");

                fila.Cells.Add(id);
                fila.Cells.Add(usuario);
                fila.Cells.Add(usuario2);
                fila.Cells.Add(accion);
                fila.Cells.Add(fecha);
                tablaBitacora.Rows.Add(fila);
            }
        }
    }
}