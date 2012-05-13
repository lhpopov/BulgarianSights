using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BulgarianSights.DB;
using BulgarianSights.HelpObjects;
using System.Data.SqlClient;


namespace BulgarianSights
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewSiteObjects.DataSource = GetCulturalAndHistoricSitesOnMap();
            GridViewSiteObjects.DataBind();
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void bla_Click(object sender, EventArgs e)
        {
            


        }

        public List<CulturalAndHistoricSites> GetCulturalAndHistoricSitesOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<CulturalAndHistoricSites> query = (from CulturalAndHistoricSites p in dbContext.CulturalAndHistoricSites
                                                    select p).OfType<CulturalAndHistoricSites>().ToList();

            /*
            List<TestCulturalAndHistoricSites> list = new List<TestCulturalAndHistoricSites>();
            StringBuilder sb = new StringBuilder("<table id='sites'>");
            string startTr = "<tr><td>";
            string endTr = "</td></tr>";

            foreach(CulturalAndHistoricSites item in query)
            {
                sb.Append(startTr);
                sb.Append(item.site);
                sb.Append(item.siteName);
                sb.Append(item.area);
                sb.Append(item.location);
                sb.Append(item.age);
                sb.Append(item.importance);
                sb.Append(item.culture);
                sb.Append(item.siteX);
                sb.Append(item.siteY);
                sb.Append(endTr);
            }
            sb.Append("</table>");
            */

            return query;
        }
    }


}
