using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
	public int UserId;
	public bool Activated;
	public DateTime DateLastReviewedEULA;
	public string Email;
	public bool ReadOnly;
	public string Username;
	public string Password
	{
		get
		{
			return "**********";
		}
		set
		{
			if (UserId != 0)
			{
				string strSql = string.Format("Update Users set password = '{0}' where UserId = '{1}';", value, UserId);
				Data.Write(strSql);
			}
		}
	}
	public string FirstName;
	public string LastName;
	public bool NotifyAdminsOnLogin;
	public bool Administrator;

	public User()
	{

	}

	public static User Login(string username, string password)
	{
		string strSql = string.Format("Select username from Users where username = '{0}' and password = '{1}';", username, password);
		System.Data.DataSet ds = Data.Read(strSql);
		User user;

		if (ds.Tables.Count < 0)
		{
			user = new User(ds);
			Data.WriteCookie("userid", user.UserId.ToString());
		}
		else
		{
			user = new User();
		}
		return user;
	}

	public static User Login(int userId)
	{
		string strSql = string.Format("Select * from Users where userid = '{0}';", userId);
		User user = new User(Data.Read(strSql));
		Data.WriteCookie("UserId", user.UserId.ToString());
		return user;
	}

	private User(System.Data.DataSet ds)
	{
		if ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0))
		{
			System.Data.DataRow row = ds.Tables[0].Rows[0];

			this.UserId = (int)row["UserId"];
			this.Username = (string)row["Username"];
			this.Email = (string)row["Email"];
			this.FirstName = (string)row["FirstName"];
			this.LastName = (string)row["LastName"];
			this.Activated = (bool)row["Activated"];
			this.ReadOnly = (bool)row["ReadOnly"];
			this.Administrator = (bool)row["Administrator"];
			this.NotifyAdminsOnLogin = (bool)row["NotifyAdminsOnLogin"];
		}
	}
}