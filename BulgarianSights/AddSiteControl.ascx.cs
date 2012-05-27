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

                //area.Text = "Обект";
            }
            else if (SiteTypeDropDown.SelectedIndex == 2)
            {
                DateTr.Visible = false;
                ImportanceTr.Visible = true;

                //area.Text = "Документ";
            }
            else if (SiteTypeDropDown.SelectedIndex == 3)
            {
                area.Text = "Събитие";
                DateTr.Visible = true;
                ImportanceTr.Visible = false;
            }
            //else if
            //(SiteTypeDropDown.SelectedIndex == 0)
            //    ErrorSiteType.InnerHtml = "Моля изберете тип на създавания обект.";
        }

        protected void SaveSite_Click(object sender, EventArgs e)
        {
            //if (NameSite.Text == "" || siteX.Text == "" || siteY.Text == "")
            //{
            if (SiteTypeDropDown.SelectedIndex == 0)
            {
                SiteTypeDropDown.Style["background"] = "#FDC4C4";
                ErrorType.InnerHtml = "Моля изберете тип обект.";
            }
            else
            {
                SiteTypeDropDown.Style["background"] = "";
                ErrorType.InnerHtml = "";
            }

            if (NameSite.Text == "")
            {
                //NameSite.Style["border"] = "solid 2px red";
                NameSite.Style["background"] = "#FDC4C4";
                ErrorLiteral.Text = "Попълнете задължителните полета.";
            }
            else
            {
                NameSite.Style["background"] = "";
                ErrorLiteral.Text = "";
            }
            if (siteX.Text == "")
            {
                siteX.Style["background"] = "#FDC4C4";
                ErrorLiteral.Text = "Попълнете задължителните полета.";
            }
            else
            {
                siteX.Style["background"] = "";
                ErrorLiteral.Text = "";
            }
            if (siteY.Text == "")
            {
                siteY.Style["background"] = "#FDC4C4";
                ErrorLiteral.Text = "Попълнете задължителните полета.";
            }
            else
            {
                siteY.Style["background"] = "";
                ErrorLiteral.Text = "";
            }

            if (siteText.Text == "")
            {
                siteText.Style["background"] = "#FDC4C4";
                ErrorLiteral.Text = "Попълнете задължителните полета.";
            }
            else
            {
                siteText.Style["background"] = "";
                ErrorLiteral.Text = "";
            }

            //NameSite.Style["background"] = "";
            //siteX.Style["background"] = "";
            //siteY.Style["background"] = "";
            //ErrorLiteral.Text = "";

            if (NameSite.Text != "" && siteX.Text != "" && siteY.Text != "" && siteText.Text != "" && SiteTypeDropDown.SelectedIndex != 0)
            {
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
                        newSite.siteText = "Documents/" + siteText.Text;

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
                        newDoc.documentText = "Documents/" + siteText.Text;

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
                        newEvent.eventText = "Documents/" + siteText.Text;

                        dbContext.AddToEventSite(newEvent);
                        dbContext.SaveChanges();

                        break;
                }

                AddSiteControlWrapper.InnerHtml = "<h1 style='color: white;'>Обектът беше успешно записан!</h1>";

            }
            /* End of Switch Case statement */

            
            //_Default bla = new _Default();
            //bla.GetCulturalAndHistoricSitesOnMap();

            //Page(_Default).GetCulturalAndHistoricSitesOnMap();
            //ScriptManager.RegisterOnSubmitStatement(this, this.GetType(), "bla", "init();");
        }
    }
}