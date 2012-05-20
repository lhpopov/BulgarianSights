using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BulgarianSights.DB;

namespace BulgarianSights
{
    public partial class AddSiteControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SiteTypeDropDown_Init(object sender, EventArgs e)
        {
            List<string> types = new List<string>();
            types.Add("---Изберете тип на обекта---");
            types.Add("Културно-исторически обект");
            types.Add("Документ");
            types.Add("Събитие");

            SiteTypeDropDown.DataSource = types;
            SiteTypeDropDown.DataBind();
        }

        protected void ShowForm_Index(object sender, EventArgs e)
        {
            if (SiteTypeDropDown.SelectedIndex == 1)
            {
                DateTr.Visible = false;
                ImportanceTr.Visible = true;

                area.Text = "Обект";
            }
            else if (SiteTypeDropDown.SelectedIndex == 2)
            {
                DateTr.Visible = false;
                ImportanceTr.Visible = true;

                area.Text = "Документ";
            }
            else if (SiteTypeDropDown.SelectedIndex == 3)
            {
                area.Text = "Събитие";
                DateTr.Visible = true;
                ImportanceTr.Visible = false;
                //area.Text = "3";
                //SightsDBEntities dbContext = new SightsDBEntities();
                //EventSite newEvent = EventSite.CreateEventSite( 56, "ПРоба", Name.Text, 4);
                //dbContext.AddObject(;

            }
            //else if
            //(SiteTypeDropDown.SelectedIndex == 0)
            //    ErrorSiteType.InnerHtml = "Моля изберете тип на създавания обект.";
        }

        protected void SaveSite_Click(object sender, EventArgs e)
        {
            //EventSite bla = EventSite.CreateEventSite(2, "ПРоба", NameSite.Text);
            //SightsDBEntities dbContext = new SightsDBEntities();
            //dbContext.AddObject("EventSite", bla);
            SightsDBEntities dbContext = new SightsDBEntities();

            switch (SiteTypeDropDown.SelectedIndex)
            {
                case 1:
                    /* Create Site Object*/
                    CulturalAndHistoricSites newSite = new CulturalAndHistoricSites();
                    newSite.siteName = NameSite.Text;
                    newSite.area = area.Text;
                    newSite.location = location.Text;
                    newSite.age = age.Text;
                    newSite.importance = importance.Text;
                    newSite.culture = culture.Text;
                    newSite.siteX = siteX.Text;
                    newSite.siteY = siteY.Text;
                    newSite.siteText = siteText.Text;

                    dbContext.AddToCulturalAndHistoricSites(newSite);
                    dbContext.SaveChanges();

                    break;

                case 2:
                    /* Create Document Object*/
                    Documents newDoc = new Documents();
                    newDoc.documentName = NameSite.Text;
                    newDoc.area = area.Text;
                    newDoc.location = location.Text;
                    newDoc.age = age.Text;
                    newDoc.importance = importance.Text;
                    newDoc.culture = culture.Text;
                    newDoc.docX = siteX.Text;
                    newDoc.docY = siteY.Text;
                    newDoc.documentText = siteText.Text;

                    dbContext.AddToDocuments(newDoc);
                    dbContext.SaveChanges();
                    break;

                case 3:
                    /* Create Event Object*/
                    EventSite newEvent = new EventSite();
                    newEvent.eventName = NameSite.Text;
                    newEvent.area = area.Text;
                    newEvent.location = location.Text;
                    newEvent.age = age.Text;
                    newEvent.date = DateEvent.Text;
                    newEvent.eventX = siteX.Text;
                    newEvent.eventY = siteY.Text;
                    newEvent.eventText = siteText.Text;

                    dbContext.AddToEventSite(newEvent);
                    dbContext.SaveChanges();

                    break;
            }
            /* End of Switch Case statement */
        }
    }
}