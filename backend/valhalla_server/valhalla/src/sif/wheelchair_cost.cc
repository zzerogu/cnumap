#include "sif/wheelchair_cost.h"
#include "baldr/directededge.h"
#include "baldr/graphconstants.h"
#include "baldr/graphtile.h"
#include "baldr/time_info.h"
#include "midgard/constants.h"

namespace valhalla {
namespace sif {

WheelchairCost::WheelchairCost(const Costing& costing_options)
    : DynamicCost(costing_options, TravelMode::kPedestrian, baldr::kPedestrianAccess, false) {
  speed_ = 1.5f; // 기본 속도
  slope_penalty_ = 1.0f; // 기본 경사 페널티
  surface_penalty_ = 1.0f; // 기본 표면 페널티
}

// ---------------------------
// StandardWheelchairCost
// ---------------------------
StandardWheelchairCost::StandardWheelchairCost(const Costing& costing_options)
    : WheelchairCost(costing_options) {
  speed_ = 1.5f; // km/h
  slope_penalty_ = 1.0f;
  surface_penalty_ = 1.2f;
}

Cost StandardWheelchairCost::EdgeCost(const baldr::DirectedEdge* edge,
                                      const graph_tile_ptr& tile,
                                      const baldr::TimeInfo& time_info,
                                      uint8_t& flow_sources) const {
  float slope = edge->weighted_grade();
  float surface_factor = (edge->surface() == baldr::Surface::kPaved) ? 1.0f : surface_penalty_;
  float slope_factor = 1.0f + (slope_penalty_ * std::abs(slope));

  float cost = (edge->length() / speed_) * surface_factor * slope_factor;
  return {cost, edge->length() / speed_};
}

bool StandardWheelchairCost::Allowed(const baldr::DirectedEdge* edge,
                                     const bool is_dest,
                                     const EdgeLabel& pred,
                                     const graph_tile_ptr& tile,
                                     const baldr::GraphId& edgeid,
                                     const uint64_t current_time,
                                     const uint32_t tz_index,
                                     uint8_t& restriction_idx) const {
  if (edge->surface() > baldr::Surface::kCompacted)
    return false;
  if (std::abs(static_cast<float>(edge->weighted_grade())) > 0.15f)  // 15% 이상의 경사는 제한
    return false;

  return DynamicCost::IsAccessible(edge);
}

bool StandardWheelchairCost::AllowedReverse(const baldr::DirectedEdge* edge,
                                            const EdgeLabel& pred,
                                            const baldr::DirectedEdge* opp_edge,
                                            const graph_tile_ptr& tile,
                                            const baldr::GraphId& opp_edgeid,
                                            const uint64_t current_time,
                                            const uint32_t tz_index,
                                            uint8_t& restriction_idx) const {
  // Reverse 방향에서도 동일한 제한 적용
  return Allowed(edge, false, pred, tile, opp_edgeid, current_time, tz_index, restriction_idx);
}

float StandardWheelchairCost::AStarCostFactor() const {
  return 1.0f / speed_;
}

// ★ 추가: 시간표 기반 EdgeCost 구현
Cost StandardWheelchairCost::EdgeCost(const baldr::DirectedEdge* edge,
                                      const baldr::TransitDeparture* departure,
                                      const uint32_t curr_time) const {
  // departure->running_time() 등을 고려해서 구현 가능
  // 여기서는 단순 length / speed 로 계산
  float length = edge->length();
  float cost_val = length / speed_;
  float time_val = length / speed_;

  return {cost_val, time_val};
}

// ---------------------------
// BasicPowerWheelchairCost
// ---------------------------
BasicPowerWheelchairCost::BasicPowerWheelchairCost(const Costing& costing_options)
    : WheelchairCost(costing_options) {
  speed_ = 5.0f; // km/h
  slope_penalty_ = 0.8f;
  surface_penalty_ = 1.1f;
}

Cost BasicPowerWheelchairCost::EdgeCost(const baldr::DirectedEdge* edge,
                                        const graph_tile_ptr& tile,
                                        const baldr::TimeInfo& time_info,
                                        uint8_t& flow_sources) const {
  float slope = edge->weighted_grade();
  float surface_factor = (edge->surface() == baldr::Surface::kPaved) ? 1.0f : surface_penalty_;
  float slope_factor = 1.0f + (slope_penalty_ * std::abs(slope));

  float cost = (edge->length() / speed_) * surface_factor * slope_factor;
  return {cost, edge->length() / speed_};
}

bool BasicPowerWheelchairCost::Allowed(const baldr::DirectedEdge* edge,
                                       const bool is_dest,
                                       const EdgeLabel& pred,
                                       const graph_tile_ptr& tile,
                                       const baldr::GraphId& edgeid,
                                       const uint64_t current_time,
                                       const uint32_t tz_index,
                                       uint8_t& restriction_idx) const {
  if (edge->surface() > baldr::Surface::kGravel)
    return false;
  if (std::abs(static_cast<float>(edge->weighted_grade())) > 0.2f)
    return false;

  return DynamicCost::IsAccessible(edge);
}

bool BasicPowerWheelchairCost::AllowedReverse(const baldr::DirectedEdge* edge,
                                              const EdgeLabel& pred,
                                              const baldr::DirectedEdge* opp_edge,
                                              const graph_tile_ptr& tile,
                                              const baldr::GraphId& opp_edgeid,
                                              const uint64_t current_time,
                                              const uint32_t tz_index,
                                              uint8_t& restriction_idx) const {
  return Allowed(edge, false, pred, tile, opp_edgeid, current_time, tz_index, restriction_idx);
}

float BasicPowerWheelchairCost::AStarCostFactor() const {
  return 1.0f / speed_;
}

// ★ 추가: 시간표 기반 EdgeCost 구현
Cost BasicPowerWheelchairCost::EdgeCost(const baldr::DirectedEdge* edge,
                                        const baldr::TransitDeparture* departure,
                                        const uint32_t curr_time) const {
  float length = edge->length();
  float cost_val = length / speed_;
  float time_val = length / speed_;

  return {cost_val, time_val};
}

// ---------------------------
// AdvancedPowerWheelchairCost
// ---------------------------
AdvancedPowerWheelchairCost::AdvancedPowerWheelchairCost(const Costing& costing_options)
    : WheelchairCost(costing_options) {
  speed_ = 10.0f; // km/h
  slope_penalty_ = 0.5f;
  surface_penalty_ = 1.0f;
}

Cost AdvancedPowerWheelchairCost::EdgeCost(const baldr::DirectedEdge* edge,
                                           const graph_tile_ptr& tile,
                                           const baldr::TimeInfo& time_info,
                                           uint8_t& flow_sources) const {
  float slope = edge->weighted_grade();
  float surface_factor = (edge->surface() == baldr::Surface::kPaved) ? 1.0f : surface_penalty_;
  float slope_factor = 1.0f + (slope_penalty_ * std::abs(slope));

  float cost = (edge->length() / speed_) * surface_factor * slope_factor;
  return {cost, edge->length() / speed_};
}

bool AdvancedPowerWheelchairCost::Allowed(const baldr::DirectedEdge* edge,
                                          const bool is_dest,
                                          const EdgeLabel& pred,
                                          const graph_tile_ptr& tile,
                                          const baldr::GraphId& edgeid,
                                          const uint64_t current_time,
                                          const uint32_t tz_index,
                                          uint8_t& restriction_idx) const {
  return DynamicCost::IsAccessible(edge);
}

bool AdvancedPowerWheelchairCost::AllowedReverse(const baldr::DirectedEdge* edge,
                                                 const EdgeLabel& pred,
                                                 const baldr::DirectedEdge* opp_edge,
                                                 const graph_tile_ptr& tile,
                                                 const baldr::GraphId& opp_edgeid,
                                                 const uint64_t current_time,
                                                 const uint32_t tz_index,
                                                 uint8_t& restriction_idx) const {
  return Allowed(edge, false, pred, tile, opp_edgeid, current_time, tz_index, restriction_idx);
}

float AdvancedPowerWheelchairCost::AStarCostFactor() const {
  return 1.0f / speed_;
}

// ★ 추가: 시간표 기반 EdgeCost 구현
Cost AdvancedPowerWheelchairCost::EdgeCost(const baldr::DirectedEdge* edge,
                                           const baldr::TransitDeparture* departure,
                                           const uint32_t curr_time) const {
  float length = edge->length();
  float cost_val = length / speed_;
  float time_val = length / speed_;

  return {cost_val, time_val};
}

// 팩토리 함수들
cost_ptr_t CreateStandardWheelchairCost(const Costing& costing_options) {
  return std::make_shared<StandardWheelchairCost>(costing_options);
}

cost_ptr_t CreateBasicPowerWheelchairCost(const Costing& costing_options) {
  return std::make_shared<BasicPowerWheelchairCost>(costing_options);
}

cost_ptr_t CreateAdvancedPowerWheelchairCost(const Costing& costing_options) {
  return std::make_shared<AdvancedPowerWheelchairCost>(costing_options);
}

} // namespace sif
} // namespace valhalla
