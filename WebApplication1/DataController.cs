using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1;

namespace WebApplication1
{
    public class DataController : ApiController
    {
        [HttpPost]
        public IHttpActionResult StoreTransportData([FromBody] TransportDataModel model)
        {
            DataStorage.StoreTransportData(model.VehicleType, model.Distance, model.FuelType, model.FuelEfficiency, model.CarbonFootprint);
            return Ok("Data stored successfully");
        }

        [HttpPost]
        public IHttpActionResult StoreElectricityData([FromBody] ElectricityDataModel model)
        {
            DataStorage.StoreElectricityData(model.EnergySource, model.ElectricityUsage, model.CarbonFootprint);
            return Ok("Data stored successfully");
        }
    }

    public class TransportDataModel
    {
        public string VehicleType { get; set; }
        public double Distance { get; set; }
        public string FuelType { get; set; }
        public double FuelEfficiency { get; set; }
        public double CarbonFootprint { get; set; }
    }

    public class ElectricityDataModel
    {
        public string EnergySource { get; set; }
        public double ElectricityUsage { get; set; }
        public double CarbonFootprint { get; set; }
    }
}