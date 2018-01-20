using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class unitTests : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		// Test the database connection
		TextBox1.Text += "Testing database connection";
		string strSql = "Select * from TraccarReports";
		System.Data.DataSet ds = Data.Read(strSql);
		TextBox1.Text += (ds.Tables.Count > 0) ? "Connected" : "Failed";

		// Test writing to the database
		//string strSql = "INSERT INTO TraccarReports (DeviceId, lat, lon, reportTime, altitude, speed, bearing, battery, rawUrl) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}');";
		//strSql = string.Format(strSql, "Test", "34.778371", "-92.510440", "2018-01-18 08:37:22.123456", "157.898", "0", "15", "15", "Unit test");
		//Data.Write(strSql);

		// Test data input from Traccar client
		//TraccarReport tr = new TraccarReport("/?id=N5JLC&timestamp=1516285495&lat=34.778371&lon=-92.510440&speed=0&bearing=0&altitude=157.898&batt=15");

		// Test saving data input from Traccar client
		//tr.Save();
	}
}