# SignedDocumentsApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**signedDocsDelete**](SignedDocumentsApi.md#signeddocsdelete) | **DELETE** /api/v1/signed-documents/{id} |  |
| [**signedDocsGetById**](SignedDocumentsApi.md#signeddocsgetbyid) | **GET** /api/v1/signed-documents/{id} |  |
| [**signedDocsGetV1**](SignedDocumentsApi.md#signeddocsgetv1) | **GET** /api/v1/signed-documents |  |



## signedDocsDelete

> signedDocsDelete(id)



### Example

```ts
import {
  Configuration,
  SignedDocumentsApi,
} from '';
import type { SignedDocsDeleteRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new SignedDocumentsApi();

  const body = {
    // number
    id: 56,
  } satisfies SignedDocsDeleteRequest;

  try {
    const data = await api.signedDocsDelete(body);
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


## signedDocsGetById

> SignedDocumentV2Dto signedDocsGetById(id)



### Example

```ts
import {
  Configuration,
  SignedDocumentsApi,
} from '';
import type { SignedDocsGetByIdRequest } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new SignedDocumentsApi();

  const body = {
    // number
    id: 56,
  } satisfies SignedDocsGetByIdRequest;

  try {
    const data = await api.signedDocsGetById(body);
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

[**SignedDocumentV2Dto**](SignedDocumentV2Dto.md)

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


## signedDocsGetV1

> Array&lt;SignedDocumentV1Dto&gt; signedDocsGetV1()



### Example

```ts
import {
  Configuration,
  SignedDocumentsApi,
} from '';
import type { SignedDocsGetV1Request } from '';

async function example() {
  console.log("🚀 Testing  SDK...");
  const api = new SignedDocumentsApi();

  try {
    const data = await api.signedDocsGetV1();
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

[**Array&lt;SignedDocumentV1Dto&gt;**](SignedDocumentV1Dto.md)

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

