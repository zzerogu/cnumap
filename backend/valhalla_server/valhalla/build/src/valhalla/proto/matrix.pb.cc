// Generated by the protocol buffer compiler.  DO NOT EDIT!
// NO CHECKED-IN PROTOBUF GENCODE
// source: matrix.proto
// Protobuf C++ Version: 5.29.1

#include "matrix.pb.h"

#include <algorithm>
#include <type_traits>
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/generated_message_tctable_impl.h"
#include "google/protobuf/extension_set.h"
#include "google/protobuf/generated_message_util.h"
#include "google/protobuf/wire_format_lite.h"
#include "google/protobuf/io/zero_copy_stream_impl_lite.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"
PROTOBUF_PRAGMA_INIT_SEG
namespace _pb = ::google::protobuf;
namespace _pbi = ::google::protobuf::internal;
namespace _fl = ::google::protobuf::internal::field_layout;
namespace valhalla {

inline constexpr Matrix::Impl_::Impl_(
    ::_pbi::ConstantInitialized) noexcept
      : distances_{},
        _distances_cached_byte_size_{0},
        times_{},
        from_indices_{},
        _from_indices_cached_byte_size_{0},
        to_indices_{},
        _to_indices_cached_byte_size_{0},
        date_times_{},
        shapes_{},
        time_zone_offsets_{},
        time_zone_names_{},
        second_pass_{},
        algorithm_{static_cast< ::valhalla::Matrix_Algorithm >(0)},
        _cached_size_{0} {}

template <typename>
PROTOBUF_CONSTEXPR Matrix::Matrix(::_pbi::ConstantInitialized)
#if defined(PROTOBUF_CUSTOM_VTABLE)
    : ::google::protobuf::MessageLite(_class_data_.base()),
#else   // PROTOBUF_CUSTOM_VTABLE
    : ::google::protobuf::MessageLite(),
#endif  // PROTOBUF_CUSTOM_VTABLE
      _impl_(::_pbi::ConstantInitialized()) {
}
struct MatrixDefaultTypeInternal {
  PROTOBUF_CONSTEXPR MatrixDefaultTypeInternal() : _instance(::_pbi::ConstantInitialized{}) {}
  ~MatrixDefaultTypeInternal() {}
  union {
    Matrix _instance;
  };
};

PROTOBUF_ATTRIBUTE_NO_DESTROY PROTOBUF_CONSTINIT
    PROTOBUF_ATTRIBUTE_INIT_PRIORITY1 MatrixDefaultTypeInternal _Matrix_default_instance_;
}  // namespace valhalla
namespace valhalla {
PROTOBUF_CONSTINIT const uint32_t Matrix_Algorithm_internal_data_[] = {
    196608u, 0u, };
bool Matrix_Algorithm_IsValid(int value) {
  return 0 <= value && value <= 2;
}
static ::google::protobuf::internal::ExplicitlyConstructed<std::string>
    Matrix_Algorithm_strings[3] = {};

static const char Matrix_Algorithm_names[] = {
    "CostMatrix"
    "TimeDistanceBSSMatrix"
    "TimeDistanceMatrix"
};

static const ::google::protobuf::internal::EnumEntry Matrix_Algorithm_entries[] =
    {
        {{&Matrix_Algorithm_names[0], 10}, 1},
        {{&Matrix_Algorithm_names[10], 21}, 2},
        {{&Matrix_Algorithm_names[31], 18}, 0},
};

static const int Matrix_Algorithm_entries_by_number[] = {
    2,  // 0 -> TimeDistanceMatrix
    0,  // 1 -> CostMatrix
    1,  // 2 -> TimeDistanceBSSMatrix
};

const std::string& Matrix_Algorithm_Name(Matrix_Algorithm value) {
  static const bool kDummy =
      ::google::protobuf::internal::InitializeEnumStrings(
          Matrix_Algorithm_entries, Matrix_Algorithm_entries_by_number,
          3, Matrix_Algorithm_strings);
  (void)kDummy;

  int idx = ::google::protobuf::internal::LookUpEnumName(
      Matrix_Algorithm_entries, Matrix_Algorithm_entries_by_number, 3,
      value);
  return idx == -1 ? ::google::protobuf::internal::GetEmptyString()
                   : Matrix_Algorithm_strings[idx].get();
}

bool Matrix_Algorithm_Parse(absl::string_view name, Matrix_Algorithm* value) {
  int int_value;
  bool success = ::google::protobuf::internal::LookUpEnumValue(
      Matrix_Algorithm_entries, 3, name, &int_value);
  if (success) {
    *value = static_cast<Matrix_Algorithm>(int_value);
  }
  return success;
}
#if (__cplusplus < 201703) && \
  (!defined(_MSC_VER) || (_MSC_VER >= 1900 && _MSC_VER < 1912))

constexpr Matrix_Algorithm Matrix::TimeDistanceMatrix;
constexpr Matrix_Algorithm Matrix::CostMatrix;
constexpr Matrix_Algorithm Matrix::TimeDistanceBSSMatrix;
constexpr Matrix_Algorithm Matrix::Algorithm_MIN;
constexpr Matrix_Algorithm Matrix::Algorithm_MAX;
constexpr int Matrix::Algorithm_ARRAYSIZE;

#endif  // (__cplusplus < 201703) &&
        // (!defined(_MSC_VER) || (_MSC_VER >= 1900 && _MSC_VER < 1912))
// ===================================================================

class Matrix::_Internal {
 public:
};

Matrix::Matrix(::google::protobuf::Arena* arena)
#if defined(PROTOBUF_CUSTOM_VTABLE)
    : ::google::protobuf::MessageLite(arena, _class_data_.base()) {
#else   // PROTOBUF_CUSTOM_VTABLE
    : ::google::protobuf::MessageLite(arena) {
#endif  // PROTOBUF_CUSTOM_VTABLE
  SharedCtor(arena);
  // @@protoc_insertion_point(arena_constructor:valhalla.Matrix)
}
inline PROTOBUF_NDEBUG_INLINE Matrix::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility, ::google::protobuf::Arena* arena,
    const Impl_& from, const ::valhalla::Matrix& from_msg)
      : distances_{visibility, arena, from.distances_},
        _distances_cached_byte_size_{0},
        times_{visibility, arena, from.times_},
        from_indices_{visibility, arena, from.from_indices_},
        _from_indices_cached_byte_size_{0},
        to_indices_{visibility, arena, from.to_indices_},
        _to_indices_cached_byte_size_{0},
        date_times_{visibility, arena, from.date_times_},
        shapes_{visibility, arena, from.shapes_},
        time_zone_offsets_{visibility, arena, from.time_zone_offsets_},
        time_zone_names_{visibility, arena, from.time_zone_names_},
        second_pass_{visibility, arena, from.second_pass_},
        _cached_size_{0} {}

Matrix::Matrix(
    ::google::protobuf::Arena* arena,
    const Matrix& from)
#if defined(PROTOBUF_CUSTOM_VTABLE)
    : ::google::protobuf::MessageLite(arena, _class_data_.base()) {
#else   // PROTOBUF_CUSTOM_VTABLE
    : ::google::protobuf::MessageLite(arena) {
#endif  // PROTOBUF_CUSTOM_VTABLE
  Matrix* const _this = this;
  (void)_this;
  _internal_metadata_.MergeFrom<std::string>(
      from._internal_metadata_);
  new (&_impl_) Impl_(internal_visibility(), arena, from._impl_, from);
  _impl_.algorithm_ = from._impl_.algorithm_;

  // @@protoc_insertion_point(copy_constructor:valhalla.Matrix)
}
inline PROTOBUF_NDEBUG_INLINE Matrix::Impl_::Impl_(
    ::google::protobuf::internal::InternalVisibility visibility,
    ::google::protobuf::Arena* arena)
      : distances_{visibility, arena},
        _distances_cached_byte_size_{0},
        times_{visibility, arena},
        from_indices_{visibility, arena},
        _from_indices_cached_byte_size_{0},
        to_indices_{visibility, arena},
        _to_indices_cached_byte_size_{0},
        date_times_{visibility, arena},
        shapes_{visibility, arena},
        time_zone_offsets_{visibility, arena},
        time_zone_names_{visibility, arena},
        second_pass_{visibility, arena},
        _cached_size_{0} {}

inline void Matrix::SharedCtor(::_pb::Arena* arena) {
  new (&_impl_) Impl_(internal_visibility(), arena);
  _impl_.algorithm_ = {};
}
Matrix::~Matrix() {
  // @@protoc_insertion_point(destructor:valhalla.Matrix)
  SharedDtor(*this);
}
inline void Matrix::SharedDtor(MessageLite& self) {
  Matrix& this_ = static_cast<Matrix&>(self);
  this_._internal_metadata_.Delete<std::string>();
  ABSL_DCHECK(this_.GetArena() == nullptr);
  this_._impl_.~Impl_();
}

inline void* Matrix::PlacementNew_(const void*, void* mem,
                                        ::google::protobuf::Arena* arena) {
  return ::new (mem) Matrix(arena);
}
constexpr auto Matrix::InternalNewImpl_() {
  constexpr auto arena_bits = ::google::protobuf::internal::EncodePlacementArenaOffsets({
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.distances_) +
          decltype(Matrix::_impl_.distances_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.times_) +
          decltype(Matrix::_impl_.times_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.from_indices_) +
          decltype(Matrix::_impl_.from_indices_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.to_indices_) +
          decltype(Matrix::_impl_.to_indices_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.date_times_) +
          decltype(Matrix::_impl_.date_times_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.shapes_) +
          decltype(Matrix::_impl_.shapes_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.time_zone_offsets_) +
          decltype(Matrix::_impl_.time_zone_offsets_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.time_zone_names_) +
          decltype(Matrix::_impl_.time_zone_names_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
      PROTOBUF_FIELD_OFFSET(Matrix, _impl_.second_pass_) +
          decltype(Matrix::_impl_.second_pass_)::
              InternalGetArenaOffset(
                  ::google::protobuf::MessageLite::internal_visibility()),
  });
  if (arena_bits.has_value()) {
    return ::google::protobuf::internal::MessageCreator::ZeroInit(
        sizeof(Matrix), alignof(Matrix), *arena_bits);
  } else {
    return ::google::protobuf::internal::MessageCreator(&Matrix::PlacementNew_,
                                 sizeof(Matrix),
                                 alignof(Matrix));
  }
}
PROTOBUF_CONSTINIT
PROTOBUF_ATTRIBUTE_INIT_PRIORITY1
const ::google::protobuf::internal::ClassDataLite<16> Matrix::_class_data_ = {
    {
        &_Matrix_default_instance_._instance,
        &_table_.header,
        nullptr,  // OnDemandRegisterArenaDtor
        nullptr,  // IsInitialized
        &Matrix::MergeImpl,
        ::google::protobuf::MessageLite::GetNewImpl<Matrix>(),
#if defined(PROTOBUF_CUSTOM_VTABLE)
        &Matrix::SharedDtor,
        ::google::protobuf::MessageLite::GetClearImpl<Matrix>(), &Matrix::ByteSizeLong,
            &Matrix::_InternalSerialize,
#endif  // PROTOBUF_CUSTOM_VTABLE
        PROTOBUF_FIELD_OFFSET(Matrix, _impl_._cached_size_),
        true,
    },
    "valhalla.Matrix",
};
const ::google::protobuf::internal::ClassData* Matrix::GetClassData() const {
  return _class_data_.base();
}
PROTOBUF_CONSTINIT PROTOBUF_ATTRIBUTE_INIT_PRIORITY1
const ::_pbi::TcParseTable<4, 10, 0, 80, 2> Matrix::_table_ = {
  {
    0,  // no _has_bits_
    0, // no _extensions_
    11, 120,  // max_field_number, fast_idx_mask
    offsetof(decltype(_table_), field_lookup_table),
    4294965249,  // skipmap
    offsetof(decltype(_table_), field_entries),
    10,  // num_field_entries
    0,  // num_aux_entries
    offsetof(decltype(_table_), field_names),  // no aux_entries
    _class_data_.base(),
    nullptr,  // post_loop_handler
    ::_pbi::TcParser::GenericFallbackLite,  // fallback
    #ifdef PROTOBUF_PREFETCH_PARSE_TABLE
    ::_pbi::TcParser::GetTable<::valhalla::Matrix>(),  // to_prefetch
    #endif  // PROTOBUF_PREFETCH_PARSE_TABLE
  }, {{
    {::_pbi::TcParser::MiniParse, {}},
    {::_pbi::TcParser::MiniParse, {}},
    // repeated uint32 distances = 2;
    {::_pbi::TcParser::FastV32P1,
     {18, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.distances_)}},
    // repeated float times = 3;
    {::_pbi::TcParser::FastF32P1,
     {26, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.times_)}},
    // repeated uint32 from_indices = 4;
    {::_pbi::TcParser::FastV32P1,
     {34, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.from_indices_)}},
    // repeated uint32 to_indices = 5;
    {::_pbi::TcParser::FastV32P1,
     {42, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.to_indices_)}},
    // repeated string date_times = 6;
    {::_pbi::TcParser::FastUR1,
     {50, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.date_times_)}},
    // .valhalla.Matrix.Algorithm algorithm = 7;
    {::_pbi::TcParser::FastV32S1,
     {56, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.algorithm_)}},
    // repeated string shapes = 8;
    {::_pbi::TcParser::FastUR1,
     {66, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.shapes_)}},
    // repeated string time_zone_offsets = 9;
    {::_pbi::TcParser::FastUR1,
     {74, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.time_zone_offsets_)}},
    // repeated string time_zone_names = 10;
    {::_pbi::TcParser::FastUR1,
     {82, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.time_zone_names_)}},
    // repeated bool second_pass = 11;
    {::_pbi::TcParser::FastV8P1,
     {90, 63, 0, PROTOBUF_FIELD_OFFSET(Matrix, _impl_.second_pass_)}},
    {::_pbi::TcParser::MiniParse, {}},
    {::_pbi::TcParser::MiniParse, {}},
    {::_pbi::TcParser::MiniParse, {}},
    {::_pbi::TcParser::MiniParse, {}},
  }}, {{
    65535, 65535
  }}, {{
    // repeated uint32 distances = 2;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.distances_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kPackedUInt32)},
    // repeated float times = 3;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.times_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kPackedFloat)},
    // repeated uint32 from_indices = 4;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.from_indices_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kPackedUInt32)},
    // repeated uint32 to_indices = 5;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.to_indices_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kPackedUInt32)},
    // repeated string date_times = 6;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.date_times_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kUtf8String | ::_fl::kRepSString)},
    // .valhalla.Matrix.Algorithm algorithm = 7;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.algorithm_), 0, 0,
    (0 | ::_fl::kFcSingular | ::_fl::kOpenEnum)},
    // repeated string shapes = 8;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.shapes_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kUtf8String | ::_fl::kRepSString)},
    // repeated string time_zone_offsets = 9;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.time_zone_offsets_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kUtf8String | ::_fl::kRepSString)},
    // repeated string time_zone_names = 10;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.time_zone_names_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kUtf8String | ::_fl::kRepSString)},
    // repeated bool second_pass = 11;
    {PROTOBUF_FIELD_OFFSET(Matrix, _impl_.second_pass_), 0, 0,
    (0 | ::_fl::kFcRepeated | ::_fl::kPackedBool)},
  }},
  // no aux_entries
  {{
    "\17\0\0\0\0\12\0\6\21\17\0\0\0\0\0\0"
    "valhalla.Matrix"
    "date_times"
    "shapes"
    "time_zone_offsets"
    "time_zone_names"
  }},
};

PROTOBUF_NOINLINE void Matrix::Clear() {
// @@protoc_insertion_point(message_clear_start:valhalla.Matrix)
  ::google::protobuf::internal::TSanWrite(&_impl_);
  ::uint32_t cached_has_bits = 0;
  // Prevent compiler warnings about cached_has_bits being unused
  (void) cached_has_bits;

  _impl_.distances_.Clear();
  _impl_.times_.Clear();
  _impl_.from_indices_.Clear();
  _impl_.to_indices_.Clear();
  _impl_.date_times_.Clear();
  _impl_.shapes_.Clear();
  _impl_.time_zone_offsets_.Clear();
  _impl_.time_zone_names_.Clear();
  _impl_.second_pass_.Clear();
  _impl_.algorithm_ = 0;
  _internal_metadata_.Clear<std::string>();
}

#if defined(PROTOBUF_CUSTOM_VTABLE)
        ::uint8_t* Matrix::_InternalSerialize(
            const MessageLite& base, ::uint8_t* target,
            ::google::protobuf::io::EpsCopyOutputStream* stream) {
          const Matrix& this_ = static_cast<const Matrix&>(base);
#else   // PROTOBUF_CUSTOM_VTABLE
        ::uint8_t* Matrix::_InternalSerialize(
            ::uint8_t* target,
            ::google::protobuf::io::EpsCopyOutputStream* stream) const {
          const Matrix& this_ = *this;
#endif  // PROTOBUF_CUSTOM_VTABLE
          // @@protoc_insertion_point(serialize_to_array_start:valhalla.Matrix)
          ::uint32_t cached_has_bits = 0;
          (void)cached_has_bits;

          // repeated uint32 distances = 2;
          {
            int byte_size = this_._impl_._distances_cached_byte_size_.Get();
            if (byte_size > 0) {
              target = stream->WriteUInt32Packed(
                  2, this_._internal_distances(), byte_size, target);
            }
          }

          // repeated float times = 3;
          if (this_._internal_times_size() > 0) {
            target = stream->WriteFixedPacked(3, this_._internal_times(), target);
          }

          // repeated uint32 from_indices = 4;
          {
            int byte_size = this_._impl_._from_indices_cached_byte_size_.Get();
            if (byte_size > 0) {
              target = stream->WriteUInt32Packed(
                  4, this_._internal_from_indices(), byte_size, target);
            }
          }

          // repeated uint32 to_indices = 5;
          {
            int byte_size = this_._impl_._to_indices_cached_byte_size_.Get();
            if (byte_size > 0) {
              target = stream->WriteUInt32Packed(
                  5, this_._internal_to_indices(), byte_size, target);
            }
          }

          // repeated string date_times = 6;
          for (int i = 0, n = this_._internal_date_times_size(); i < n; ++i) {
            const auto& s = this_._internal_date_times().Get(i);
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                s.data(), static_cast<int>(s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "valhalla.Matrix.date_times");
            target = stream->WriteString(6, s, target);
          }

          // .valhalla.Matrix.Algorithm algorithm = 7;
          if (this_._internal_algorithm() != 0) {
            target = stream->EnsureSpace(target);
            target = ::_pbi::WireFormatLite::WriteEnumToArray(
                7, this_._internal_algorithm(), target);
          }

          // repeated string shapes = 8;
          for (int i = 0, n = this_._internal_shapes_size(); i < n; ++i) {
            const auto& s = this_._internal_shapes().Get(i);
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                s.data(), static_cast<int>(s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "valhalla.Matrix.shapes");
            target = stream->WriteString(8, s, target);
          }

          // repeated string time_zone_offsets = 9;
          for (int i = 0, n = this_._internal_time_zone_offsets_size(); i < n; ++i) {
            const auto& s = this_._internal_time_zone_offsets().Get(i);
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                s.data(), static_cast<int>(s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "valhalla.Matrix.time_zone_offsets");
            target = stream->WriteString(9, s, target);
          }

          // repeated string time_zone_names = 10;
          for (int i = 0, n = this_._internal_time_zone_names_size(); i < n; ++i) {
            const auto& s = this_._internal_time_zone_names().Get(i);
            ::google::protobuf::internal::WireFormatLite::VerifyUtf8String(
                s.data(), static_cast<int>(s.length()), ::google::protobuf::internal::WireFormatLite::SERIALIZE, "valhalla.Matrix.time_zone_names");
            target = stream->WriteString(10, s, target);
          }

          // repeated bool second_pass = 11;
          if (this_._internal_second_pass_size() > 0) {
            target = stream->WriteFixedPacked(11, this_._internal_second_pass(), target);
          }

          if (PROTOBUF_PREDICT_FALSE(this_._internal_metadata_.have_unknown_fields())) {
            target = stream->WriteRaw(
                this_._internal_metadata_.unknown_fields<std::string>(::google::protobuf::internal::GetEmptyString).data(),
                static_cast<int>(this_._internal_metadata_.unknown_fields<std::string>(::google::protobuf::internal::GetEmptyString).size()), target);
          }
          // @@protoc_insertion_point(serialize_to_array_end:valhalla.Matrix)
          return target;
        }

#if defined(PROTOBUF_CUSTOM_VTABLE)
        ::size_t Matrix::ByteSizeLong(const MessageLite& base) {
          const Matrix& this_ = static_cast<const Matrix&>(base);
#else   // PROTOBUF_CUSTOM_VTABLE
        ::size_t Matrix::ByteSizeLong() const {
          const Matrix& this_ = *this;
#endif  // PROTOBUF_CUSTOM_VTABLE
          // @@protoc_insertion_point(message_byte_size_start:valhalla.Matrix)
          ::size_t total_size = 0;

          ::uint32_t cached_has_bits = 0;
          // Prevent compiler warnings about cached_has_bits being unused
          (void)cached_has_bits;

          ::_pbi::Prefetch5LinesFrom7Lines(&this_);
           {
            // repeated uint32 distances = 2;
            {
              total_size +=
                  ::_pbi::WireFormatLite::UInt32SizeWithPackedTagSize(
                      this_._internal_distances(), 1,
                      this_._impl_._distances_cached_byte_size_);
            }
            // repeated float times = 3;
            {
              std::size_t data_size = std::size_t{4} *
                  ::_pbi::FromIntSize(this_._internal_times_size());
              std::size_t tag_size = data_size == 0
                  ? 0
                  : 1 + ::_pbi::WireFormatLite::Int32Size(
                                      static_cast<int32_t>(data_size));
              total_size += tag_size + data_size;
            }
            // repeated uint32 from_indices = 4;
            {
              total_size +=
                  ::_pbi::WireFormatLite::UInt32SizeWithPackedTagSize(
                      this_._internal_from_indices(), 1,
                      this_._impl_._from_indices_cached_byte_size_);
            }
            // repeated uint32 to_indices = 5;
            {
              total_size +=
                  ::_pbi::WireFormatLite::UInt32SizeWithPackedTagSize(
                      this_._internal_to_indices(), 1,
                      this_._impl_._to_indices_cached_byte_size_);
            }
            // repeated string date_times = 6;
            {
              total_size +=
                  1 * ::google::protobuf::internal::FromIntSize(this_._internal_date_times().size());
              for (int i = 0, n = this_._internal_date_times().size(); i < n; ++i) {
                total_size += ::google::protobuf::internal::WireFormatLite::StringSize(
                    this_._internal_date_times().Get(i));
              }
            }
            // repeated string shapes = 8;
            {
              total_size +=
                  1 * ::google::protobuf::internal::FromIntSize(this_._internal_shapes().size());
              for (int i = 0, n = this_._internal_shapes().size(); i < n; ++i) {
                total_size += ::google::protobuf::internal::WireFormatLite::StringSize(
                    this_._internal_shapes().Get(i));
              }
            }
            // repeated string time_zone_offsets = 9;
            {
              total_size +=
                  1 * ::google::protobuf::internal::FromIntSize(this_._internal_time_zone_offsets().size());
              for (int i = 0, n = this_._internal_time_zone_offsets().size(); i < n; ++i) {
                total_size += ::google::protobuf::internal::WireFormatLite::StringSize(
                    this_._internal_time_zone_offsets().Get(i));
              }
            }
            // repeated string time_zone_names = 10;
            {
              total_size +=
                  1 * ::google::protobuf::internal::FromIntSize(this_._internal_time_zone_names().size());
              for (int i = 0, n = this_._internal_time_zone_names().size(); i < n; ++i) {
                total_size += ::google::protobuf::internal::WireFormatLite::StringSize(
                    this_._internal_time_zone_names().Get(i));
              }
            }
            // repeated bool second_pass = 11;
            {
              std::size_t data_size = std::size_t{1} *
                  ::_pbi::FromIntSize(this_._internal_second_pass_size());
              std::size_t tag_size = data_size == 0
                  ? 0
                  : 1 + ::_pbi::WireFormatLite::Int32Size(
                                      static_cast<int32_t>(data_size));
              total_size += tag_size + data_size;
            }
          }
           {
            // .valhalla.Matrix.Algorithm algorithm = 7;
            if (this_._internal_algorithm() != 0) {
              total_size += 1 +
                            ::_pbi::WireFormatLite::EnumSize(this_._internal_algorithm());
            }
          }
          if (PROTOBUF_PREDICT_FALSE(this_._internal_metadata_.have_unknown_fields())) {
            total_size += this_._internal_metadata_.unknown_fields<std::string>(::google::protobuf::internal::GetEmptyString).size();
          }
          this_._impl_._cached_size_.Set(::_pbi::ToCachedSize(total_size));
          return total_size;
        }

void Matrix::MergeImpl(::google::protobuf::MessageLite& to_msg, const ::google::protobuf::MessageLite& from_msg) {
  auto* const _this = static_cast<Matrix*>(&to_msg);
  auto& from = static_cast<const Matrix&>(from_msg);
  // @@protoc_insertion_point(class_specific_merge_from_start:valhalla.Matrix)
  ABSL_DCHECK_NE(&from, _this);
  ::uint32_t cached_has_bits = 0;
  (void) cached_has_bits;

  _this->_internal_mutable_distances()->MergeFrom(from._internal_distances());
  _this->_internal_mutable_times()->MergeFrom(from._internal_times());
  _this->_internal_mutable_from_indices()->MergeFrom(from._internal_from_indices());
  _this->_internal_mutable_to_indices()->MergeFrom(from._internal_to_indices());
  _this->_internal_mutable_date_times()->MergeFrom(from._internal_date_times());
  _this->_internal_mutable_shapes()->MergeFrom(from._internal_shapes());
  _this->_internal_mutable_time_zone_offsets()->MergeFrom(from._internal_time_zone_offsets());
  _this->_internal_mutable_time_zone_names()->MergeFrom(from._internal_time_zone_names());
  _this->_internal_mutable_second_pass()->MergeFrom(from._internal_second_pass());
  if (from._internal_algorithm() != 0) {
    _this->_impl_.algorithm_ = from._impl_.algorithm_;
  }
  _this->_internal_metadata_.MergeFrom<std::string>(from._internal_metadata_);
}

void Matrix::CopyFrom(const Matrix& from) {
// @@protoc_insertion_point(class_specific_copy_from_start:valhalla.Matrix)
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}


void Matrix::InternalSwap(Matrix* PROTOBUF_RESTRICT other) {
  using std::swap;
  _internal_metadata_.InternalSwap(&other->_internal_metadata_);
  _impl_.distances_.InternalSwap(&other->_impl_.distances_);
  _impl_.times_.InternalSwap(&other->_impl_.times_);
  _impl_.from_indices_.InternalSwap(&other->_impl_.from_indices_);
  _impl_.to_indices_.InternalSwap(&other->_impl_.to_indices_);
  _impl_.date_times_.InternalSwap(&other->_impl_.date_times_);
  _impl_.shapes_.InternalSwap(&other->_impl_.shapes_);
  _impl_.time_zone_offsets_.InternalSwap(&other->_impl_.time_zone_offsets_);
  _impl_.time_zone_names_.InternalSwap(&other->_impl_.time_zone_names_);
  _impl_.second_pass_.InternalSwap(&other->_impl_.second_pass_);
  swap(_impl_.algorithm_, other->_impl_.algorithm_);
}

// @@protoc_insertion_point(namespace_scope)
}  // namespace valhalla
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google
// @@protoc_insertion_point(global_scope)
#include "google/protobuf/port_undef.inc"