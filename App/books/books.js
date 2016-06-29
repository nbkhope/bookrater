angular.module('bookRater')
.constant('baseURL', 'http://localhost:3000/api')
.factory('booksFactory', ['$http', 'baseURL', function($http, baseURL) {

  // the factory object
  var o = {
    books: []
  };

  // get all the books
  o.getAll = function() {
    return $http.get(baseURL + '/books').success(function(data) {
      angular.copy(data, o.books);
    });
  };

  // get a specific books
  o.get = function(id) {
    return $http.get(baseURL + '/books/' + id).then(function(res) {
      return res.data;
    });
  };

  // create a book
  o.create = function(book) {
    return $http.post(baseURL + '/books', book).success(function(data) {
      o.books.push(data);
    });
  };

  // return the factory object
  return o;

}]);
