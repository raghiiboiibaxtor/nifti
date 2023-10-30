/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/endpoint/v3/load_report.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_CONFIG_ENDPOINT_V3_LOAD_REPORT_PROTO_UPB_H_
#define ENVOY_CONFIG_ENDPOINT_V3_LOAD_REPORT_PROTO_UPB_H_

#include "upb/msg_internal.h"
#include "upb/decode.h"
#include "upb/decode_fast.h"
#include "upb/encode.h"

#include "upb/port_def.inc"

#ifdef __cplusplus
extern "C" {
#endif

struct envoy_config_endpoint_v3_UpstreamLocalityStats;
struct envoy_config_endpoint_v3_UpstreamEndpointStats;
struct envoy_config_endpoint_v3_EndpointLoadMetricStats;
struct envoy_config_endpoint_v3_ClusterStats;
struct envoy_config_endpoint_v3_ClusterStats_DroppedRequests;
typedef struct envoy_config_endpoint_v3_UpstreamLocalityStats envoy_config_endpoint_v3_UpstreamLocalityStats;
typedef struct envoy_config_endpoint_v3_UpstreamEndpointStats envoy_config_endpoint_v3_UpstreamEndpointStats;
typedef struct envoy_config_endpoint_v3_EndpointLoadMetricStats envoy_config_endpoint_v3_EndpointLoadMetricStats;
typedef struct envoy_config_endpoint_v3_ClusterStats envoy_config_endpoint_v3_ClusterStats;
typedef struct envoy_config_endpoint_v3_ClusterStats_DroppedRequests envoy_config_endpoint_v3_ClusterStats_DroppedRequests;
extern const upb_MiniTable envoy_config_endpoint_v3_UpstreamLocalityStats_msginit;
extern const upb_MiniTable envoy_config_endpoint_v3_UpstreamEndpointStats_msginit;
extern const upb_MiniTable envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit;
extern const upb_MiniTable envoy_config_endpoint_v3_ClusterStats_msginit;
extern const upb_MiniTable envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit;
struct envoy_config_core_v3_Address;
struct envoy_config_core_v3_Locality;
struct google_protobuf_Duration;
struct google_protobuf_Struct;
extern const upb_MiniTable envoy_config_core_v3_Address_msginit;
extern const upb_MiniTable envoy_config_core_v3_Locality_msginit;
extern const upb_MiniTable google_protobuf_Duration_msginit;
extern const upb_MiniTable google_protobuf_Struct_msginit;



/* envoy.config.endpoint.v3.UpstreamLocalityStats */

UPB_INLINE envoy_config_endpoint_v3_UpstreamLocalityStats* envoy_config_endpoint_v3_UpstreamLocalityStats_new(upb_Arena* arena) {
  return (envoy_config_endpoint_v3_UpstreamLocalityStats*)_upb_Message_New(&envoy_config_endpoint_v3_UpstreamLocalityStats_msginit, arena);
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamLocalityStats* envoy_config_endpoint_v3_UpstreamLocalityStats_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_endpoint_v3_UpstreamLocalityStats* ret = envoy_config_endpoint_v3_UpstreamLocalityStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_UpstreamLocalityStats_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamLocalityStats* envoy_config_endpoint_v3_UpstreamLocalityStats_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_endpoint_v3_UpstreamLocalityStats* ret = envoy_config_endpoint_v3_UpstreamLocalityStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_UpstreamLocalityStats_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_endpoint_v3_UpstreamLocalityStats_serialize(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_UpstreamLocalityStats_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_endpoint_v3_UpstreamLocalityStats_serialize_ex(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_UpstreamLocalityStats_msginit, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE bool envoy_config_endpoint_v3_UpstreamLocalityStats_has_locality(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return _upb_hasbit(msg, 1);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_locality(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 8), const upb_Message*) = NULL;
}
UPB_INLINE const struct envoy_config_core_v3_Locality* envoy_config_endpoint_v3_UpstreamLocalityStats_locality(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(8, 8), const struct envoy_config_core_v3_Locality*);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_total_successful_requests(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(24, 32), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamLocalityStats_total_successful_requests(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(24, 32), uint64_t);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_total_requests_in_progress(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(32, 40), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamLocalityStats_total_requests_in_progress(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(32, 40), uint64_t);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_total_error_requests(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(40, 48), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamLocalityStats_total_error_requests(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(40, 48), uint64_t);
}
UPB_INLINE bool envoy_config_endpoint_v3_UpstreamLocalityStats_has_load_metric_stats(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return _upb_has_submsg_nohasbit(msg, UPB_SIZE(12, 16));
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_load_metric_stats(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  _upb_array_detach(msg, UPB_SIZE(12, 16));
}
UPB_INLINE const envoy_config_endpoint_v3_EndpointLoadMetricStats* const* envoy_config_endpoint_v3_UpstreamLocalityStats_load_metric_stats(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg, size_t* len) {
  return (const envoy_config_endpoint_v3_EndpointLoadMetricStats* const*)_upb_array_accessor(msg, UPB_SIZE(12, 16), len);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_priority(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(4, 4), uint32_t) = 0;
}
UPB_INLINE uint32_t envoy_config_endpoint_v3_UpstreamLocalityStats_priority(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(4, 4), uint32_t);
}
UPB_INLINE bool envoy_config_endpoint_v3_UpstreamLocalityStats_has_upstream_endpoint_stats(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return _upb_has_submsg_nohasbit(msg, UPB_SIZE(16, 24));
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_upstream_endpoint_stats(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  _upb_array_detach(msg, UPB_SIZE(16, 24));
}
UPB_INLINE const envoy_config_endpoint_v3_UpstreamEndpointStats* const* envoy_config_endpoint_v3_UpstreamLocalityStats_upstream_endpoint_stats(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg, size_t* len) {
  return (const envoy_config_endpoint_v3_UpstreamEndpointStats* const*)_upb_array_accessor(msg, UPB_SIZE(16, 24), len);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_clear_total_issued_requests(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(48, 56), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamLocalityStats_total_issued_requests(const envoy_config_endpoint_v3_UpstreamLocalityStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(48, 56), uint64_t);
}

UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_set_locality(envoy_config_endpoint_v3_UpstreamLocalityStats *msg, struct envoy_config_core_v3_Locality* value) {
  _upb_sethas(msg, 1);
  *UPB_PTR_AT(msg, UPB_SIZE(8, 8), struct envoy_config_core_v3_Locality*) = value;
}
UPB_INLINE struct envoy_config_core_v3_Locality* envoy_config_endpoint_v3_UpstreamLocalityStats_mutable_locality(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, upb_Arena* arena) {
  struct envoy_config_core_v3_Locality* sub = (struct envoy_config_core_v3_Locality*)envoy_config_endpoint_v3_UpstreamLocalityStats_locality(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_Locality*)_upb_Message_New(&envoy_config_core_v3_Locality_msginit, arena);
    if (!sub) return NULL;
    envoy_config_endpoint_v3_UpstreamLocalityStats_set_locality(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_set_total_successful_requests(envoy_config_endpoint_v3_UpstreamLocalityStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(24, 32), uint64_t) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_set_total_requests_in_progress(envoy_config_endpoint_v3_UpstreamLocalityStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(32, 40), uint64_t) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_set_total_error_requests(envoy_config_endpoint_v3_UpstreamLocalityStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(40, 48), uint64_t) = value;
}
UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats** envoy_config_endpoint_v3_UpstreamLocalityStats_mutable_load_metric_stats(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, size_t* len) {
  return (envoy_config_endpoint_v3_EndpointLoadMetricStats**)_upb_array_mutable_accessor(msg, UPB_SIZE(12, 16), len);
}
UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats** envoy_config_endpoint_v3_UpstreamLocalityStats_resize_load_metric_stats(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, size_t len, upb_Arena* arena) {
  return (envoy_config_endpoint_v3_EndpointLoadMetricStats**)_upb_Array_Resize_accessor2(msg, UPB_SIZE(12, 16), len, UPB_SIZE(2, 3), arena);
}
UPB_INLINE struct envoy_config_endpoint_v3_EndpointLoadMetricStats* envoy_config_endpoint_v3_UpstreamLocalityStats_add_load_metric_stats(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, upb_Arena* arena) {
  struct envoy_config_endpoint_v3_EndpointLoadMetricStats* sub = (struct envoy_config_endpoint_v3_EndpointLoadMetricStats*)_upb_Message_New(&envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, arena);
  bool ok = _upb_Array_Append_accessor2(msg, UPB_SIZE(12, 16), UPB_SIZE(2, 3), &sub, arena);
  if (!ok) return NULL;
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_set_priority(envoy_config_endpoint_v3_UpstreamLocalityStats *msg, uint32_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(4, 4), uint32_t) = value;
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamEndpointStats** envoy_config_endpoint_v3_UpstreamLocalityStats_mutable_upstream_endpoint_stats(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, size_t* len) {
  return (envoy_config_endpoint_v3_UpstreamEndpointStats**)_upb_array_mutable_accessor(msg, UPB_SIZE(16, 24), len);
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamEndpointStats** envoy_config_endpoint_v3_UpstreamLocalityStats_resize_upstream_endpoint_stats(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, size_t len, upb_Arena* arena) {
  return (envoy_config_endpoint_v3_UpstreamEndpointStats**)_upb_Array_Resize_accessor2(msg, UPB_SIZE(16, 24), len, UPB_SIZE(2, 3), arena);
}
UPB_INLINE struct envoy_config_endpoint_v3_UpstreamEndpointStats* envoy_config_endpoint_v3_UpstreamLocalityStats_add_upstream_endpoint_stats(envoy_config_endpoint_v3_UpstreamLocalityStats* msg, upb_Arena* arena) {
  struct envoy_config_endpoint_v3_UpstreamEndpointStats* sub = (struct envoy_config_endpoint_v3_UpstreamEndpointStats*)_upb_Message_New(&envoy_config_endpoint_v3_UpstreamEndpointStats_msginit, arena);
  bool ok = _upb_Array_Append_accessor2(msg, UPB_SIZE(16, 24), UPB_SIZE(2, 3), &sub, arena);
  if (!ok) return NULL;
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamLocalityStats_set_total_issued_requests(envoy_config_endpoint_v3_UpstreamLocalityStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(48, 56), uint64_t) = value;
}

/* envoy.config.endpoint.v3.UpstreamEndpointStats */

UPB_INLINE envoy_config_endpoint_v3_UpstreamEndpointStats* envoy_config_endpoint_v3_UpstreamEndpointStats_new(upb_Arena* arena) {
  return (envoy_config_endpoint_v3_UpstreamEndpointStats*)_upb_Message_New(&envoy_config_endpoint_v3_UpstreamEndpointStats_msginit, arena);
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamEndpointStats* envoy_config_endpoint_v3_UpstreamEndpointStats_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_endpoint_v3_UpstreamEndpointStats* ret = envoy_config_endpoint_v3_UpstreamEndpointStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_UpstreamEndpointStats_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamEndpointStats* envoy_config_endpoint_v3_UpstreamEndpointStats_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_endpoint_v3_UpstreamEndpointStats* ret = envoy_config_endpoint_v3_UpstreamEndpointStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_UpstreamEndpointStats_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_endpoint_v3_UpstreamEndpointStats_serialize(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_UpstreamEndpointStats_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_endpoint_v3_UpstreamEndpointStats_serialize_ex(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_UpstreamEndpointStats_msginit, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE bool envoy_config_endpoint_v3_UpstreamEndpointStats_has_address(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return _upb_hasbit(msg, 1);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_address(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(4, 8), const upb_Message*) = NULL;
}
UPB_INLINE const struct envoy_config_core_v3_Address* envoy_config_endpoint_v3_UpstreamEndpointStats_address(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(4, 8), const struct envoy_config_core_v3_Address*);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_total_successful_requests(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(16, 32), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamEndpointStats_total_successful_requests(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(16, 32), uint64_t);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_total_requests_in_progress(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(24, 40), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamEndpointStats_total_requests_in_progress(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(24, 40), uint64_t);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_total_error_requests(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(32, 48), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamEndpointStats_total_error_requests(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(32, 48), uint64_t);
}
UPB_INLINE bool envoy_config_endpoint_v3_UpstreamEndpointStats_has_load_metric_stats(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return _upb_has_submsg_nohasbit(msg, UPB_SIZE(8, 16));
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_load_metric_stats(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  _upb_array_detach(msg, UPB_SIZE(8, 16));
}
UPB_INLINE const envoy_config_endpoint_v3_EndpointLoadMetricStats* const* envoy_config_endpoint_v3_UpstreamEndpointStats_load_metric_stats(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg, size_t* len) {
  return (const envoy_config_endpoint_v3_EndpointLoadMetricStats* const*)_upb_array_accessor(msg, UPB_SIZE(8, 16), len);
}
UPB_INLINE bool envoy_config_endpoint_v3_UpstreamEndpointStats_has_metadata(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return _upb_hasbit(msg, 2);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_metadata(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(12, 24), const upb_Message*) = NULL;
}
UPB_INLINE const struct google_protobuf_Struct* envoy_config_endpoint_v3_UpstreamEndpointStats_metadata(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(12, 24), const struct google_protobuf_Struct*);
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_clear_total_issued_requests(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(40, 56), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_UpstreamEndpointStats_total_issued_requests(const envoy_config_endpoint_v3_UpstreamEndpointStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(40, 56), uint64_t);
}

UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_set_address(envoy_config_endpoint_v3_UpstreamEndpointStats *msg, struct envoy_config_core_v3_Address* value) {
  _upb_sethas(msg, 1);
  *UPB_PTR_AT(msg, UPB_SIZE(4, 8), struct envoy_config_core_v3_Address*) = value;
}
UPB_INLINE struct envoy_config_core_v3_Address* envoy_config_endpoint_v3_UpstreamEndpointStats_mutable_address(envoy_config_endpoint_v3_UpstreamEndpointStats* msg, upb_Arena* arena) {
  struct envoy_config_core_v3_Address* sub = (struct envoy_config_core_v3_Address*)envoy_config_endpoint_v3_UpstreamEndpointStats_address(msg);
  if (sub == NULL) {
    sub = (struct envoy_config_core_v3_Address*)_upb_Message_New(&envoy_config_core_v3_Address_msginit, arena);
    if (!sub) return NULL;
    envoy_config_endpoint_v3_UpstreamEndpointStats_set_address(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_set_total_successful_requests(envoy_config_endpoint_v3_UpstreamEndpointStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(16, 32), uint64_t) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_set_total_requests_in_progress(envoy_config_endpoint_v3_UpstreamEndpointStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(24, 40), uint64_t) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_set_total_error_requests(envoy_config_endpoint_v3_UpstreamEndpointStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(32, 48), uint64_t) = value;
}
UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats** envoy_config_endpoint_v3_UpstreamEndpointStats_mutable_load_metric_stats(envoy_config_endpoint_v3_UpstreamEndpointStats* msg, size_t* len) {
  return (envoy_config_endpoint_v3_EndpointLoadMetricStats**)_upb_array_mutable_accessor(msg, UPB_SIZE(8, 16), len);
}
UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats** envoy_config_endpoint_v3_UpstreamEndpointStats_resize_load_metric_stats(envoy_config_endpoint_v3_UpstreamEndpointStats* msg, size_t len, upb_Arena* arena) {
  return (envoy_config_endpoint_v3_EndpointLoadMetricStats**)_upb_Array_Resize_accessor2(msg, UPB_SIZE(8, 16), len, UPB_SIZE(2, 3), arena);
}
UPB_INLINE struct envoy_config_endpoint_v3_EndpointLoadMetricStats* envoy_config_endpoint_v3_UpstreamEndpointStats_add_load_metric_stats(envoy_config_endpoint_v3_UpstreamEndpointStats* msg, upb_Arena* arena) {
  struct envoy_config_endpoint_v3_EndpointLoadMetricStats* sub = (struct envoy_config_endpoint_v3_EndpointLoadMetricStats*)_upb_Message_New(&envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, arena);
  bool ok = _upb_Array_Append_accessor2(msg, UPB_SIZE(8, 16), UPB_SIZE(2, 3), &sub, arena);
  if (!ok) return NULL;
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_set_metadata(envoy_config_endpoint_v3_UpstreamEndpointStats *msg, struct google_protobuf_Struct* value) {
  _upb_sethas(msg, 2);
  *UPB_PTR_AT(msg, UPB_SIZE(12, 24), struct google_protobuf_Struct*) = value;
}
UPB_INLINE struct google_protobuf_Struct* envoy_config_endpoint_v3_UpstreamEndpointStats_mutable_metadata(envoy_config_endpoint_v3_UpstreamEndpointStats* msg, upb_Arena* arena) {
  struct google_protobuf_Struct* sub = (struct google_protobuf_Struct*)envoy_config_endpoint_v3_UpstreamEndpointStats_metadata(msg);
  if (sub == NULL) {
    sub = (struct google_protobuf_Struct*)_upb_Message_New(&google_protobuf_Struct_msginit, arena);
    if (!sub) return NULL;
    envoy_config_endpoint_v3_UpstreamEndpointStats_set_metadata(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_UpstreamEndpointStats_set_total_issued_requests(envoy_config_endpoint_v3_UpstreamEndpointStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(40, 56), uint64_t) = value;
}

/* envoy.config.endpoint.v3.EndpointLoadMetricStats */

UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats* envoy_config_endpoint_v3_EndpointLoadMetricStats_new(upb_Arena* arena) {
  return (envoy_config_endpoint_v3_EndpointLoadMetricStats*)_upb_Message_New(&envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, arena);
}
UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats* envoy_config_endpoint_v3_EndpointLoadMetricStats_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_endpoint_v3_EndpointLoadMetricStats* ret = envoy_config_endpoint_v3_EndpointLoadMetricStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_endpoint_v3_EndpointLoadMetricStats* envoy_config_endpoint_v3_EndpointLoadMetricStats_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_endpoint_v3_EndpointLoadMetricStats* ret = envoy_config_endpoint_v3_EndpointLoadMetricStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_endpoint_v3_EndpointLoadMetricStats_serialize(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_endpoint_v3_EndpointLoadMetricStats_serialize_ex(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_EndpointLoadMetricStats_msginit, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_config_endpoint_v3_EndpointLoadMetricStats_clear_metric_name(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), upb_StringView) = upb_StringView_FromDataAndSize(NULL, 0);
}
UPB_INLINE upb_StringView envoy_config_endpoint_v3_EndpointLoadMetricStats_metric_name(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(0, 0), upb_StringView);
}
UPB_INLINE void envoy_config_endpoint_v3_EndpointLoadMetricStats_clear_num_requests_finished_with_metric(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 16), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_EndpointLoadMetricStats_num_requests_finished_with_metric(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(8, 16), uint64_t);
}
UPB_INLINE void envoy_config_endpoint_v3_EndpointLoadMetricStats_clear_total_metric_value(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(16, 24), double) = 0;
}
UPB_INLINE double envoy_config_endpoint_v3_EndpointLoadMetricStats_total_metric_value(const envoy_config_endpoint_v3_EndpointLoadMetricStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(16, 24), double);
}

UPB_INLINE void envoy_config_endpoint_v3_EndpointLoadMetricStats_set_metric_name(envoy_config_endpoint_v3_EndpointLoadMetricStats *msg, upb_StringView value) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), upb_StringView) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_EndpointLoadMetricStats_set_num_requests_finished_with_metric(envoy_config_endpoint_v3_EndpointLoadMetricStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 16), uint64_t) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_EndpointLoadMetricStats_set_total_metric_value(envoy_config_endpoint_v3_EndpointLoadMetricStats *msg, double value) {
  *UPB_PTR_AT(msg, UPB_SIZE(16, 24), double) = value;
}

/* envoy.config.endpoint.v3.ClusterStats */

UPB_INLINE envoy_config_endpoint_v3_ClusterStats* envoy_config_endpoint_v3_ClusterStats_new(upb_Arena* arena) {
  return (envoy_config_endpoint_v3_ClusterStats*)_upb_Message_New(&envoy_config_endpoint_v3_ClusterStats_msginit, arena);
}
UPB_INLINE envoy_config_endpoint_v3_ClusterStats* envoy_config_endpoint_v3_ClusterStats_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_endpoint_v3_ClusterStats* ret = envoy_config_endpoint_v3_ClusterStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_ClusterStats_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_endpoint_v3_ClusterStats* envoy_config_endpoint_v3_ClusterStats_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_endpoint_v3_ClusterStats* ret = envoy_config_endpoint_v3_ClusterStats_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_ClusterStats_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_endpoint_v3_ClusterStats_serialize(const envoy_config_endpoint_v3_ClusterStats* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_ClusterStats_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_endpoint_v3_ClusterStats_serialize_ex(const envoy_config_endpoint_v3_ClusterStats* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_ClusterStats_msginit, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_clear_cluster_name(const envoy_config_endpoint_v3_ClusterStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(4, 8), upb_StringView) = upb_StringView_FromDataAndSize(NULL, 0);
}
UPB_INLINE upb_StringView envoy_config_endpoint_v3_ClusterStats_cluster_name(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(4, 8), upb_StringView);
}
UPB_INLINE bool envoy_config_endpoint_v3_ClusterStats_has_upstream_locality_stats(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return _upb_has_submsg_nohasbit(msg, UPB_SIZE(12, 24));
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_clear_upstream_locality_stats(const envoy_config_endpoint_v3_ClusterStats* msg) {
  _upb_array_detach(msg, UPB_SIZE(12, 24));
}
UPB_INLINE const envoy_config_endpoint_v3_UpstreamLocalityStats* const* envoy_config_endpoint_v3_ClusterStats_upstream_locality_stats(const envoy_config_endpoint_v3_ClusterStats* msg, size_t* len) {
  return (const envoy_config_endpoint_v3_UpstreamLocalityStats* const*)_upb_array_accessor(msg, UPB_SIZE(12, 24), len);
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_clear_total_dropped_requests(const envoy_config_endpoint_v3_ClusterStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(32, 64), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_ClusterStats_total_dropped_requests(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(32, 64), uint64_t);
}
UPB_INLINE bool envoy_config_endpoint_v3_ClusterStats_has_load_report_interval(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return _upb_hasbit(msg, 1);
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_clear_load_report_interval(const envoy_config_endpoint_v3_ClusterStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(16, 32), const upb_Message*) = NULL;
}
UPB_INLINE const struct google_protobuf_Duration* envoy_config_endpoint_v3_ClusterStats_load_report_interval(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(16, 32), const struct google_protobuf_Duration*);
}
UPB_INLINE bool envoy_config_endpoint_v3_ClusterStats_has_dropped_requests(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return _upb_has_submsg_nohasbit(msg, UPB_SIZE(20, 40));
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_clear_dropped_requests(const envoy_config_endpoint_v3_ClusterStats* msg) {
  _upb_array_detach(msg, UPB_SIZE(20, 40));
}
UPB_INLINE const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* const* envoy_config_endpoint_v3_ClusterStats_dropped_requests(const envoy_config_endpoint_v3_ClusterStats* msg, size_t* len) {
  return (const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* const*)_upb_array_accessor(msg, UPB_SIZE(20, 40), len);
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_clear_cluster_service_name(const envoy_config_endpoint_v3_ClusterStats* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(24, 48), upb_StringView) = upb_StringView_FromDataAndSize(NULL, 0);
}
UPB_INLINE upb_StringView envoy_config_endpoint_v3_ClusterStats_cluster_service_name(const envoy_config_endpoint_v3_ClusterStats* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(24, 48), upb_StringView);
}

UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_set_cluster_name(envoy_config_endpoint_v3_ClusterStats *msg, upb_StringView value) {
  *UPB_PTR_AT(msg, UPB_SIZE(4, 8), upb_StringView) = value;
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamLocalityStats** envoy_config_endpoint_v3_ClusterStats_mutable_upstream_locality_stats(envoy_config_endpoint_v3_ClusterStats* msg, size_t* len) {
  return (envoy_config_endpoint_v3_UpstreamLocalityStats**)_upb_array_mutable_accessor(msg, UPB_SIZE(12, 24), len);
}
UPB_INLINE envoy_config_endpoint_v3_UpstreamLocalityStats** envoy_config_endpoint_v3_ClusterStats_resize_upstream_locality_stats(envoy_config_endpoint_v3_ClusterStats* msg, size_t len, upb_Arena* arena) {
  return (envoy_config_endpoint_v3_UpstreamLocalityStats**)_upb_Array_Resize_accessor2(msg, UPB_SIZE(12, 24), len, UPB_SIZE(2, 3), arena);
}
UPB_INLINE struct envoy_config_endpoint_v3_UpstreamLocalityStats* envoy_config_endpoint_v3_ClusterStats_add_upstream_locality_stats(envoy_config_endpoint_v3_ClusterStats* msg, upb_Arena* arena) {
  struct envoy_config_endpoint_v3_UpstreamLocalityStats* sub = (struct envoy_config_endpoint_v3_UpstreamLocalityStats*)_upb_Message_New(&envoy_config_endpoint_v3_UpstreamLocalityStats_msginit, arena);
  bool ok = _upb_Array_Append_accessor2(msg, UPB_SIZE(12, 24), UPB_SIZE(2, 3), &sub, arena);
  if (!ok) return NULL;
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_set_total_dropped_requests(envoy_config_endpoint_v3_ClusterStats *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(32, 64), uint64_t) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_set_load_report_interval(envoy_config_endpoint_v3_ClusterStats *msg, struct google_protobuf_Duration* value) {
  _upb_sethas(msg, 1);
  *UPB_PTR_AT(msg, UPB_SIZE(16, 32), struct google_protobuf_Duration*) = value;
}
UPB_INLINE struct google_protobuf_Duration* envoy_config_endpoint_v3_ClusterStats_mutable_load_report_interval(envoy_config_endpoint_v3_ClusterStats* msg, upb_Arena* arena) {
  struct google_protobuf_Duration* sub = (struct google_protobuf_Duration*)envoy_config_endpoint_v3_ClusterStats_load_report_interval(msg);
  if (sub == NULL) {
    sub = (struct google_protobuf_Duration*)_upb_Message_New(&google_protobuf_Duration_msginit, arena);
    if (!sub) return NULL;
    envoy_config_endpoint_v3_ClusterStats_set_load_report_interval(msg, sub);
  }
  return sub;
}
UPB_INLINE envoy_config_endpoint_v3_ClusterStats_DroppedRequests** envoy_config_endpoint_v3_ClusterStats_mutable_dropped_requests(envoy_config_endpoint_v3_ClusterStats* msg, size_t* len) {
  return (envoy_config_endpoint_v3_ClusterStats_DroppedRequests**)_upb_array_mutable_accessor(msg, UPB_SIZE(20, 40), len);
}
UPB_INLINE envoy_config_endpoint_v3_ClusterStats_DroppedRequests** envoy_config_endpoint_v3_ClusterStats_resize_dropped_requests(envoy_config_endpoint_v3_ClusterStats* msg, size_t len, upb_Arena* arena) {
  return (envoy_config_endpoint_v3_ClusterStats_DroppedRequests**)_upb_Array_Resize_accessor2(msg, UPB_SIZE(20, 40), len, UPB_SIZE(2, 3), arena);
}
UPB_INLINE struct envoy_config_endpoint_v3_ClusterStats_DroppedRequests* envoy_config_endpoint_v3_ClusterStats_add_dropped_requests(envoy_config_endpoint_v3_ClusterStats* msg, upb_Arena* arena) {
  struct envoy_config_endpoint_v3_ClusterStats_DroppedRequests* sub = (struct envoy_config_endpoint_v3_ClusterStats_DroppedRequests*)_upb_Message_New(&envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit, arena);
  bool ok = _upb_Array_Append_accessor2(msg, UPB_SIZE(20, 40), UPB_SIZE(2, 3), &sub, arena);
  if (!ok) return NULL;
  return sub;
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_set_cluster_service_name(envoy_config_endpoint_v3_ClusterStats *msg, upb_StringView value) {
  *UPB_PTR_AT(msg, UPB_SIZE(24, 48), upb_StringView) = value;
}

/* envoy.config.endpoint.v3.ClusterStats.DroppedRequests */

UPB_INLINE envoy_config_endpoint_v3_ClusterStats_DroppedRequests* envoy_config_endpoint_v3_ClusterStats_DroppedRequests_new(upb_Arena* arena) {
  return (envoy_config_endpoint_v3_ClusterStats_DroppedRequests*)_upb_Message_New(&envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit, arena);
}
UPB_INLINE envoy_config_endpoint_v3_ClusterStats_DroppedRequests* envoy_config_endpoint_v3_ClusterStats_DroppedRequests_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_config_endpoint_v3_ClusterStats_DroppedRequests* ret = envoy_config_endpoint_v3_ClusterStats_DroppedRequests_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_config_endpoint_v3_ClusterStats_DroppedRequests* envoy_config_endpoint_v3_ClusterStats_DroppedRequests_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_config_endpoint_v3_ClusterStats_DroppedRequests* ret = envoy_config_endpoint_v3_ClusterStats_DroppedRequests_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_config_endpoint_v3_ClusterStats_DroppedRequests_serialize(const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_config_endpoint_v3_ClusterStats_DroppedRequests_serialize_ex(const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_config_endpoint_v3_ClusterStats_DroppedRequests_msginit, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_DroppedRequests_clear_category(const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), upb_StringView) = upb_StringView_FromDataAndSize(NULL, 0);
}
UPB_INLINE upb_StringView envoy_config_endpoint_v3_ClusterStats_DroppedRequests_category(const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(0, 0), upb_StringView);
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_DroppedRequests_clear_dropped_count(const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 16), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_config_endpoint_v3_ClusterStats_DroppedRequests_dropped_count(const envoy_config_endpoint_v3_ClusterStats_DroppedRequests* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(8, 16), uint64_t);
}

UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_DroppedRequests_set_category(envoy_config_endpoint_v3_ClusterStats_DroppedRequests *msg, upb_StringView value) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), upb_StringView) = value;
}
UPB_INLINE void envoy_config_endpoint_v3_ClusterStats_DroppedRequests_set_dropped_count(envoy_config_endpoint_v3_ClusterStats_DroppedRequests *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 16), uint64_t) = value;
}

extern const upb_MiniTable_File envoy_config_endpoint_v3_load_report_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port_undef.inc"

#endif  /* ENVOY_CONFIG_ENDPOINT_V3_LOAD_REPORT_PROTO_UPB_H_ */
