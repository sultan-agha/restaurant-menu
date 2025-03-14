import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request-representable.dart';
import '../http_method.dart';

//to be implemented with the menu api

class MenuAPI implements APIRequestRepresentable {
  int? page;
  int? pageSize;

  MenuAPI._({this.page, this.pageSize});

  //this gets the menuItems
  MenuAPI.getMenuItems(int page, int pageSize)
      : this._(page: page, pageSize: pageSize);

  @override
  String get endpoint => APIEndpoint.menuApi;

  String get path {
    return "/menu";
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers => {"X-Api-Key": "PUT_HERE"};

  Map<String, String> get query {
    return {"page": "$page", "pageSize": "$pageSize"};
  }

  @override
  get body => null;

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
