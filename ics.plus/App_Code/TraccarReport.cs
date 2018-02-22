using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for TraccarReport
/// </summary>
public class TraccarReport
{
	public string DeviceId;
    public float Latitude;
    public float Longitude;
    public DateTime Timestamp;
    public float Altitude;
    public string Speed;
    public string Bearing;
    public string Battery;
    private string RawURL;

    public TraccarReport(string deviceId, float latitude, float longitude, DateTime timestamp, float altitude, string speed, string bearing, string battery, string rawURL)
    {
		DeviceId = deviceId;
        Latitude = latitude;
        Longitude = longitude;
        Timestamp = timestamp;
        Altitude = altitude;
        Speed = speed;
        Bearing = bearing;
        Battery = battery;
        RawURL = rawURL;
    }

    public TraccarReport(string rawURL)
    {
        NameValueCollection nvCol = HttpUtility.ParseQueryString(rawURL.Substring(2));
		DeviceId = nvCol["id"];
		float.TryParse(nvCol["lat"], out Latitude);
		float.TryParse(nvCol["lon"], out Longitude);
        Timestamp = FromEpochTime(nvCol["timestamp"]);
		float.TryParse(nvCol["altitude"], out Altitude);
        Speed = nvCol["speed"];
        Bearing = nvCol["bearing"];
        Battery = nvCol["batt"];
        RawURL = rawURL;
    }

	private DateTime FromEpochTime(string unixTime)
	{
		long lngTime;
		var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);

		if (long.TryParse(unixTime, out lngTime))
		{
			return epoch.AddSeconds(lngTime);
		}
		else
		{
			return epoch;
		}
	}

	public void Save()
	{
		string strUrl = "https://93f.azurewebsites.net/api/PostLocation?id={0}&lat={1}&lon={2}&timestamp={3}&altitude={4}&speed={5}&bearing={6}&battery={7}&rawUrl={8}";
		strUrl = string.Format(strUrl, DeviceId, Latitude, Longitude, Timestamp, Altitude, Speed, Bearing, Battery, RawURL);
		HttpWebRequest request = WebRequest.Create(strUrl) as HttpWebRequest;
		HttpWebResponse response = request.GetResponse() as HttpWebResponse;
		

		//string strSql = "INSERT INTO TraccarReports (DeviceId, lat, lon, reportTime, altitude, speed, bearing, battery, rawUrl) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}');";
		//strSql = string.Format(strSql, DeviceId, Latitude, Longitude, Timestamp, Altitude, Speed, Bearing, Battery, RawURL);
		//Data.Write(strSql);
	}
}