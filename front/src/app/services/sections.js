'use strict';

angular.module('stroygarant')

    .factory('sections', function () {
        var sections = {
            keys: [],
            keyIndex: {},
            store: {},

            add: function(key, value) {
                if(typeof(value) === 'undefined') value = {};

                this.keyIndex[key] = this.keys.length;
                this.keys.push(key);
                this.store[key] = value;
            },

            prev: function(key) {
                return this.keys[this.keyIndex[key] - 1];
            },

            next: function(key) {
                return this.keys[this.keyIndex[key] + 1];
            },

            load: function (ss) {
                var self = this;
                angular.forEach(ss, function (section) {
                    self.add(section);
                })
            },

            clear: function () {
                this.keys = [];
                this.keyIndex = {};
                this.store = {};
            }
        };

        return sections;
    })

;
