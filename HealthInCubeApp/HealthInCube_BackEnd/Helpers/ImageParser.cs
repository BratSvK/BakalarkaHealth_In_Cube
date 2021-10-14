using System.IO;
using System.ComponentModel;
using System.Threading.Tasks;

namespace HealthInCube_BackEnd.Helpers
{
    public static class ImageParser
    {
        public static async Task<byte[]> GetImageBytesAsync(string imagePath)
        {
            byte[] imageBytes = null;

            using (var stream = new FileStream(imagePath, FileMode.Open))
            {
                imageBytes = new byte[stream.Length];
                await stream.ReadAsync(imageBytes, 0, (int)stream.Length);
            }

            return imageBytes;
        }
        
    }
}