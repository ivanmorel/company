/**
 * Created by Ivan on 2/11/2017.
 */

app.controller('controller', function($scope){
    $scope.exp = '';
    $scope.addText = function (a) {
        $scope.exp += a;
    };
    $scope.execute = function() {
        $scope.exp = $scope.$eval($scope.exp);
    };
    $scope.clear = function() {
        $scope.exp = "";
    };
});