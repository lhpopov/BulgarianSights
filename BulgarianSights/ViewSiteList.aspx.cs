using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BulgarianSights.DB;

namespace BulgarianSights
{
    public partial class ViewSiteList1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListGridView.ShowHeader = true;
            DocGridView.ShowHeader = true;
            EventGridView.ShowHeader = true;

            GetCulturalAndHistoricSitesOnMap("");
            ListGridView.Visible = true;

            GetDocumentsOnMap("");
            DocGridView.Visible = true;

            GetEventsOnMap("");
            EventGridView.Visible = true;
        }

        protected void ViewSiteTypeDropDown_Init(object sender, EventArgs e)
        {
            List<string> types = new List<string>();
            types.Add("Всички");
            types.Add("Културно-исторически обект");
            types.Add("Документ");
            types.Add("Събитие");

            ViewSiteType.DataSource = types;
            ViewSiteType.DataBind();
        }

        protected void InitListGridView(object sender, EventArgs e)
        {
            if (ViewSiteType.SelectedIndex == 0)
            {
                ListGridView.ShowHeader = true;

                GetCulturalAndHistoricSitesOnMap("");
                ListGridView.Visible = true;

                GetDocumentsOnMap("");
                DocGridView.Visible = true;

                GetEventsOnMap("");
                EventGridView.Visible = true;
            }
            if (ViewSiteType.SelectedIndex == 1)
            {
                if (DocGridView.Visible == true || EventGridView.Visible == true)
                {
                    DocGridView.Visible = false;
                    EventGridView.Visible = false;
                }
                
                GetCulturalAndHistoricSitesOnMap("");
                ListGridView.Visible = true;
            }
            if (ViewSiteType.SelectedIndex == 2)
            {

                if (ListGridView.Visible == true || EventGridView.Visible == true)
                {
                    ListGridView.Visible = false;
                    EventGridView.Visible = false;
                }

                DocGridView.ShowHeader = true;
                GetDocumentsOnMap("");
                DocGridView.Visible = true;
            }
            if (ViewSiteType.SelectedIndex == 3)
            {
                if (DocGridView.Visible == true || ListGridView.Visible == true)
                {
                    DocGridView.Visible = false;
                    ListGridView.Visible = false;
                }

                EventGridView.ShowHeader = true;
                GetEventsOnMap("");
                EventGridView.Visible = true;
            }
        }

        public void GetCulturalAndHistoricSitesOnMap(string searchString)
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<CulturalAndHistoricSites> query = (from CulturalAndHistoricSites p in dbContext.CulturalAndHistoricSites
                                                    where p.siteName.Contains(searchString) || p.location.Contains(searchString) || p.area.Contains(searchString)
                                                    select p).OfType<CulturalAndHistoricSites>().ToList();

            ListGridView.DataSource = query;
            ListGridView.DataBind();
        }

        public void GetDocumentsOnMap(string searchString)
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<Documents> query = (from Documents p in dbContext.Documents
                                     where p.documentName.Contains(searchString) || p.location.Contains(searchString) || p.area.Contains(searchString)
                                     select p).OfType<Documents>().ToList();

            DocGridView.DataSource = query;
            DocGridView.DataBind();
        }

        public void GetEventsOnMap(string searchString)
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<EventSite> query = (from EventSite p in dbContext.EventSite
                                     where p.eventName.Contains(searchString) || p.location.Contains(searchString) || p.area.Contains(searchString)
                                     select p).OfType<EventSite>().ToList();

            EventGridView.DataSource = query;
            EventGridView.DataBind();
        }

        public void SearchSiteObject(object sender, EventArgs e)
        {
            string searchString = SearchBox.Text;
            if(searchString =="*" || searchString =="всички" || searchString == "Търсене..." )
                searchString = "";

            GetCulturalAndHistoricSitesOnMap(searchString);
            ListGridView.Visible = true;

            GetDocumentsOnMap(searchString);
            DocGridView.Visible = true;

            GetEventsOnMap(searchString);
            EventGridView.Visible = true;
            
        }
    }
}