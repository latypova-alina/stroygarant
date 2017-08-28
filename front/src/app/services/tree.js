'use strict';

angular.module('stroygarant')

    .service('$tree', function ($http) {
        return $http.get('/tree')
            .success(function (data) {
                console.log(data);
                this.tree = data;
            });
    })

;
