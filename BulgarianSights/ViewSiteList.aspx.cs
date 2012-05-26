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
            //  GetCulturalAndHistoricSitesOnMap();
            ListGridView.ShowHeader = true;
            DocGridView.ShowHeader = true;
            EventGridView.ShowHeader = true;

            GetCulturalAndHistoricSitesOnMap();
            ListGridView.Visible = true;

            GetDocumentsOnMap();
            DocGridView.Visible = true;

            GetEventsOnMap();
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

                GetCulturalAndHistoricSitesOnMap();
                ListGridView.Visible = true;

                GetDocumentsOnMap();
                DocGridView.Visible = true;

                GetEventsOnMap();
                EventGridView.Visible = true;
            }
            if (ViewSiteType.SelectedIndex == 1)
            {
                if (DocGridView.Visible == true || EventGridView.Visible == true)
                {
                    DocGridView.Visible = false;
                    EventGridView.Visible = false;
                }
                
                GetCulturalAndHistoricSitesOnMap();
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
                GetDocumentsOnMap();
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
                GetEventsOnMap();
                EventGridView.Visible = true;
            }
        }

        //public class InfoTempalte : ITemplate
        //{
        //    public void InstantiateIn(Control container)
        //    {
        //        Label a = new Label();
        //        a.ID = "info";
        //        a.Text = Eval("siteText").ToString();
        //        container.Controls.Add(a);
        //    }
        //}

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

            DocGridView.DataSource = query;
            DocGridView.DataBind();
        }

        public void GetEventsOnMap()
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<EventSite> query = (from EventSite p in dbContext.EventSite
                                     select p).OfType<EventSite>().ToList();

            EventGridView.DataSource = query;
            EventGridView.DataBind();
        }
    }
}