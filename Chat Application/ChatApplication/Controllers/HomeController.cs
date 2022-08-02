using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RabbitMQ.Client;
using RabbitMQ.Util;
using System.Web.Mvc;
using ChatApplication.Models.HelperBll;
using System.Web.UI.WebControls;
using System.Globalization;

namespace ChatApplication.Controllers
{
    public class HomeController : Controller
    {
        DataLayer dl = new DataLayer();

        // GET: Home
        public ActionResult Index()
        {
            if (Session["userid"]==null)
            {
                return RedirectToAction("login");
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public JsonResult sendmsg(string message, string user)
        {
            RabbitMQBll obj = new RabbitMQBll();
            IConnection con = obj.GetConnection();
            bool flag = obj.send(con, message, user);
            return Json(null);
        }

        [HttpPost]
        public JsonResult receive()
        {
            try
            {
                RabbitMQBll obj = new RabbitMQBll();
                IConnection con = obj.GetConnection();
                if (Session["username"] != null)
                {
                    string userqueue = Session["username"].ToString();
                    string message = obj.receive(con, userqueue);
                    return Json(message);
                }
                return Json(null);

            }
            catch (Exception)
            {
                return null;
            }           
        }

        public ActionResult login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult login(FormCollection fc)
        {
            string email = fc["txtemail"].ToString();
            string password = fc["txtpassword"].ToString();
            UserModel user = dl.login(email, password);
            if (user.userid > 0)
            {
                ViewData["status"] = 1;
                ViewData["msg"] = "login Successful...";
                Session["username"] = user.email;
                Session["userid"] = user.userid.ToString();
                if (user.IsEmployee == true)
                { 
                    Session["UserType"] = "Agent"; 
                }
                else
                {
                    Session["UserType"] = "Customer";
                }
                return RedirectToAction("Index");
            }
            else
            {
                ViewData["status"] = 2;
                ViewData["msg"] = "invalid Email or Password...";
                return View();
            }

        }

        [HttpGet]
        public ActionResult Logoff()
        {
            var email = Session["username"].ToString();
            var userId = Convert.ToInt32(Session["userid"]);
            var success = dl.Logoff(email, userId);
            if (success > 0 && Session["UserType"].ToString() == "Customer")
            {
                Session["username"] = null;
                Session["userid"] = null;
                Session.Abandon();
                return RedirectToAction("login", "home");
            } 
            else
            {
                return null;
            }
            
        }

        public JsonResult userslist()
        {
            List<ListItem> userlist = new List<ListItem>();
            int id = 0;

            // Check office hours and then assign agent
            var currTime = DateTime.Now.TimeOfDay;
            var startTime = DateTime.ParseExact("08:00:00", "HH:mm:ss", CultureInfo.InvariantCulture).TimeOfDay;
            var endTime = DateTime.ParseExact("22:00:00", "HH:mm:ss", CultureInfo.InvariantCulture).TimeOfDay;
            //if (currTime < startTime || currTime > endTime)
            //{
            //    userlist.Add(new ListItem
            //    {
            //        Value = "Out of Office hours.",
            //        Text = "No one is available in non office hours."

            //    });
            //    return Json(userlist);
            //}

            if (Session["userid"] != null)
            {
                id = Convert.ToInt32(Session["userid"].ToString());
            }

            List<UserModel> users = dl.getSupportOrCustomerDetails(id);

            foreach (var item in users)
            {
                userlist.Add(new ListItem
                {
                    Value = item.email.ToString(),
                    Text = item.email.ToString()

                });
            }
            return Json(userlist);
        }





    }
}