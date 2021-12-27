using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace RegistrationSystem.Utills
{
    public class Helpers
    {
        /// <summary>
        /// checks whether the string value in not null or empty
        /// </summary>
        /// <param name="val">string value</param>
        /// <returns>true if val not null or empty</returns>
        public static bool NotNull(string val) => !string.IsNullOrWhiteSpace(val);

        /// <summary>
        /// cleans out a base64 string (removing datatype from base64 string), to make it valid for conversion to bytes[]
        /// </summary>
        /// <param name="val">string to be converted</param>
        /// <returns>base64 string if cleaning was a success else null</returns>
        public static string CleanBase64Datatype(string val)
        {
            if (string.IsNullOrWhiteSpace(val))
            {
                return null;
            }

            try
            {
                return val.Split(',')[1];
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// inserts base64 datatype
        /// </summary>
        /// <param name="val">original base64 string</param>
        /// <param name="datatype">datatype of base64 string (default: application/pdf)</param>
        /// <returns>base64 string with datatype if val else null</returns>
        public static string AddBase64Datatype(string val, string datatype = "application/pdf")
        {
            if (string.IsNullOrWhiteSpace(val))
            {
                return null;
            }
            string data = $"data:{datatype};base64";
            return $"{data},{val}";
        }

        /// <summary>
        /// convert base64 string to bytes array
        /// </summary>
        /// <param name="base64">base64 string</param>
        /// <returns>returns bytes array (byte[])</returns>
        public static byte[] EncodeBase64(string base64)
        {
            if (string.IsNullOrWhiteSpace(base64))
            {
                return null;
            }
            try
            {
                string base64String;
                if (base64.StartsWith(value: "data:", StringComparison.InvariantCultureIgnoreCase))
                {
                    // requires cleaning to remove datatype
                    base64String = CleanBase64Datatype(base64);

                }
                else
                {
                    base64String = base64;
                }

                if (base64String != null)
                {
                    return Convert.FromBase64String(base64String);
                }
                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// takes byte array and turns it to base64 string, including datatype
        /// </summary>
        /// <param name="bytesArray">bytes array</param>
        /// <param name="datatype">datatypes of file</param>
        /// <returns>base64 string</returns>
        public static string DecodeBase64(byte[] bytesArray, string datatype = "application/pdf")
        {
            if (bytesArray == null)
            {
                return null;
            }

            string base64String = Convert.ToBase64String(bytesArray);
            if (string.IsNullOrWhiteSpace(base64String))
            {
                return null;
            }
            return AddBase64Datatype(base64String, datatype);
        }

        /// <summary>
        /// trys to get a more detailed error message from the exception
        /// </summary>
        /// <param name="ex">Expection</param>
        /// <returns>error message from that exceptin</returns>
        public static string GetErrorMessage(Exception ex)
        {
            if (ex.InnerException == null)
            {
                return ex.Message;
            }
            else if (ex.InnerException.InnerException == null)
            {
                return ex.InnerException.Message;
            }
            else
            {
                return ex.InnerException.InnerException.Message;
            }
        }


        /// <summary>
        /// Gets the date of birth from ID number
        /// </summary>
        /// <param name="id">id number</param>
        /// <returns>date of birth</returns>
        public static string GetDobFromId(string id)
        {
            string yyData = id.Substring(0, 2);
            string year;
            var x = DateTime.Now.Year.ToString().Substring(2);
            if (int.Parse(yyData) >= 0 && int.Parse(yyData) < int.Parse(x))
            {
                year = $"20{yyData}";
            }
            else
            {
                year = $"19{yyData}";
            }
            var date = $"{id.Substring(2, 2)}/{id.Substring(4, 2)}/{year}";
            return date;
        }
    }
}