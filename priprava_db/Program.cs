using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using Newtonsoft.Json;

namespace TextDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            var filePath = $"{Environment.CurrentDirectory}\\sympton.unl";
            var filePathJson = $"{Environment.CurrentDirectory}\\sympton.json";



            //var jsonSymptom = ConvertCsvFileToJsonObject(filePath);

            //File.WriteAllText(filePath + ".json", jsonSymptom);


            var jsonChoroba = File.ReadAllText(filePathJson);


            

            var zoznamChorob = JsonConvert.DeserializeObject<List<Symptom>>(jsonChoroba);

            SaveToCsv(zoznamChorob, filePath);







            Console.WriteLine();


        }

        private static  void SaveToCsv<T>(List<T> reportData, string path)
        {
            var lines = new List<string>();
            IEnumerable<PropertyDescriptor> props = TypeDescriptor.GetProperties(typeof(T)).OfType<PropertyDescriptor>();
            var header = string.Join(";", props.ToList().Select(x => x.Name));
            lines.Add(header);
            var valueLines = reportData.Select(row => string.Join(";", header.Split(';').Select(a => row.GetType().GetProperty(a).GetValue(row, null))) + ';');
            lines.AddRange(valueLines);
            File.WriteAllLines(path, lines.ToArray());
        }

        public static string ConvertCsvFileToJsonObject(string path)
        {
            var csv = new List<string[]>();
            var lines = File.ReadAllLines(path);

            foreach (string line in lines)
            {
                csv.Add(line.Split(','));
            }

            var properties = csv[0];

            var listObjResult = new List<Dictionary<string, string>>();

            for (int i = 1; i < csv.Count; i++)
            {
                var objResult = new Dictionary<string, string>();
                for (int j = 0; j < properties.Length; j++)
                {
                    var item = csv[i][j];
                    objResult.Add(properties[j], item);
                }

                listObjResult.Add(objResult);
            }

            return JsonConvert.SerializeObject(listObjResult);
        }
    }
}
