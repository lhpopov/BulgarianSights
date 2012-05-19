using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BulgarianSights.DB;

namespace BulgarianSights
{
    public partial class SitesAdd : System.Web.UI.Page
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
                area.Text = "1";
            else if(SiteTypeDropDown.SelectedIndex == 2)
                area.Text = "2";
            else if(SiteTypeDropDown.SelectedIndex == 3)
            {
                DateTr.Visible = true;
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
            EventSite bla=  EventSite.CreateEventSite(2,"ПРоба", NameSite.Text);
            //Documents bla = Documents.CreateDocuments(4, area.Text, NameSite.Text);
            SightsDBEntities dbContext = new SightsDBEntities();
            dbContext.AddObject("EventSite", bla);
            dbContext.AddToEventSite(bla);
            dbContext.SaveChanges();
            
        }
    }
}