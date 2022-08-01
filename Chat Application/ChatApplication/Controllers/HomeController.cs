using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RabbitMQ.Client;
using RabbitMQ.Util;
using System.Web.Mvc;
using ChatApplication.Models.HelperBll;
using System.Web.UI.WebControls;

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
        public JsonResult sendmsg(string message,string user)
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
                if(Session["username"] != null)
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
        public ActionResult logout()
        {
            Session["username"] = null;
            Session["userid"] = null;
            Session.Abandon();
            return RedirectToAction("login", "home");
        }

        //[HttpPost]
        //public JsonResult friendlist()
        //{
        //    int id = Convert.ToInt32(Session["userid"].ToString());
        //    //List<UserModel> users = dl.getusers(id);
        //    List<UserModel> users = dl.getallusers();
        //    List<ListItem> userlist = new List<ListItem>();
        //    foreach (var item in users)
        //    {
        //        userlist.Add(new ListItem
        //        {
        //            Value = item.email.ToString(),
        //            Text = item.email.ToString()

        //        });
        //    }
        //    return Json(userlist);
        //}

        public JsonResult userslist()
        {
            int id = 0;
            if (Session["userid"] != null)
            {
                id = Convert.ToInt32(Session["userid"].ToString());
            }
            //List<UserModel> users = dl.getusers(id);
            List<UserModel> users = dl.getagent(id);
            List<ListItem> userlist = new List<ListItem>();
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