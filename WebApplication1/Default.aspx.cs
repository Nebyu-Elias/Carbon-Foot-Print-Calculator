using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can set the background image URL dynamically if needed
            string backgroundImageUrl = "D:\\class\\nidamco\\Programming Fundamentals\\C# Assignment\\image";

            // Set the background image using CSS
            Page.Header.Style.Add("background-image", $"url('{backgroundImageUrl}')");
            Page.Header.Style.Add("background-size", "cover");
            Page.Header.Style.Add("background-repeat", "no-repeat");

        }
    }
}
