'use strict';

angular.module('stroygarant', [
    'ngAnimate',
    'ngCookies',
    'ngTouch',
    'ngSanitize',
    'ngResource',
    'ngRoute',
    'mgcrea.ngStrap',
    'mgcrea.ngStrap.collapse',
    'slick',
    'ngMap',
    'smoothScroll',
    'ui.bootstrap-slider',
    'ngMask'
])

    .constant('ApiBase', 'http://stroygarant.moscow/')

    .directive("scroll", function ($window) {
        return {
            scope: true,
            link: function (scope, element, attrs) {

                angular.element($window).bind("scroll", function () {

                    if(this.pageYOffset >= 70){
                        element.addClass('top-menu-fixed');
                    } else {
                        element.removeClass('top-menu-fixed');
                    }

                });
            }
        }
    })

    .directive("hideSectionLine", function ($window) {
        return {
            scope: true,
            link: function (scope, element, attrs) {

                angular.element($window).bind("scroll", function () {

                    if(this.pageYOffset > 0){
                        element.addClass('hide-section-line');
                    } else {
                        element.removeClass('hide-section-line');
                    }

                });
            }
        }
    })

    .config(function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'app/partials/main.html',
                controller: 'MainCtrl'
            })
            .when('/partners', {
                templateUrl: 'app/partials/partners.html',
                controller: 'PartnersCtrl'
            })
            .when('/calc', {
                templateUrl: 'app/calc/index.html',
                controller: 'CalcCtrl'
            })
            .otherwise({
                redirectTo: '/'
            });
    })

    .run(function ($http) {

    })

;
