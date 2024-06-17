using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TelCompany.Models;

namespace TelCompany.Controllers
{
    public class CampaignFormsController : Controller
    {
        private TeleCompanyEntities db = new TeleCompanyEntities();

        // GET: CampaignForms
        public ActionResult Index()
        {
            var campaignForms = db.CampaignForms.Include(c => c.Agent).Include(c => c.Customer).Include(c => c.Discount).Include(c => c.Purchase);
            return View(campaignForms.ToList());
        }

        // GET: CampaignForms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CampaignForm campaignForm = db.CampaignForms.Find(id);
            if (campaignForm == null)
            {
                return HttpNotFound();
            }
            return View(campaignForm);
        }

        // GET: CampaignForms/Create
        public ActionResult Create()
        {
            ViewBag.AgentID = new SelectList(db.Agents, "AgentID", "FirstName");
            ViewBag.CustomerID = new SelectList(db.Customers, "Customer_ID", "FirstName");
            ViewBag.DiscountID = new SelectList(db.Discounts, "DiscountID", "DiscountID");
            ViewBag.PurchaseID = new SelectList(db.Purchases, "PurchaseID", "PurchaseID");
            return View();
        }

        // POST: CampaignForms/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CampaignFormID,CustomerID,AgentID,DiscountID,PurchaseID,Date")] CampaignForm campaignForm)
        {
            if (ModelState.IsValid)
            {
                db.CampaignForms.Add(campaignForm);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AgentID = new SelectList(db.Agents, "AgentID", "FirstName", campaignForm.AgentID);
            ViewBag.CustomerID = new SelectList(db.Customers, "Customer_ID", "FirstName", campaignForm.CustomerID);
            ViewBag.DiscountID = new SelectList(db.Discounts, "DiscountID", "DiscountID", campaignForm.DiscountID);
            ViewBag.PurchaseID = new SelectList(db.Purchases, "PurchaseID", "PurchaseID", campaignForm.PurchaseID);
            return View(campaignForm);
        }

        // GET: CampaignForms/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CampaignForm campaignForm = db.CampaignForms.Find(id);
            if (campaignForm == null)
            {
                return HttpNotFound();
            }
            ViewBag.AgentID = new SelectList(db.Agents, "AgentID", "FirstName", campaignForm.AgentID);
            ViewBag.CustomerID = new SelectList(db.Customers, "Customer_ID", "FirstName", campaignForm.CustomerID);
            ViewBag.DiscountID = new SelectList(db.Discounts, "DiscountID", "DiscountID", campaignForm.DiscountID);
            ViewBag.PurchaseID = new SelectList(db.Purchases, "PurchaseID", "PurchaseID", campaignForm.PurchaseID);
            return View(campaignForm);
        }

        // POST: CampaignForms/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CampaignFormID,CustomerID,AgentID,DiscountID,PurchaseID,Date")] CampaignForm campaignForm)
        {
            if (ModelState.IsValid)
            {
                db.Entry(campaignForm).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AgentID = new SelectList(db.Agents, "AgentID", "FirstName", campaignForm.AgentID);
            ViewBag.CustomerID = new SelectList(db.Customers, "Customer_ID", "FirstName", campaignForm.CustomerID);
            ViewBag.DiscountID = new SelectList(db.Discounts, "DiscountID", "DiscountID", campaignForm.DiscountID);
            ViewBag.PurchaseID = new SelectList(db.Purchases, "PurchaseID", "PurchaseID", campaignForm.PurchaseID);
            return View(campaignForm);
        }

        // GET: CampaignForms/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CampaignForm campaignForm = db.CampaignForms.Find(id);
            if (campaignForm == null)
            {
                return HttpNotFound();
            }
            return View(campaignForm);
        }

        // POST: CampaignForms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CampaignForm campaignForm = db.CampaignForms.Find(id);
            db.CampaignForms.Remove(campaignForm);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
