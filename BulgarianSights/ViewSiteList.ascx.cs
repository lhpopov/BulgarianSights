using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BulgarianSights.DB;

namespace BulgarianSights
{
    public partial class ViewSiteList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //  GetCulturalAndHistoricSitesOnMap();
        }

        protected void ViewSiteTypeDropDown_Init(object sender, EventArgs e)
        {
            List<string> types = new List<string>();
            types.Add("---Изберете тип на обекта---");
            types.Add("Културно-исторически обект");
            types.Add("Документ");
            types.Add("Събитие");

            ViewSiteType.DataSource = types;
            ViewSiteType.DataBind();
        }

        protected void InitListGridView(object sender, EventArgs e)
        {
            if (ViewSiteType.SelectedIndex == 1)
            {
                //BoundField dateField = new BoundField();
                //dateField.HeaderText = "Координати";
                //dateField.DataField = "siteX";
                //dateField.DataFormatString = "{0:MMMM, yyyy}";
                //ListGridView.Columns.Add(dateField);

                GetCulturalAndHistoricSitesOnMap();
                //ViewSiteUpdate.Update();
            }
            if (ViewSiteType.SelectedIndex == 2)
            {
                GetDocumentsOnMap();
            }
            if (ViewSiteType.SelectedIndex == 3)
            {
                GetEventsOnMap();
            }
        }

        public void GetCulturalAndHistoricSitesOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<CulturalAndHistoricSites> query = (from CulturalAndHistoricSites p in dbContext.CulturalAndHistoricSites
                                                    select p).OfType<CulturalAndHistoricSites>().ToList();

            ListGridView.DataSource = query;
            ListGridView.DataBind();
            //return query;
        }

        public void GetDocumentsOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<Documents> query = (from Documents p in dbContext.Documents
                                     select p).OfType<Documents>().ToList();

            ListGridView.DataSource = query;
            ListGridView.DataBind();
        }

        public void GetEventsOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<EventSite> query = (from EventSite p in dbContext.EventSite
                                     select p).OfType<EventSite>().ToList();

            ListGridView.DataSource = query;
            ListGridView.DataBind();
        }


    }
}