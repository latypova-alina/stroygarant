'use strict';

angular.module('stroygarant')

    .directive('projects', function (MapService, $http, $log, ApiBase) {
        return {
            templateUrl: 'app/partials/projects.html',
            link: function (scope, element) {

                MapService.initMap('partners-map', {
                    center: new google.maps.LatLng(55.754816, 37.624255),
                    zoom: 10,
                    scrollwheel: false,
                    styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway", "elementType":"labels.text", "stylers":[{"saturation":-100},{"visibility":"off"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
                });

                $http.get(ApiBase + 'projects.json')
                    .success(function (projects) {
                        var markers = [];

                        angular.forEach(projects, function (project) {
                            markers.push([
                                new google.maps.LatLng(project.latitude, project.longitude),
                                {
                                    id: project.id,
                                    project: project
                                }
                            ])
                        });

                        window.showProject = function (event) {
                            var projectId = $(event.target).parents('.infowindow').data('project-id');

                            if (projectId) {
                                angular.forEach(projects, function (project) {
                                    if (project.id == projectId) {
                                        scope.$apply(function () {
                                            scope.currentProject = project;
                                            scope.currentImage = project.images[0];
                                            $log.debug(scope.currentProject);
                                        });
                                    }
                                });
                            }
                        };

                        scope.hideProject = function () {
                            scope.currentProject = null;
                        };

                        MapService.plotPoints(markers, {
                            clearPrevious: true,
                            infoBoxTemplate: 'app/partials/projectsInfoWindow.html',
                            icon: '../../assets/images/marker.png'
                        });
                    });

            }
        }
    })

;
