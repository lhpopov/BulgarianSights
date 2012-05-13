using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BulgarianSights.HelpObjects
{
    [Serializable]
    public class TestCulturalAndHistoricSites
    {
        //private int id;

        //public int Id
        //{
        //    get { return id; }
        //    set { id = value; }
        //}

        private string _site;
        public string Site
        {
            get { return _site; }
            set { _site = value; }
        }


        private string _siteName;
        public string SiteName
        {
            get { return _siteName; }
            set { _siteName = value; }
        }

        private string _area;
        public string Area
        {
            get { return _area; }
            set { _area = value; }
        }

        private string _location;
        public string Location
        {
            get { return _location; }
            set { _location = value; }
        }

        private string _age;
        public string Age
        {
            get { return _age; }
            set { _age = value; }
        }

        private string _importance;
        public string Importance
        {
            get { return _importance; }
            set { _importance = value; }
        }


        private string _culture;
        public string Culture
        {
            get { return _culture; }
            set { _culture = value; }
        }

        private string _siteX;
        public string SiteX
        {
            get { return _siteX; }
            set { _siteX = value; }
        }

        private string _siteY;
        public string SiteY
        {
            get { return _siteY; }
            set { _siteY = value; }
        }   

    }
}