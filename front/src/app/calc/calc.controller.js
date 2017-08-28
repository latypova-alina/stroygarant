'use strict';

angular.module('stroygarant')
  .controller('CalcCtrl', function ($scope) {

      var slider = new Slider("#ex14", {
        ticks: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000],
        ticks_positions: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
        ticks_labels: ['0', '100', '200', '300', '400', '500', '600', '700', '800', '900', '1000'],
        ticks_snap_bounds: 0,
        handle: 'square'
      });

  })
;
