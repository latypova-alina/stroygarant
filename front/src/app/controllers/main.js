'use strict';

angular.module('stroygarant')

    .controller('MainCtrl', function ($scope, sections, smoothScroll) {

        sections.load(['about', 'advantages', 'calc', 'projects', 'contacts']);

        $scope.sections = sections;

        $scope.page = 'main';

        $scope.currentSection = 'about';
        var lastScrollTime;

        $scope.scrollTo = function (section) {
            var element = document.getElementById('section-' + section);

            smoothScroll(element, {
                callbackAfter: function () {
                    $scope.$apply(function () {
                        $scope.currentSection = section;
                    });
                }
            });
        };

        angular.element('[ng-view]').bind('mousewheel', function (event) {
            event.preventDefault();

            doScroll(event.originalEvent.wheelDelta < 0);
        });

        function doScroll (down) {
            if (lastScrollTime + 1000 > Date.now()) {
                return;
            }

            var nextSection;

            if (down) {
                nextSection = sections.next($scope.currentSection);
            } else {
                nextSection = sections.prev($scope.currentSection);
            }

            if (nextSection) {
                $scope.scrollTo(nextSection);
            }

            lastScrollTime = Date.now();
        }

        $scope.$on('$destroy', function () {
            sections.clear();
        });
    })

    .controller('OurObjects', function ($scope) {

    })

;
