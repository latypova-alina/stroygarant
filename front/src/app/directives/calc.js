'use strict';

angular.module('stroygarant')

    .directive('calc', function ($http, $log, ApiBase) {
        return {
            templateUrl: 'app/partials/calc.html',
            link: function (scope) {
                var tree, paramIndex, selectedParams;

                scope.init = function () {
                    scope.currentCategory = null;
                    scope.categories = [];
                    scope.currentParam = null;
                    scope.paramValues = [];
                    scope.stepNum = 1;
                    scope.stepDesc = 'выберите тип материала';
                    scope.currentProduct = null;
                    scope.quantity = 100;
                    scope.stepType = 'categories';
                    scope.totalSum = 0;

                    tree = [];
                    paramIndex = -1;
                    selectedParams = [];

                    $http.get(ApiBase + 'tree.json')
                        .success(function (data) {
                            tree = data;
                            scope.categories = data;
                        });
                };

                scope.init();

                scope.setCategory = function (category) {
                    scope.currentCategory = category;
                    scope.stepNum++;

                    if (category.children) {
                        scope.categories = category.children;
                    } else {
                        scope.categories = [];
                        nextParam();
                        scope.stepType = 'params';
                    }
                };

                scope.setParamValue = function (value) {
                    selectedParams[scope.currentParam.id] = value.id;
                    nextParam();
                };

                scope.setProduct = function (product) {
                    scope.currentProduct = product;

                    $log.debug('current product', product);

                    scope.stepNum++;
                    scope.stepType = 'quantity';
                    scope.stepDesc = 'укажите количество';
                };

                scope.setQuantity = function () {
                    scope.stepNum++;
                    scope.stepType = 'delivery';
                    scope.stepDesc = 'доставка';

                    scope.totalSum = Math.round(scope.currentProduct.price * scope.quantity);
                };

                scope.setDelivery = function () {
                    scope.stepNum++;
                    scope.stepType = 'sum';
                    scope.stepDesc = 'сумма заказа';
                };

                scope.quantityUp = function () {
                    scope.quantity++;
                };

                scope.quantityDown = function () {
                    if (scope.quantity > 0) {
                        scope.quantity--;
                    }
                };

                scope.toggleQntInput = function () {
                    if (scope.showQntInput) {
                        scope.showQntInput = false;
                    } else {
                        scope.showQntInput = true;
                        angular.element('input.qnt').focus();
                    }
                };

                function nextParam() {
                    paramIndex++;
                    scope.stepNum++;
                    scope.currentParam = scope.currentCategory.params[paramIndex];

                    if (scope.currentParam) {
                        scope.stepDesc = 'укажите ' + scope.currentParam.name;
                        scope.paramValues = scope.currentParam.values;
                    } else {
                        scope.paramValues = [];
                        $log.debug('load products');
                        $log.debug('category', scope.currentCategory.id);
                        $log.debug('selected params', selectedParams);

                        getProducts();
                    }
                }

                function getProducts() {
                    var params = {
                        category_id: scope.currentCategory.id
                    };

                    angular.forEach(selectedParams, function (value, type) {
                        params['selected_params[' + type + ']'] = value;
                    });

                    $http.get(ApiBase + 'products.json', {
                        params: params
                    }).success(function (products) {
                        $log.debug(products);
                        scope.stepNum++;
                        scope.stepDesc = 'выберите товар';
                        scope.stepType = 'products';
                        scope.products = products;
                    });
                }

                scope.getProducts = getProducts;

                new Slider("#ex14", {
                    ticks: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000],
                    ticks_positions: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                    ticks_labels: ['0', '100', '200', '300', '400', '500', '600', '700', '800', '900', '1000'],
                    ticks_snap_bounds: 0,
                    handle: 'square'
                });
            }
        }
    })

;
