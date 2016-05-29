<html data-ng-app="bankApp">

<head>
<title>Next Mail Banking</title>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
<script
	src="//angular-ui.github.io/bootstrap/ui-bootstrap-tpls-1.3.3.js"></script>
<script type="text/javascript" src="JS/customJavaScript.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body data-ng-controller="bankController">

	<h2 style="margin-left: 35%; color: orange;">Next Mail Banking
		Application</h2>
	<br>
	<table style="margin-left: 10%; margin-top: 7%; float: left">
		<tr>
			<td><label data-ng-show="!data" style="color: blue;">Loading...</label></td>
		</tr>
		<tr>
			<td><label>Select Bank</label> <br> <select
				style="color: rgb(3, 169, 244)" data-ng-model="output"
				data-ng-change="selectBank()">
					<option data-ng-repeat="(key,val) in data" value="{{key}}">{{val}}</option>
			</select></td>
		</tr>
		<tr>
			<td><br> <br></td>
		</tr>
		<tr>
			<td><label data-ng-show="data">Select city</label> <input
				data-ng-show="data" type="text" data-ng-model="selected"
				style="color: rgb(3, 169, 244)"
				data-uib-typeahead="bank for bank in selectedBank | filter:$viewValue"
				class="form-control"> <br></td>
		</tr>
	</table>
	<table data-ng-show="selected"
		style="float: left; margin-left: 10%; margin-top: 7%; float: left">
		<tr>
			<td><label> Branches:</label><br></td>
		</tr>
		<tr>
			<td>

				<table>
					<tr data-ng-repeat="(key,value) in finalListBank">
						<td><div style="border: solid;">
								<table>
									<tr>
										<td><label style="font-weight: bold;">IFSC:</label> <label
											style="color: rgb(3, 169, 244)">{{value.ifsc}}</label></td>
									</tr>
									<tr>
										<td><label style="font-weight: bold;">Bank:</label> <label
											style="color: rgb(3, 169, 244)">{{value.bankName}}</label></td>
									</tr>
									<tr>
										<td><label style="font-weight: bold;">Branch:</label> <label
											style="color: rgb(3, 169, 244)">{{value.branch}}</label></td>
									</tr>
									<tr>
										<td><label style="font-weight: bold;">city:</label><label
											style="color: rgb(3, 169, 244)">{{value.city}}</label></td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>