
using System.Globalization;
using Google.Protobuf;

namespace UnoApp1.Tests;

public class UnitTest1
{
    [SetUp]
    public void Setup()
    {
    }

    [Test]
    public void Test1()
    {
        var s = ByteString.CopyFromUtf8("Espressif");
        Console.WriteLine(s.ToBase64());

        var firmVersion = "0.08000";
        
        var dbl =  double.Parse(firmVersion, CultureInfo.InvariantCulture);
            
        Assert.That(dbl == 0.08);
    }
}