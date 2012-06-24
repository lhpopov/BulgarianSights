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
            GetCulturalAndHistoricSitesOnMap();
            GetDocumentsOnMap();
            GetEventsOnMap();

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void bla_Click(object sender, EventArgs e)
        {
            addSite.Style["display"] = "block";


        }

        public void GetCulturalAndHistoricSitesOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<CulturalAndHistoricSites> query = (from CulturalAndHistoricSites p in dbContext.CulturalAndHistoricSites
                                                    select p).OfType<CulturalAndHistoricSites>().ToList();

            GridViewSiteObjects.DataSource = query;
            GridViewSiteObjects.DataBind();
        }

        public void GetDocumentsOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<Documents> query = (from Documents p in dbContext.Documents
                                     select p).OfType<Documents>().ToList();
        
            GridViewDocObjects.DataSource = query;
            GridViewDocObjects.DataBind();
        }

        public void GetEventsOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<EventSite> query = (from EventSite p in dbContext.EventSite
                                     select p).OfType<EventSite>().ToList();

            GridViewEventObjects.DataSource = query;
            GridViewEventObjects.DataBind();
        }


    }

    


}
