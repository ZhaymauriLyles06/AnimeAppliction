<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <style>
        /* Add CSS styles for the grid layout */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 30px;
            margin-bottom: 20px;
            margin-top: 5px;
            margin-left: 0px;
            border: 1px solid black;
            padding: 10px;
        }
        
        /* Add CSS styles for the search bar */
        .search-form {
            margin-bottom: 20px;
            margin-left: 20px;
        }
        
        .search-form input[type="text"] {
            margin-left: 20px;
         }
    </style>
    <title>AnimeList</title>
</head>
<body>
    
    <h1 style="margin-left: 20px;">TheAnimeCatalogue</h1>
    <p style="margin-left: 20px;">Here on MyAnimeCatalogue, you can search for any Anime you want and look for information on the series such as ratings, synopses, and more.</p>
   
    <form class="search-form" action="responses.jsp" method="GET"> 
    <input type=" " name="search" placeholder="Search by series title">
    <input type="submit" value="Search">
    </form>
    
    <p style="margin-left: 20px;">Our Website holds series such as:</p>

    <div class="grid-container">
        <%-- Use a try-catch block to catch any errors --%>
        <% try {
            // Create a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Series",
                    "root", "admin");

            // Create a new statement using the database connection
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT DISTINCT Title, Picture FROM Series;");
            
            // Loop through the records in the result set
            while (resultSet.next()) {
                String title = resultSet.getString("Title");
        %>
        
        <div>
            <h3><% out.print(title); %></h3>
              <img src="<%=resultSet.getString("picture")%>" alt=""width="200"height-="400" >        
           
        </div>

        <%
            }//end while loop
// Close the result set and database connection
            
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </div>
</body>
</html>
 