'use strict';

angular.module('stroygarant')

    .directive('callRequest', function ($modal, $http, $log) {
        return {
            link: function (scope, element) {
                var modal = null;
                scope.busy = false;

                scope.name = 'Имя';
                scope.phone = '+7';

                scope.$watch('phone', function (phone) {
                   if (phone == '') {
                       scope.phone = '+7';
                   }
                });

                scope.callRequest = function () {
                    modal = $modal({
                        template: 'app/partials/callRequest.html',
                        show: true,
                        scope: scope
                    });
                };

                element.click(function () {
                    scope.callRequest();
                });

                scope.sendRequest = function () {
                    if (scope.busy) return;
                    scope.busy = true;

                    var data = {
                        name: scope.name,
                        phone: scope.phone
                    };

                    $http.post('/call_request.json', data)
                        .success(function () {
                            alert('Ваш запрос отправлен!');
                            if (modal) modal.hide();
                            scope.busy = false;

                            scope.name = '';
                            scope.phone = '';
                        })
                        .error(function () {
                            alert('Произошла ошибка!');
                            scope.busy = false;
                        })
                    ;
                };
            }
        }
    })

;
