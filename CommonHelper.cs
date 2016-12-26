using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;

namespace Login
{
    public class CommonHelper
    {
        static CommonHelper()
        {
            PathForDirectory = Path.GetDirectoryName(AppDomain.CurrentDomain.BaseDirectory);
            PathForCantilever = PathForDirectory + @"\Configs";
            PathForDesign = PathForDirectory + @"\Configs\Design";
            PathForUserFile = PathForDirectory + @"\Configs\User\";
            sqlConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + PathForDirectory + @"\App_Data\userinformation.mdf;Integrated Security=True");
        }

        public static readonly string PathForDirectory;
        public static readonly SqlConnection sqlConn;
        public const string LoginCommand = "dakota -in";
        public const string LoginCommand1 = "dakota -admin";
        public const string yes = "yes";
        public static string PathForCantilever;
        public static string PathForDesign;
        public static string PathForUserFile;
        public enum Methods
        {
            Sampling = 0,
            Surrogate_modelling = 1,
            Sensitivity_analysis = 2,
            Optimization = 3,
            Uncertainity_quantification = 4,
            Optimization_under_uncertainity = 5,
            Calibration = 6
        }
    
    }
}