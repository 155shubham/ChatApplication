using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Npgsql;
using System.Configuration;
using System.Data;
using ChatApplication.Models.HelperBll;
using System.Data.SqlClient;

namespace ChatApplication.Models.HelperBll
{
    public class DataLayer
    {
        SqlConnection con = new SqlConnection();
        public DataLayer()
        {
            //con.ConnectionString = ConfigurationManager.ConnectionStrings
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        }
        //public UserModel login(string email,string password)
        //{
        //    UserModel user = new UserModel();
        //    DataTable dt = new DataTable();
        //    DataSet ds = new DataSet();
        //    string sql = "select * from UserInfo where email='" + email + "' and password='" + password + "'";
        //    SqlDataAdapter da = new SqlDataAdapter(sql, con);
        //    ds.Reset();
        //    da.Fill(ds);
        //    dt = ds.Tables[0];
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        user.userid = Convert.ToInt32(row["userid"].ToString());
        //        user.email = row["email"].ToString();
        //        user.mobile = row["mobile"].ToString();
        //        user.password = row["password"].ToString();
        //        if (row["isemployee"].Equals(true))
        //            user.IsEmployee = true;
        //        else
        //            user.IsEmployee = false;
        //    }
        //    return user;
        //}

        public UserModel login(string email, string password)
        {
            UserModel user = new UserModel();
            try
            {
                string sql = "usp_UpdateLoginTimeAndGetLoginInfo";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter email_param = new SqlParameter();
                email_param = cmd.Parameters.Add("@email", SqlDbType.VarChar);
                email_param.Value = email;

                SqlParameter password_param = new SqlParameter();
                password_param = cmd.Parameters.Add("@password", SqlDbType.VarChar);
                password_param.Value = password;

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    user.userid = Convert.ToInt32(rdr["userid"].ToString());
                    user.email = rdr["email"].ToString();
                    user.mobile = rdr["mobile"].ToString();
                    if (rdr["isemployee"].Equals(true))
                        user.IsEmployee = true;
                    else
                        user.IsEmployee = false;
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return user;
        }

        public UserModel logout(string email, int userId)
        {
            UserModel user = new UserModel();
            try
            {
                string sql = "usp_UpdateLogoutTime";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter email_param = new SqlParameter();
                email_param = cmd.Parameters.Add("@email", SqlDbType.VarChar);
                email_param.Value = email;

                SqlParameter userId_param = new SqlParameter();
                userId_param = cmd.Parameters.Add("@userId", SqlDbType.Int);
                userId_param.Value = userId;

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    user.userid = Convert.ToInt32(rdr["userid"].ToString());
                    user.email = rdr["email"].ToString();
                    user.mobile = rdr["mobile"].ToString();
                    if (rdr["isemployee"].Equals(true))
                        user.IsEmployee = true;
                    else
                        user.IsEmployee = false;
                }
            }
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }            
            return user;
        }

        //public List<UserModel> getusers(int id)
        //{
        //    DataTable dt = new DataTable();
        //    DataSet ds = new DataSet();
        //    List<UserModel> userlist = new List<UserModel>();
        //    string sql = "select * from UserInfo where userid = "+id;
        //    SqlDataAdapter da = new SqlDataAdapter(sql, con);
        //    ds.Reset();
        //    da.Fill(ds);
        //    dt = ds.Tables[0];
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        UserModel user = new UserModel();
        //        user.userid = Convert.ToInt32(row["userid"].ToString());
        //        user.email = row["email"].ToString();
        //        user.mobile = row["mobile"].ToString();
        //        user.password = row["password"].ToString();
        //        user.dob = row["dob"].ToString();
        //        userlist.Add(user);
        //    }
        //    return userlist;
        //}

        //public List<UserModel> getallusers()
        //{
        //    DataTable dt = new DataTable();
        //    DataSet ds = new DataSet();
        //    List<UserModel> userlist = new List<UserModel>();
        //    string sql = "select * from UserInfo";
        //    SqlDataAdapter da = new SqlDataAdapter(sql, con);
        //    ds.Reset();
        //    da.Fill(ds);
        //    dt = ds.Tables[0];
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        UserModel user = new UserModel();
        //        user.userid = Convert.ToInt32(row["userid"].ToString());
        //        user.email = row["email"].ToString();
        //        user.mobile = row["mobile"].ToString();
        //        user.password = row["password"].ToString();
        //        user.dob = row["dob"].ToString();
        //        userlist.Add(user);
        //    }
        //    return userlist;
        //}

        public List<UserModel> getSupportOrCustomerDetails(int id)
        {
            List<UserModel> userlist = new List<UserModel>();
            try
            {
                DataTable dt = new DataTable();
                string sql = "usp_GetSupportAndCustomerMapping";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter param = new SqlParameter();
                param = cmd.Parameters.Add("@userId", SqlDbType.Int);
                param.Value = id;

                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    UserModel user = new UserModel();
                    user.userid = Convert.ToInt32(rdr["userid"]);
                    user.email = rdr["email"].ToString();
                    user.mobile = rdr["mobile"].ToString();
                    user.dob = rdr["dob"].ToString();
                    userlist.Add(user);
                }
            }
            catch(Exception ex)
            {
                return userlist = null;
            }
            finally
            {
                con.Close();
            }
            return userlist;
        }

    }
}