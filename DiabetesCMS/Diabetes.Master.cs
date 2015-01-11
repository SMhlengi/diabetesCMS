using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiabetesCMS
{
    public partial class Diabetes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool status = Convert.ToBoolean(Session["loggedInStatus"]);
            string fileName = System.IO.Path.GetFileName(HttpContext.Current.Request.FilePath).ToLower();
            if (fileName != "default.aspx")
                if (status == false)
                    Response.Redirect("/");
        }
    }
}