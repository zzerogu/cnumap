#ifndef VALHALLA_SIF_WHEELCHAIR_COST_H_
#define VALHALLA_SIF_WHEELCHAIR_COST_H_

#include "valhalla/sif/dynamiccost.h"

namespace valhalla {
namespace sif {

class WheelchairCost : public DynamicCost {
public:
  explicit WheelchairCost(const Costing& costing_options);

  // 누락된 순수 가상 함수 추가
  // 1) 시간표 기반(trip schedule) EdgeCost
  virtual Cost EdgeCost(const baldr::DirectedEdge* edge,
                        const baldr::TransitDeparture* departure,
                        const uint32_t curr_time) const override = 0;

  // 2) 이미 있던 순수 가상 함수들
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const graph_tile_ptr& tile,
                const baldr::TimeInfo& time_info,
                uint8_t& flow_sources) const override = 0;

  bool Allowed(const baldr::DirectedEdge* edge,
               const bool is_dest,
               const EdgeLabel& pred,
               const graph_tile_ptr& tile,
               const baldr::GraphId& edgeid,
               const uint64_t current_time,
               const uint32_t tz_index,
               uint8_t& restriction_idx) const override = 0;

  bool AllowedReverse(const baldr::DirectedEdge* edge,
                      const EdgeLabel& pred,
                      const baldr::DirectedEdge* opp_edge,
                      const graph_tile_ptr& tile,
                      const baldr::GraphId& opp_edgeid,
                      const uint64_t current_time,
                      const uint32_t tz_index,
                      uint8_t& restriction_idx) const override = 0;

  float AStarCostFactor() const override = 0;

protected:
  float speed_;           // 평균 이동 속도
  float slope_penalty_;   // 경사도에 따른 페널티
  float surface_penalty_; // 표면 상태에 따른 페널티
};

// ---------------------------
// StandardWheelchairCost
// ---------------------------
class StandardWheelchairCost : public WheelchairCost {
public:
  explicit StandardWheelchairCost(const Costing& costing_options);

  // 새로 추가한 함수(시간표 기반 EdgeCost)
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const baldr::TransitDeparture* departure,
                const uint32_t curr_time) const override;

  // 기존 순수 가상 함수 구현들
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const graph_tile_ptr& tile,
                const baldr::TimeInfo& time_info,
                uint8_t& flow_sources) const override;

  bool Allowed(const baldr::DirectedEdge* edge,
               const bool is_dest,
               const EdgeLabel& pred,
               const graph_tile_ptr& tile,
               const baldr::GraphId& edgeid,
               const uint64_t current_time,
               const uint32_t tz_index,
               uint8_t& restriction_idx) const override;

  bool AllowedReverse(const baldr::DirectedEdge* edge,
                      const EdgeLabel& pred,
                      const baldr::DirectedEdge* opp_edge,
                      const graph_tile_ptr& tile,
                      const baldr::GraphId& opp_edgeid,
                      const uint64_t current_time,
                      const uint32_t tz_index,
                      uint8_t& restriction_idx) const override;

  float AStarCostFactor() const override;
};

// ---------------------------
// BasicPowerWheelchairCost
// ---------------------------
class BasicPowerWheelchairCost : public WheelchairCost {
public:
  explicit BasicPowerWheelchairCost(const Costing& costing_options);

  // 새로 추가한 함수(시간표 기반 EdgeCost)
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const baldr::TransitDeparture* departure,
                const uint32_t curr_time) const override;

  // 기존 순수 가상 함수 구현들
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const graph_tile_ptr& tile,
                const baldr::TimeInfo& time_info,
                uint8_t& flow_sources) const override;

  bool Allowed(const baldr::DirectedEdge* edge,
               const bool is_dest,
               const EdgeLabel& pred,
               const graph_tile_ptr& tile,
               const baldr::GraphId& edgeid,
               const uint64_t current_time,
               const uint32_t tz_index,
               uint8_t& restriction_idx) const override;

  bool AllowedReverse(const baldr::DirectedEdge* edge,
                      const EdgeLabel& pred,
                      const baldr::DirectedEdge* opp_edge,
                      const graph_tile_ptr& tile,
                      const baldr::GraphId& opp_edgeid,
                      const uint64_t current_time,
                      const uint32_t tz_index,
                      uint8_t& restriction_idx) const override;

  float AStarCostFactor() const override;
};

// ---------------------------
// AdvancedPowerWheelchairCost
// ---------------------------
class AdvancedPowerWheelchairCost : public WheelchairCost {
public:
  explicit AdvancedPowerWheelchairCost(const Costing& costing_options);

  // 새로 추가한 함수(시간표 기반 EdgeCost)
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const baldr::TransitDeparture* departure,
                const uint32_t curr_time) const override;

  // 기존 순수 가상 함수 구현들
  Cost EdgeCost(const baldr::DirectedEdge* edge,
                const graph_tile_ptr& tile,
                const baldr::TimeInfo& time_info,
                uint8_t& flow_sources) const override;

  bool Allowed(const baldr::DirectedEdge* edge,
               const bool is_dest,
               const EdgeLabel& pred,
               const graph_tile_ptr& tile,
               const baldr::GraphId& edgeid,
               const uint64_t current_time,
               const uint32_t tz_index,
               uint8_t& restriction_idx) const override;

  bool AllowedReverse(const baldr::DirectedEdge* edge,
                      const EdgeLabel& pred,
                      const baldr::DirectedEdge* opp_edge,
                      const graph_tile_ptr& tile,
                      const baldr::GraphId& opp_edgeid,
                      const uint64_t current_time,
                      const uint32_t tz_index,
                      uint8_t& restriction_idx) const override;

  float AStarCostFactor() const override;
};

// 팩토리 함수들
cost_ptr_t CreateStandardWheelchairCost(const Costing& costing_options);
cost_ptr_t CreateBasicPowerWheelchairCost(const Costing& costing_options);
cost_ptr_t CreateAdvancedPowerWheelchairCost(const Costing& costing_options);

} // namespace sif
} // namespace valhalla

#endif // VALHALLA_SIF_WHEELCHAIR_COST_H_
