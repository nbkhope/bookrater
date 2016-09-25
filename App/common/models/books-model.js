'use strict';

angular.module('bookRater')
.factory('BooksModel', ['$http', 'ENDPOINT_URI', function($http, ENDPOINT_URI) {

  // the factory object
  var o = {
    //books: []
  };

  var extract = function(result) {
    return result.data;
  };

  var getUrl = function() {
    return ENDPOINT_URI + 'books';
  };

  var getUrlForId = function(id) {
    return ENDPOINT_URI + 'books/' + id;
  };

  // get all the books
  o.all = function() {
    return $http.get(getUrl()).then(extract);
  };

  // get a specific books
  o.get = function(id) {
    return $http.get(getUrlForId(id)).then(extract);
  };

  // create a book
  o.create = function(book) {
    return $http.post(getUrl(), book).then(extract);
  };

  // update a book
  o.update = function(bookId, book) {
    return $http.put(getUrlForId(bookId), book).then(extract);
  };

  // destroy a book
  o.destroy = function(bookId) {
    return $http.delete(getUrlForId(bookId)).then(extract);
  };

  // return the factory object
  return o;

}]);
