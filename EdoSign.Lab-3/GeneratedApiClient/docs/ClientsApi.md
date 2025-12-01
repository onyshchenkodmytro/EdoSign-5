# ClientsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**clientsCreate**](ClientsApi.md#clientscreate) | **POST** /api/v1/Clients |  |
| [**clientsDelete**](ClientsApi.md#clientsdelete) | **DELETE** /api/v1/Clients/{id} |  |
| [**clientsGetById**](ClientsApi.md#clientsgetbyid) | **GET** /api/v1/Clients/{id} |  |
| [**clientsGetV1**](ClientsApi.md#clientsgetv1) | **GET** /api/v1/Clients |  |
| [**clientsUpdate**](ClientsApi.md#clientsupdate) | **PUT** /api/v1/Clients/{id} |  |



## clientsCreate

> ClientV2Dto clientsCreate(clientV2Dto)



### Example

```ts
import {
  Configuration,
  ClientsApi,
} from '';
import type { ClientsCreateRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new ClientsApi();

  const body = {
    // ClientV2Dto (optional)
    clientV2Dto: ...,
  } satisfies ClientsCreateRequest;

  try {
    const data = await api.clientsCreate(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **clientV2Dto** | [ClientV2Dto](ClientV2Dto.md) |  | [Optional] |

### Return type

[**ClientV2Dto**](ClientV2Dto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`, `text/json`, `application/*+json`
- **Accept**: `text/plain`, `application/json`, `text/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## clientsDelete

> clientsDelete(id)



### Example

```ts
import {
  Configuration,
  ClientsApi,
} from '';
import type { ClientsDeleteRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new ClientsApi();

  const body = {
    // number
    id: 56,
  } satisfies ClientsDeleteRequest;

  try {
    const data = await api.clientsDelete(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `number` |  | [Defaults to `undefined`] |

### Return type

`void` (Empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## clientsGetById

> ClientV2Dto clientsGetById(id)



### Example

```ts
import {
  Configuration,
  ClientsApi,
} from '';
import type { ClientsGetByIdRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new ClientsApi();

  const body = {
    // number
    id: 56,
  } satisfies ClientsGetByIdRequest;

  try {
    const data = await api.clientsGetById(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `number` |  | [Defaults to `undefined`] |

### Return type

[**ClientV2Dto**](ClientV2Dto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `text/plain`, `application/json`, `text/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## clientsGetV1

> Array&lt;ClientV1Dto&gt; clientsGetV1()



### Example

```ts
import {
  Configuration,
  ClientsApi,
} from '';
import type { ClientsGetV1Request } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new ClientsApi();

  try {
    const data = await api.clientsGetV1();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;ClientV1Dto&gt;**](ClientV1Dto.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `text/plain`, `application/json`, `text/json`


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)


## clientsUpdate

> clientsUpdate(id, clientV2Dto)



### Example

```ts
import {
  Configuration,
  ClientsApi,
} from '';
import type { ClientsUpdateRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new ClientsApi();

  const body = {
    // number
    id: 56,
    // ClientV2Dto (optional)
    clientV2Dto: ...,
  } satisfies ClientsUpdateRequest;

  try {
    const data = await api.clientsUpdate(body);
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

// Run the test
example().catch(console.error);
```

### Parameters


| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **id** | `number` |  | [Defaults to `undefined`] |
| **clientV2Dto** | [ClientV2Dto](ClientV2Dto.md) |  | [Optional] |

### Return type

`void` (Empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: `application/json`, `text/json`, `application/*+json`
- **Accept**: Not defined


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#api-endpoints) [[Back to Model list]](../README.md#models) [[Back to README]](../README.md)

