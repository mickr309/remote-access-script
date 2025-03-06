using System;
using System.Net;
using System.Threading;

class ShutdownServer
{
    static void Main()
    {
        // Define the IP and Port
        string ip = "http://*:8080"; // Listen on all interfaces on port 8080
        HttpListener listener = new HttpListener();
        listener.Prefixes.Add(ip);

        // Start listening for incoming HTTP requests
        listener.Start();
        Console.WriteLine("Listening for shutdown requests on " + ip);

        while (true)
        {
            // Wait for a request to come in
            HttpListenerContext context = listener.GetContext();
            string requestPath = context.Request.Url.AbsolutePath;

            if (requestPath == "/shutdown")
            {
                // Respond with shutdown message
                string responseString = "PC is shutting down...";
                byte[] buffer = System.Text.Encoding.UTF8.GetBytes(responseString);
                context.Response.ContentLength64 = buffer.Length;
                context.Response.OutputStream.Write(buffer, 0, buffer.Length);
                context.Response.Close();

                // Trigger the shutdown command
                ShutDownPC();
                break; // End the program after shutdown
            }
            else
            {
                // Send 404 if path is incorrect
                context.Response.StatusCode = 404;
                context.Response.Close();
            }
        }
    }

    static void ShutDownPC()
    {
        // This will shut down the PC immediately
        Console.WriteLine("Shutting down the PC...");
        System.Diagnostics.Process.Start("shutdown", "/s /f /t 0");
    }
}
