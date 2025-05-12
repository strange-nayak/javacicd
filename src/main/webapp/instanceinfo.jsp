<%
    // Read Instance ID from EC2 Instance Metadata
    String instanceId = "";
    try {
        java.net.URL url = new java.net.URL("http://169.254.169.254/latest/meta-data/instance-id");
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) url.openConnection();
        con.setConnectTimeout(1000);
        con.setReadTimeout(1000);
        try (java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(con.getInputStream()))) {
            instanceId = in.readLine();
        }
    } catch (Exception e) {
        instanceId = "unknown";
    }

    // Read Availability Zone from EC2 Instance Metadata
    String az = "";
    try {
        java.net.URL url = new java.net.URL("http://169.254.169.254/latest/meta-data/placement/availability-zone");
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) url.openConnection();
        con.setConnectTimeout(1000);
        con.setReadTimeout(1000);
        try (java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(con.getInputStream()))) {
            az = in.readLine();
        }
    } catch (Exception e) {
        az = "unknown";
    }
%>
<html>
<head><title>Instance Info</title></head>
<body>
    <h2>EC2 Instance Info</h2>
    <p><b>Instance ID:</b> <%= instanceId %></p>
    <p><b>Availability Zone:</b> <%= az %></p>
</body>
</html>