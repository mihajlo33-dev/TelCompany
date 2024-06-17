using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelCompany.Models
{
	public class CampaignFormViewModel
	{
        public int CampaignFormID { get; set; }
        public Nullable<int> CustomerID { get; set; }
        public Nullable<int> AgentID { get; set; }
        public Nullable<int> DiscountID { get; set; }
        public Nullable<int> PurchaseID { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
    }
}