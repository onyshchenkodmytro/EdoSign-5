# DocumentTypesApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**docTypesCreate**](DocumentTypesApi.md#doctypescreate) | **POST** /api/v1/document-types |  |
| [**docTypesDelete**](DocumentTypesApi.md#doctypesdelete) | **DELETE** /api/v1/document-types/{id} |  |
| [**docTypesGetById**](DocumentTypesApi.md#doctypesgetbyid) | **GET** /api/v1/document-types/{id} |  |
| [**docTypesGetV1**](DocumentTypesApi.md#doctypesgetv1) | **GET** /api/v1/document-types |  |
| [**docTypesUpdate**](DocumentTypesApi.md#doctypesupdate) | **PUT** /api/v1/document-types/{id} |  |



## docTypesCreate

> DocumentTypeV2Dto docTypesCreate(documentTypeV2Dto)



### Example

```ts
import {
  Configuration,
  DocumentTypesApi,
} from '';
import type { DocTypesCreateRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new DocumentTypesApi();

  const body = {
    // DocumentTypeV2Dto (optional)
    documentTypeV2Dto: ...,
  } satisfies DocTypesCreateRequest;

  try {
    const data = await api.docTypesCreate(body);
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
| **documentTypeV2Dto** | [DocumentTypeV2Dto](DocumentTypeV2Dto.md) |  | [Optional] |

### Return type

[**DocumentTypeV2Dto**](DocumentTypeV2Dto.md)

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


## docTypesDelete

> docTypesDelete(id)



### Example

```ts
import {
  Configuration,
  DocumentTypesApi,
} from '';
import type { DocTypesDeleteRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new DocumentTypesApi();

  const body = {
    // number
    id: 56,
  } satisfies DocTypesDeleteRequest;

  try {
    const data = await api.docTypesDelete(body);
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


## docTypesGetById

> DocumentTypeV2Dto docTypesGetById(id)



### Example

```ts
import {
  Configuration,
  DocumentTypesApi,
} from '';
import type { DocTypesGetByIdRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new DocumentTypesApi();

  const body = {
    // number
    id: 56,
  } satisfies DocTypesGetByIdRequest;

  try {
    const data = await api.docTypesGetById(body);
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

[**DocumentTypeV2Dto**](DocumentTypeV2Dto.md)

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


## docTypesGetV1

> Array&lt;DocumentTypeV1Dto&gt; docTypesGetV1()



### Example

```ts
import {
  Configuration,
  DocumentTypesApi,
} from '';
import type { DocTypesGetV1Request } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new DocumentTypesApi();

  try {
    const data = await api.docTypesGetV1();
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

[**Array&lt;DocumentTypeV1Dto&gt;**](DocumentTypeV1Dto.md)

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


## docTypesUpdate

> docTypesUpdate(id, documentTypeV2Dto)



### Example

```ts
import {
  Configuration,
  DocumentTypesApi,
} from '';
import type { DocTypesUpdateRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new DocumentTypesApi();

  const body = {
    // number
    id: 56,
    // DocumentTypeV2Dto (optional)
    documentTypeV2Dto: ...,
  } satisfies DocTypesUpdateRequest;

  try {
    const data = await api.docTypesUpdate(body);
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
| **documentTypeV2Dto** | [DocumentTypeV2Dto](DocumentTypeV2Dto.md) |  | [Optional] |

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

