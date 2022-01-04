# airbyte_api_client.ConnectionApi

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_connection**](ConnectionApi.md#create_connection) | **POST** /v1/connections/create | Create a connection between a source and a destination
[**delete_connection**](ConnectionApi.md#delete_connection) | **POST** /v1/connections/delete | Delete a connection
[**get_connection**](ConnectionApi.md#get_connection) | **POST** /v1/connections/get | Get a connection
[**get_state**](ConnectionApi.md#get_state) | **POST** /v1/state/get | Fetch the current state for a connection.
[**list_all_connections_for_workspace**](ConnectionApi.md#list_all_connections_for_workspace) | **POST** /v1/connections/list_all | Returns all connections for a workspace, including deleted connections.
[**list_connections_for_workspace**](ConnectionApi.md#list_connections_for_workspace) | **POST** /v1/connections/list | Returns all connections for a workspace.
[**reset_connection**](ConnectionApi.md#reset_connection) | **POST** /v1/connections/reset | Reset the data for the connection. Deletes data generated by the connection in the destination. Resets any cursors back to initial state.
[**search_connections**](ConnectionApi.md#search_connections) | **POST** /v1/connections/search | Search connections
[**sync_connection**](ConnectionApi.md#sync_connection) | **POST** /v1/connections/sync | Trigger a manual sync of the connection
[**update_connection**](ConnectionApi.md#update_connection) | **POST** /v1/connections/update | Update a connection


# **create_connection**
> ConnectionRead create_connection(connection_create)

Create a connection between a source and a destination

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.connection_create import ConnectionCreate
from airbyte_api_client.model.connection_read import ConnectionRead
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_create = ConnectionCreate(
        name="name_example",
        namespace_definition=NamespaceDefinitionType("source"),
        namespace_format="${SOURCE_NAMESPACE}",
        prefix="prefix_example",
        source_id="source_id_example",
        destination_id="destination_id_example",
        operation_ids=[
            "operation_ids_example",
        ],
        sync_catalog=AirbyteCatalog(
            streams=[
                AirbyteStreamAndConfiguration(
                    stream=AirbyteStream(
                        name="name_example",
                        json_schema={},
                        supported_sync_modes=[
                            SyncMode("full_refresh"),
                        ],
                        source_defined_cursor=True,
                        default_cursor_field=[
                            "default_cursor_field_example",
                        ],
                        source_defined_primary_key=[
                            [
                                "string_example",
                            ],
                        ],
                        namespace="namespace_example",
                    ),
                    config=AirbyteStreamConfiguration(
                        sync_mode=SyncMode("full_refresh"),
                        cursor_field=[
                            "cursor_field_example",
                        ],
                        destination_sync_mode=DestinationSyncMode("append"),
                        primary_key=[
                            [
                                "string_example",
                            ],
                        ],
                        alias_name="alias_name_example",
                        selected=True,
                    ),
                ),
            ],
        ),
        schedule=ConnectionSchedule(
            units=1,
            time_unit="minutes",
        ),
        status=ConnectionStatus("active"),
        resource_requirements=ResourceRequirements(
            cpu_request="cpu_request_example",
            cpu_limit="cpu_limit_example",
            memory_request="memory_request_example",
            memory_limit="memory_limit_example",
        ),
    ) # ConnectionCreate | 

    # example passing only required values which don't have defaults set
    try:
        # Create a connection between a source and a destination
        api_response = api_instance.create_connection(connection_create)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->create_connection: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_create** | [**ConnectionCreate**](ConnectionCreate.md)|  |

### Return type

[**ConnectionRead**](ConnectionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_connection**
> delete_connection(connection_id_request_body)

Delete a connection

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.connection_id_request_body import ConnectionIdRequestBody
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_id_request_body = ConnectionIdRequestBody(
        connection_id="connection_id_example",
    ) # ConnectionIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Delete a connection
        api_instance.delete_connection(connection_id_request_body)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->delete_connection: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id_request_body** | [**ConnectionIdRequestBody**](ConnectionIdRequestBody.md)|  |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**204** | The resource was deleted successfully. |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_connection**
> ConnectionRead get_connection(connection_id_request_body)

Get a connection

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.connection_id_request_body import ConnectionIdRequestBody
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from airbyte_api_client.model.connection_read import ConnectionRead
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_id_request_body = ConnectionIdRequestBody(
        connection_id="connection_id_example",
    ) # ConnectionIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Get a connection
        api_response = api_instance.get_connection(connection_id_request_body)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->get_connection: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id_request_body** | [**ConnectionIdRequestBody**](ConnectionIdRequestBody.md)|  |

### Return type

[**ConnectionRead**](ConnectionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_state**
> ConnectionState get_state(connection_id_request_body)

Fetch the current state for a connection.

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.connection_id_request_body import ConnectionIdRequestBody
from airbyte_api_client.model.connection_state import ConnectionState
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_id_request_body = ConnectionIdRequestBody(
        connection_id="connection_id_example",
    ) # ConnectionIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Fetch the current state for a connection.
        api_response = api_instance.get_state(connection_id_request_body)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->get_state: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id_request_body** | [**ConnectionIdRequestBody**](ConnectionIdRequestBody.md)|  |

### Return type

[**ConnectionState**](ConnectionState.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_all_connections_for_workspace**
> ConnectionReadList list_all_connections_for_workspace(workspace_id_request_body)

Returns all connections for a workspace, including deleted connections.

List connections for workspace, including deleted connections.

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.workspace_id_request_body import WorkspaceIdRequestBody
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from airbyte_api_client.model.connection_read_list import ConnectionReadList
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    workspace_id_request_body = WorkspaceIdRequestBody(
        workspace_id="workspace_id_example",
    ) # WorkspaceIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Returns all connections for a workspace, including deleted connections.
        api_response = api_instance.list_all_connections_for_workspace(workspace_id_request_body)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->list_all_connections_for_workspace: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspace_id_request_body** | [**WorkspaceIdRequestBody**](WorkspaceIdRequestBody.md)|  |

### Return type

[**ConnectionReadList**](ConnectionReadList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_connections_for_workspace**
> ConnectionReadList list_connections_for_workspace(workspace_id_request_body)

Returns all connections for a workspace.

List connections for workspace. Does not return deleted connections.

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.workspace_id_request_body import WorkspaceIdRequestBody
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from airbyte_api_client.model.connection_read_list import ConnectionReadList
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    workspace_id_request_body = WorkspaceIdRequestBody(
        workspace_id="workspace_id_example",
    ) # WorkspaceIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Returns all connections for a workspace.
        api_response = api_instance.list_connections_for_workspace(workspace_id_request_body)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->list_connections_for_workspace: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspace_id_request_body** | [**WorkspaceIdRequestBody**](WorkspaceIdRequestBody.md)|  |

### Return type

[**ConnectionReadList**](ConnectionReadList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reset_connection**
> JobInfoRead reset_connection(connection_id_request_body)

Reset the data for the connection. Deletes data generated by the connection in the destination. Resets any cursors back to initial state.

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.connection_id_request_body import ConnectionIdRequestBody
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from airbyte_api_client.model.job_info_read import JobInfoRead
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_id_request_body = ConnectionIdRequestBody(
        connection_id="connection_id_example",
    ) # ConnectionIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Reset the data for the connection. Deletes data generated by the connection in the destination. Resets any cursors back to initial state.
        api_response = api_instance.reset_connection(connection_id_request_body)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->reset_connection: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id_request_body** | [**ConnectionIdRequestBody**](ConnectionIdRequestBody.md)|  |

### Return type

[**JobInfoRead**](JobInfoRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_connections**
> ConnectionReadList search_connections(connection_search)

Search connections

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.connection_search import ConnectionSearch
from airbyte_api_client.model.connection_read_list import ConnectionReadList
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_search = ConnectionSearch(
        connection_id="connection_id_example",
        name="name_example",
        namespace_definition=NamespaceDefinitionType("source"),
        namespace_format="${SOURCE_NAMESPACE}",
        prefix="prefix_example",
        source_id="source_id_example",
        destination_id="destination_id_example",
        schedule=ConnectionSchedule(
            units=1,
            time_unit="minutes",
        ),
        status=ConnectionStatus("active"),
        source=SourceSearch(
            source_definition_id="source_definition_id_example",
            source_id="source_id_example",
            workspace_id="workspace_id_example",
            connection_configuration=None,
            name="name_example",
            source_name="source_name_example",
        ),
        destination=DestinationSearch(
            destination_definition_id="destination_definition_id_example",
            destination_id="destination_id_example",
            workspace_id="workspace_id_example",
            connection_configuration=None,
            name="name_example",
            destination_name="destination_name_example",
        ),
    ) # ConnectionSearch | 

    # example passing only required values which don't have defaults set
    try:
        # Search connections
        api_response = api_instance.search_connections(connection_search)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->search_connections: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_search** | [**ConnectionSearch**](ConnectionSearch.md)|  |

### Return type

[**ConnectionReadList**](ConnectionReadList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sync_connection**
> JobInfoRead sync_connection(connection_id_request_body)

Trigger a manual sync of the connection

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.connection_id_request_body import ConnectionIdRequestBody
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.not_found_known_exception_info import NotFoundKnownExceptionInfo
from airbyte_api_client.model.job_info_read import JobInfoRead
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_id_request_body = ConnectionIdRequestBody(
        connection_id="connection_id_example",
    ) # ConnectionIdRequestBody | 

    # example passing only required values which don't have defaults set
    try:
        # Trigger a manual sync of the connection
        api_response = api_instance.sync_connection(connection_id_request_body)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->sync_connection: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_id_request_body** | [**ConnectionIdRequestBody**](ConnectionIdRequestBody.md)|  |

### Return type

[**JobInfoRead**](JobInfoRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**404** | Object with given id was not found. |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_connection**
> ConnectionRead update_connection(connection_update)

Update a connection

### Example


```python
import time
import airbyte_api_client
from airbyte_api_client.api import connection_api
from airbyte_api_client.model.invalid_input_exception_info import InvalidInputExceptionInfo
from airbyte_api_client.model.connection_read import ConnectionRead
from airbyte_api_client.model.connection_update import ConnectionUpdate
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:8000/api
# See configuration.py for a list of all supported configuration parameters.
configuration = airbyte_api_client.Configuration(
    host = "http://localhost:8000/api"
)


# Enter a context with an instance of the API client
with airbyte_api_client.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = connection_api.ConnectionApi(api_client)
    connection_update = ConnectionUpdate(
        connection_id="connection_id_example",
        namespace_definition=NamespaceDefinitionType("source"),
        namespace_format="${SOURCE_NAMESPACE}",
        prefix="prefix_example",
        operation_ids=[
            "operation_ids_example",
        ],
        sync_catalog=AirbyteCatalog(
            streams=[
                AirbyteStreamAndConfiguration(
                    stream=AirbyteStream(
                        name="name_example",
                        json_schema={},
                        supported_sync_modes=[
                            SyncMode("full_refresh"),
                        ],
                        source_defined_cursor=True,
                        default_cursor_field=[
                            "default_cursor_field_example",
                        ],
                        source_defined_primary_key=[
                            [
                                "string_example",
                            ],
                        ],
                        namespace="namespace_example",
                    ),
                    config=AirbyteStreamConfiguration(
                        sync_mode=SyncMode("full_refresh"),
                        cursor_field=[
                            "cursor_field_example",
                        ],
                        destination_sync_mode=DestinationSyncMode("append"),
                        primary_key=[
                            [
                                "string_example",
                            ],
                        ],
                        alias_name="alias_name_example",
                        selected=True,
                    ),
                ),
            ],
        ),
        schedule=ConnectionSchedule(
            units=1,
            time_unit="minutes",
        ),
        status=ConnectionStatus("active"),
        resource_requirements=ResourceRequirements(
            cpu_request="cpu_request_example",
            cpu_limit="cpu_limit_example",
            memory_request="memory_request_example",
            memory_limit="memory_limit_example",
        ),
    ) # ConnectionUpdate | 

    # example passing only required values which don't have defaults set
    try:
        # Update a connection
        api_response = api_instance.update_connection(connection_update)
        pprint(api_response)
    except airbyte_api_client.ApiException as e:
        print("Exception when calling ConnectionApi->update_connection: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **connection_update** | [**ConnectionUpdate**](ConnectionUpdate.md)|  |

### Return type

[**ConnectionRead**](ConnectionRead.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful operation |  -  |
**422** | Input failed validation |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
