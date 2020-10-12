<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>결산</title>
  <!-- Custom fonts for this template-->
  <link href="${path_resources}sb_admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path_resources}sb_admin/css/sb-admin-2.min.css" rel="stylesheet">
  
  <!-- 선 그래프 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var resource = new Array();
    	  
        var data = google.visualization.arrayToDataTable(
        	${jsonArray}		
        );

        var options = {
        /*   title: '수입(월별)', */
          curveType: 'function',
          pointSize: 5,
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('myAreaChart'));

        chart.draw(data, options);
      }
    </script>
  
  	<!-- 막대그래프 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
       
        var resource = new Array();
        
        var data = google.visualization.arrayToDataTable(
        		${jsonArray1}
        		);

        var options = {
         /*  title : '월별 진료수',
          vAxis: {title: 'COUNT'},
          hAxis: {title: 'Month'}, */
          seriesType: 'bars',
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);        
      }
    </script>
  	
    <!-- 파이그래프 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string','진료과')
        data.addColumn('number','진료수')
        data.addRows(
        	${jsonArray2}
       );

        // Set chart options
        var options = {
        			   'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('myPieChart'));
        chart.draw(data, options);
      }
    </script>
</head>
<body id="page-top">

	<!-- header -->
	<%@include file="./host_header.jsp" %>
	<!-- End of header -->
	
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
          	<br><br>
            <h1 class="h3 mb-0 text-gray-800"></h1>
            
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">수입 (Monthly)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${monthlyProfit}"/>￦
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">수입 (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                       <fmt:formatNumber type="number" maxFractionDigits="3" value="${yearlyProfit}"/>￦
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">진료수 (Monthly)</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                              <fmt:formatNumber type="number" maxFractionDigits="3" value="${monthlyTreatment}"/>회
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">진료수 (Annual)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                         <fmt:formatNumber type="number" maxFractionDigits="3" value="${yearlyTreatment}"/>회
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <div class="col-xl-8 col-lg-7">

              <!-- Area Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">월별 수입</h6>
                </div>
                <div class="card-body" style="height:420px; width:1050px;">
                  <div class="chart-area">
                    <div id="myAreaChart" style="height:350px;"></div>
                  </div>
                </div>
              </div>

              <!-- Bar Chart -->
              <div class="card shadow mb-4" style="width:1630px;">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">월별 진료수</h6>
                </div>
                <div class="card-body" style="height:420px;">
                  <div class="chart-bar">
                    <div id="chart_div" style="height:400px;"></div>
                  </div>
                </div>
              </div>

            </div>

            <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">금월 진료과별 진료수</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body" style="height:420px;">
                  <div class="chart-pie pt-4">
                    <div id="myPieChart"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

	<!-- Footer -->
	 <%@include file="./host_footer.jsp" %>	
	<!-- End of Footer -->


</body>
 
</html>