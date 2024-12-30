#include "valhalla/sif/bicycle_medium_hills.h"
#include "valhalla/sif/costconstants.h"
#include <cmath>
#include <limits>

namespace valhalla {
namespace sif {

BicycleMediumHillsCost::BicycleMediumHillsCost(const boost::property_tree::ptree& config)
    : BicycleCost(config) {
  // heavy용 멤버 초기화
}

Cost BicycleMediumHillsCost::EdgeCost(const baldr::DirectedEdge* edge,
                                     const graph_tile_ptr& tile,
                                     const baldr::TimeInfo& time_info,
                                     uint8_t& flow_sources) const {
  // 기본
  Cost base = BicycleCost::EdgeCost(edge, tile, time_info, flow_sources);
  float new_cost = base.cost;

  // 예: 2%만 넘으면 +5, 5% 넘으면 +10, 10% 넘으면 사실상 배제(+999)
  int grade_idx = edge->weighted_grade();

  if (grade_idx > 7.5) {
    new_cost += 999.0f;
  } else if (grade_idx > 5) {
    new_cost += 10.0f;
  } else if (grade_idx > 2) {
    new_cost += 5.0f;
  }

  return {new_cost, base.secs};
}

float BicycleMediumHillsCost::get_slope_percent(const baldr::DirectedEdge* edge) const {
  return static_cast<float>(edge->weighted_grade());
}

cost_ptr_t CreateBicycleMediumHillsCost(const boost::property_tree::ptree& config) {
  return std::make_shared<BicycleMediumHillsCost>(config);
}

} // namespace sif
} // namespace valhalla
