/*
 * The modules converts this application in to Angular JS Application
 */
var bankApp = angular.module("bankApp", [ 'ngAnimate', 'ui.bootstrap' ]);

/*
 * The controller "bankController" augments the controller scope
 */

bankApp.controller('bankController', function($scope, $http) {

	$scope.selected = "";
	$scope.selectedBank = [];
	$scope.finalListBank = [];

	/*
	 * This http request is made when the page is loaded.
	 * 
	 * This retrieves all the details of the bank from web server
	 */
	$http({
		method : 'GET',
		url : 'bank/details',
	}).then(function successCallback(response) {
		$scope.data = response.data.unique;
		$scope.bankDetails = response.data.all;
	}, function errorCallback(response) {
		console.log("In error");
	});
	/*
	 * This function parse the Json and retrieve all the city names in which the
	 * banks are located
	 */
	$scope.selectBank = function() {
		$scope.selected = undefined;
		$scope.selectedBank = [];
		$scope.finalListBank = [];
		angular.forEach($scope.bankDetails, function(value, key) {
			if (value.bankId == $scope.output) {
				if ($scope.selectedBank.indexOf(value.city) == -1) {
					$scope.selectedBank.push(value.city);
				}
			}
		});
	}
	/*
	 * This watch method is invoked when the city name is chosen in the input
	 * filed to populate the bank details
	 */
	$scope.$watch('selected', function() {
		if ($scope.selected) {
			$scope.finalListBank = [];
			angular.forEach($scope.bankDetails, function(value, key) {
				if (value.bankId == $scope.output
						&& angular.equals(value.city, $scope.selected)) {
					$scope.finalListBank.push(value);
				}
			});
		}
	});

});