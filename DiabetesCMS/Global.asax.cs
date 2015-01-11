using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace DiabetesCMS
{
    public class Global : System.Web.HttpApplication
    {
        protected void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("cms-add-new-article",
                "addnewarticle",
                "~/dashboard.aspx", true,
                 new RouteValueDictionary { 
                { "view", "addnewarticle"}
            });

            routes.MapPageRoute("cms-view-articles-by-category",
                "articles/category/{categoryid}",
                "~/dashboard.aspx", true,
                 new RouteValueDictionary { });

            routes.MapPageRoute("cms-add-new-category",
                "addcategory",
                "~/dashboard.aspx", true,
                 new RouteValueDictionary { 
                { "view", "addnewcategory"}
            });

            routes.MapPageRoute("cms-view-article-board",
                "articlesboard",
                "~/dashboard.aspx", true,
                 new RouteValueDictionary { });

            routes.MapPageRoute("cms-edit-article",
                "article/edit/{articleid}",
                "~/dashboard.aspx", true,
                 new RouteValueDictionary { 
                { "view", "editarticle"}
            });

            routes.Ignore("Language/assets/{*pathInfo}");
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}