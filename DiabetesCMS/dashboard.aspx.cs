using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DiabetesCMS.lib;

namespace DiabetesCMS
{
    public partial class dashboard : System.Web.UI.Page
    {

        public string view;
        public string View
        {
            get
            {
                if (string.IsNullOrEmpty(view) && Page.RouteData.Values["view"] != null)
                {
                    view = Page.RouteData.Values["view"].ToString();
                }
                return view;
            }
            set
            {
                view = value;
            }
        }

        private string categoryid;
        protected string CategoryId
        {
            get
            {
                if (String.IsNullOrEmpty(categoryid) && Page.RouteData.Values["categoryid"] != null)
                {
                    categoryid = Page.RouteData.Values["categoryid"].ToString();
                }
                return categoryid;
            }
        }

        private string articleId;
        protected string ArticleId
        {
            get
            {
                if (String.IsNullOrEmpty(articleId) && Page.RouteData.Values["articleId"] != null)
                {
                    articleId = Page.RouteData.Values["articleId"].ToString();
                }
                return articleId;
            }
        }


        protected SqlConnection conn = new SqlConnection();
        protected SqlCommand query = new SqlCommand();
        protected SqlDataReader data = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DetermineControlToLoad();
            }
            else if (View == "editarticle") // THIS IS A HACK CAUSE ITS 01:25 AND WANT TO FIX IT TO GO TO SLEEP
            {
                editArticle uc_editArticle = (editArticle)LoadControl("~/editArticle.ascx");
                uc_editArticle.articleId = Convert.ToInt32(ArticleId);
                editArticle.Controls.Add(uc_editArticle);
            }
        }

        private void DetermineControlToLoad()
        {
            if (String.IsNullOrEmpty(View))
                LoadHome();
            else if (View == "editarticle")
            {
                editArticle uc_editArticle = (editArticle)LoadControl("~/editArticle.ascx");
                uc_editArticle.articleId = Convert.ToInt32(ArticleId);
                editArticle.Controls.Add(uc_editArticle);
            }
        }

        private void LoadHome()
        {
            ConfigureConnection();
            if (AreCategoryAndArticleTableEmpty())
                View = "norecords";
            else
            {
                View = "articlesboard";
                loadArticleBoard();
            }
        }

        private void loadArticleBoard()
        {
            articlesBoard a_board = (articlesBoard)LoadControl("~/articlesBoard.ascx");
            a_board.Category_Id = CategoryId;
            articlesboard_two.Controls.Add(a_board);
        }

        private bool AreCategoryAndArticleTableEmpty()
        {
            if (library.isArticleTableEmpty(conn, query) && library.isCategoryTableEmpty(conn, query))
                return true;
            return false;
        }

        private void ConfigureConnection()
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            query.Connection = conn;
        }
    }
}