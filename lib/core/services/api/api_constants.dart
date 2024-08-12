
class ApiSettings {
  static const timeOut = 15;
  static const baseUrl = 'https://huldrs.com';
}

class ApiHeaders {
  /// keys
  static const headerAuthorizationKey = 'authorization';
  static const headerContentTypeKey = 'content-type';
  static const headerAcceptKey = 'accept';
  static const headerApiKey = 'api-key';
  // values
  static const headerValueApplicationJson = 'application/json';
  static const headerValueApplicationForm = 'application/x-www-form-urlencoded';
  static const headerValueApplicationText = 'text/html';
}

class ApiUris {
  /// base url

  /// search uri
  static String searchUri(String keyword) => '/api/search/?q=$keyword';

  /// section uri
  static const getMainSectionsUri = '/api/sections';
  static String getSectionItemsUri(String id) => '/api/sections/$id';
  static String getSectionFileUri(String id) => '/api/file/$id';

  /// playlist uri
  static const getMainPlaylistsUri = '/api/playlists';
  static String getPlaylistItemsUri(String id) => '/api/playlists/$id';
  static String getVideoUri(String id) => '/api/video/$id';

  /// Genre uri
  static const getMainGenresUri = '/api/genres';
  static String getGenreItemsUri(String id) => '/api/genres/$id';
  static String getGameUri(String id) => '/api/game/$id';

  /// binder uri
  static const getMainBindersUri = '/api/binders';
  static String getBinderItemsUri(String id) => '/api/binders/$id';
  static String getWorksheetUri(String id) => '/api/worksheet/$id';

  /// test uri
  static const getMainTestCategoriesUri = '/api/tests';
  static String getTestCategoryItemsUri(String id) => '/api/tests/$id';
  static String getTestUri(String id) => '/api/test/$id';

  /// student test uri
  static String getStudentTestCategoryUri(String id) =>
      '/api/tests-categories/$id';

  static String getStudentTestUri = '/api/create-student-test';
}
