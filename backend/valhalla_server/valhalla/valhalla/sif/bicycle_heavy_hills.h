#pragma once

#include "valhalla/sif/bicyclecost.h"

namespace valhalla {
namespace sif {

/**
 * BicycleHeavyHillsCost:
 *  - 상속: BicycleCost
 *  - 경사에 매우 민감하게 페널티를 주는 버전
 */
class BicycleHeavyHillsCost : public BicycleCost {
public:
  explicit BicycleHeavyHillsCost(const boost::property_tree::ptree& config);

  virtual Cost EdgeCost(const baldr::DirectedEdge* edge,
                        const graph_tile_ptr& tile,
                        const baldr::TimeInfo& time_info,
                        uint8_t& flow_sources) const override;

private:
  float get_slope_percent(const baldr::DirectedEdge* edge) const;
};

cost_ptr_t CreateBicycleHeavyHillsCost(const boost::property_tree::ptree& config);

} // namespace sif
} // namespace valhalla
