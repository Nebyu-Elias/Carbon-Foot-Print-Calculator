using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace WebApplication1
{
    public class DataStorage
    {
        private const string FilePath = "data.txt";

        public static void StoreTransportData(string vehicleType, double distance, string fuelType, double fuelEfficiency, double carbonFootprint)
        {
            string entryDate = DateTime.Now.ToString();
            string data = $"{vehicleType},{distance},{fuelType},{fuelEfficiency},{entryDate},{carbonFootprint}";

            WriteDataToFile(data);
        }

        public static void StoreElectricityData(string energySource, double electricityUsage, double carbonFootprint)
        {
            string entryDate = DateTime.Now.ToString();
            string data = $"{energySource},{electricityUsage},{entryDate},{carbonFootprint}";

            WriteDataToFile(data);
        }

        private static void WriteDataToFile(string data)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(FilePath, true))
                {
                    writer.WriteLine(data);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred while writing to the file: " + ex.Message);
            }
        }

    }
}