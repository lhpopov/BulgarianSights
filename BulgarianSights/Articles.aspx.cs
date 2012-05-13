using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BulgarianSights.DB;
using BulgarianSights.HelpObjects;
using System.Text;

namespace BulgarianSights
{
    public partial class Articles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //textbox2.Text = GetCulturalAndHistoricSites();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            GridView2.DataSource = from c in dbContext.CulturalAndHistoricSites
                                   where c.importance == "голямо"
                                   select new
                                   {
                                       name = c.importance,
                                       x = c.siteX
                                   };

            //GridView2.DataSource = GetCulturalAndHistoricSitesOnMap();
            GridView2.DataBind();
            //string name = textbox1.Text;
            //textbox2.Text = GetCulturalAndHistoricSites(name);
        }
    }
}














/*
site = p.site, 
name = p.siteName,
area = p.area,
locaiton = p.location,
age = p.age,
importance = p.importance,
culture = p.culture,
siteX = p.siteX,
siteY = p.siteY,*/