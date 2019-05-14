<%@page import="java.util.List"%>
<%@page import="mic.main.classes.SolarDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style2.css" type="text/css" >
<title>SOLAR</title>
<script src="./scripts/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
<header class="mainHeader">
<nav class="mainNav">
<div class="button"  onclick="toogleMenu()"><div class="bar"></div><div class="bar"></div><div class="bar"></div></div>
<img src="./img/blueFish.png" alt="logo" height="40px" width="70px">
<p>northSeeFish</p>
<ul id="menu" class="navUnvisible">
<li><a href="/MySite/index.jsp">HOME</a></li>
<li><a href="/MySite/solar">SOLAR</a></li>
<li><a href="#">GREENHOUSE</a></li>
<li><a href="#">OTHER</a></li>
</ul>
</nav>
</header>
<section>
<header>
<div class="helloHeader">

<h2><span style="color:yellow">SOLAR </span><span style="color:red">PROJECT</span></h2>
<div class="solarViewContainer">

<% 

List<SolarDB> db = new ArrayList<SolarDB>();
db = (List<SolarDB>)request.getAttribute("sollar");

%>

<h3>Collector temperature: <%= db.get(0).gettDach().toString()%>&deg;C</h3>
<img alt="solar circuit" src="./img/solar.png">
<h3>Domestic water temperature: <%= db.get(0).gettZb().toString()%>&deg;C</h3>
</div>


</div>
</header>
</section>

<canvas id="line-chart" width="800" height="450"></canvas>
<script>
new Chart(document.getElementById("line-chart"), {
	  type: 'line',

	  data: {
	    labels: [ 

	    	<%
			for (SolarDB sd : db) {
				out.println("\""+sd.getDatetime().getHours()+":"+sd.getDatetime().getMinutes()+":"+sd.getDatetime().getSeconds()+"\""+",");
				
			}	
	    	
	    %>	
	    ],
	    
	    datasets: [{ 
	        data: [
	        	<%
				for (SolarDB sd : db) {
					out.println(sd.gettDach().toString()+",");
				}	
		    	
		    %>	
	        ],
	        label: "Collector temperature",
	        borderColor: "red",
	        borderWidth: 1,
	        pointBorderWidth: 0.5,
	        pointRadius:2,
	        fill: false
	      }, { 
	        data: [
	        	<%
				for (SolarDB sd : db) {
					out.println(sd.gettZb().toString()+",");
				}	
		    	
		    %>	
	        	
	        	],
	        label: "Water temperature",
	        borderColor: "blue",
	        pointRadius:2,
	        borderWidth: 1,
	        pointBorderWidth: 0.5,
	        fill: false
	      }
	    ]
	  },
	  options: {
		  
		  scales: {
              xAxes: [{
                  display: true,
                  ticks: {
                      maxTicksLimit: 50
                  }
              }]
		  },  
		  
		  
	    title: {
	      display: true,
	      fontColor: "white",
	      text: 'Last 12 hours'
	    }
	  
	  
	  
	  }
	});
</script>

  
<footer class="mainFooter">
<nav class="mainNav">
<ol>
<li><a href="/MySite/index.jsp">HOME</a></li>
<li><a href="/MySite/solar">SOLAR</a></li>
<li><a href="#">GREENHOUSE</a></li>
<li><a href="#">OTHER</a></li>
</ol>
</nav>
</footer>
</body>
</html>