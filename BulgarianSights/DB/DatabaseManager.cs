using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using BulgarianSights.DB;
using BulgarianSights.HelpObjects;

using BulgarianSights;

namespace BulgarianSights.DB
{
    public class DatabaseManager
    {
        public List<CulturalAndHistoricSites> GetCulturalAndHistoricSites(string name)
        {
            SightsDBEntities dbContext = new SightsDBEntities();
            List<CulturalAndHistoricSites> query = (from CulturalAndHistoricSites p in dbContext.CulturalAndHistoricSites
                                                    where p.importance.Contains(name)
                                                    select p).OfType<CulturalAndHistoricSites>().ToList();

            List<TestCulturalAndHistoricSites> list = new List<TestCulturalAndHistoricSites>();

            //list[0].Importance =query.First().Importance;
            //    list[0].Location=query.First().Location;
            //    list[0].Site=query.First().Site;
            //    list[0].SiteX=query.First().SiteX;
            //    list[0].SiteY=query.First().SiteY;
            //    list[0].Age= query.First().Age;
            //    list[0].Area =query.First().Area;
            //    list[0].Culture =query.First().Culture;

            //list[0].SiteName = query.ToList();
            //TestCulturalAndHistoricSites bla = new TestCulturalAndHistoricSites();
            //bla.SiteName = query.First().siteName;
            //list.First().SiteName=bla.SiteName;
            //list.AddRange();
            //list = query.ToList();

            return query;
        }
        
    }

    
}