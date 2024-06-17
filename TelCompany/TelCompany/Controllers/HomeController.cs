using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TelCompany.Models;

namespace TelCompany.Controllers
{
	public class HomeController : Controller
	{
		 TeleCompanyEntities db = new TeleCompanyEntities();
		public ActionResult Index()
		{
			List<CampaignFormViewModel> formList = db.CampaignForms.Select(x => new CampaignFormViewModel
			{
				CampaignFormID = x.CampaignFormID,
				CustomerID = x.CustomerID,
				AgentID = x.AgentID,
				DiscountID = x.DiscountID,
				PurchaseID = x.PurchaseID,
				Date = x.Date
			}).ToList();
			return View(formList);
		}

		public void ExportToExcel()
		{
			List<CampaignFormViewModel> formList = db.CampaignForms.Select(x => new CampaignFormViewModel
			{
				CampaignFormID = x.CampaignFormID,
				CustomerID = x.CustomerID,
				AgentID = x.AgentID,
				DiscountID = x.DiscountID,
				PurchaseID = x.PurchaseID,
				Date = x.Date
			}).ToList();

			ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
			ExcelPackage pck = new ExcelPackage();

			ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Report");
			ws.Cells["A1"].Value = "Communication";
			ws.Cells["B1"].Value = "Monthly Report";

			ws.Cells["A2"].Value = "Report";
			ws.Cells["B2"].Value = "My Report";

			ws.Cells["A3"].Value = "Date";
			ws.Cells["B3"].Value = DateTime.Now;

			ws.Cells["A6"].Value = "Campaign Form No.";
			ws.Cells["B6"].Value = "Customer:";
			ws.Cells["C6"].Value = "Agent:";
			ws.Cells["D6"].Value = "Discount No.";
			ws.Cells["E6"].Value = "Purchase No.";
			ws.Cells["F6"].Value = "Date";

			int rowstart = 7;

			foreach (var item in formList)
			{
				if (item.Date >= DateTime.Now.AddDays(-30))
				{
					ws.Row(rowstart).Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
					ws.Row(rowstart).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml(string.Format("pink")));

				}

			
				ws.Cells["A7"].Value = item.CampaignFormID;
				ws.Cells["B7"].Value = item.CustomerID;
				ws.Cells["C7"].Value = item.AgentID;
				ws.Cells["D7"].Value = item.DiscountID;
				ws.Cells["E7"].Value = item.PurchaseID;
				ws.Cells["F7"].Value = item.Date;
				rowstart++;
			}

			ws.Cells["A:AZ"].AutoFitColumns();
			Response.Clear();
			Response.ContentType = "application/vnd.openxmlformat-officedocument.spreadsheetml.sheet";
			Response.AddHeader("content-disposition", "attachment: filename=" + "ExcelReport.xlsx");
			Response.BinaryWrite(pck.GetAsByteArray());
			Response.End();


		}
	}
}