using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contacto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) //si es la primera vez que carga la pagina
        {
            string from = Request.Form["contact_email"].ToString();
            string nombre = Request.Form["contact_name"].ToString();
            string personas = Request.Form["contact_personas"].ToString();
            string extra = Request.Form["contact_adicionales"].ToString();
            string fecha = Request.Form["contact_fecha"].ToString();
            string hora = Request.Form["contact_hora"].ToString();

            string subject = nombre + "Fecha: " + fecha + ". Hora:" + hora + ". Personas: " + (int.Parse(personas) + int.Parse(extra)).ToString();

            string mensaje = "El cliene " + nombre + "he realizadouna reservacion para el dia: " + "fecha: " + fecha + "a las: " + hora + " hrs para " + "Personas: " + (int.Parse(personas) + int.Parse(extra).ToString()).ToString();

            string resultado = sendGmail(from, subject, mensaje);
            lblestado.Text = resultado;
        }
    }

    private string sendGmail(string from, string subject, string mensaje)
    {
        SmtpClient client = new SmtpClient();
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true; //Socket Secure Layer http
        client.Host = "smtp.gmail.com";
        client.Port =  587;

        //Nos autenticamos en el SMTP
        System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("carlosrodrigoatl@gmail.com", "Cragt*92");
        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        //Creamos nuestro correo
        MailMessage oMail = new MailMessage();
        oMail.From = new MailAddress(from);
        oMail.To.Add(new MailAddress("javier"));
        oMail.CC.Add(from);
        oMail.Subject = subject;
        oMail.IsBodyHtml = true;
        oMail.Priority = MailPriority.Low;
        oMail.Body = "<h1>Reservacion</h1><p style=color: red;>" + mensaje + "</p>";

        //oMail.Body = mensaje;
        try
        {
            client.Send(oMail);
            return "Correo enviado";
        }
        catch (Exception ex)
        {
            return "Error en el envio" + ex.Message;
        }
    }
}