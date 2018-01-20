using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Data
/// </summary>
public class Data
{
    private static string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;

    public static DataSet Read(string sql)
    {
        DataSet sqlDs = new DataSet();

        try
        {
            MySqlConnection Connection = new MySqlConnection(ConnectionString);
            Connection.Open();

			MySqlCommand sqlCmd = new MySqlCommand(sql, Connection);
			MySqlDataAdapter sqlDa = new MySqlDataAdapter(sqlCmd);
            sqlDa.Fill(sqlDs);

            Connection.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return sqlDs;
    }

    public static object ReadScalar(string sql)
    {
        object rtn = new object();

        try
        {
			MySqlConnection Connection = new MySqlConnection(ConnectionString);
            Connection.Open();

			MySqlCommand sqlCmd = new MySqlCommand(sql, Connection);
            rtn = sqlCmd.ExecuteScalar();

            Connection.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return rtn;
    }

    public static void Write(string sql)
    {
        try
        {
            MySqlConnection Connection = new MySqlConnection(ConnectionString);
            Connection.Open();

            MySqlCommand sqlCmd = new MySqlCommand(sql, Connection);
            sqlCmd.ExecuteNonQuery();

            Connection.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static string ReadCookie(string keyName)
    {
        HttpCookie cookie = HttpContext.Current.Request.Cookies[keyName];
        if (cookie == null)
        {
            return string.Empty;
        }
        else
        {
            return cookie.Value;
        }
    }

    public static void WriteCookie(string keyName, string newValue)
    {
        HttpCookie cookie = new HttpCookie(keyName);
        cookie.Value = newValue;
        cookie.Expires = DateTime.Now.AddMonths(1);
        HttpContext.Current.Response.Cookies.Add(cookie);
    }
}