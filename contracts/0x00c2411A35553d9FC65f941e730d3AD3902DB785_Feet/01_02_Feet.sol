// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Strings.sol";

library Feet {
  using Strings for uint256;

  string constant FEET_FEET___GOLD_PANDA =
    "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAxQTFRF/ffd8tBMAAAA////2NQKZQAAAAR0Uk5T////AEAqqfQAAACKSURBVHja7NRRDsAQEATQMb3/nauKIkiXpB/NbHwg9oklcGwGBAgQIECAAAECBAgQ8CkA1844WAA6H1W6D1qBbMSBDUDKSpYNyAKr7ipw963Asyv3gSDwWLiFEoChiERV98j1BUzyG6AvoH8AhMb++N0RyvVR4PsatC+H46c0uIUrphN/+pFOAQYAqMcuTHy5p0cAAAAASUVORK5CYII=";

  string constant FEET_FEET___SMALL_PANDA =
    "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAxQTFRF6+vrAAAAy8vL////g+A6vQAAAAR0Uk5T////AEAqqfQAAACISURBVHja7NTdCoAgDAXg7fT+7xzLZVj+jcAgzq6ctI+pI9lehhAgQIAAAQIECBAgQGApAIx3eoACZYHlGgFEcBlIEQQsrMqa8WXkDk5Bi+V6IBXpF0DRdv8MMqzPqegsYFPwBFAX6gCO7zPg6TTgLVyHdkEDd3AbXW3PcuMVLLobf/oj7QIMAAE6LfulgmAwAAAAAElFTkSuQmCC";

  string constant FEET_FEET___SMALL =
    "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAxQTFRFNTU1AAAALS0t////vgF0DAAAAAR0Uk5T////AEAqqfQAAACGSURBVHja7NRZCsAgDATQZLz/nduQVgl1pWChTL6MMA83lPSyhAABAgQIECBAgAABAlsBYDzTAxSIAet1BRBBMeC1CFhZyhZzDVfO4BY0DPcDHtIvgLDs/h5kmM+t6CxwBvQJaF2oA05kAB6fBlLMF2HhDKDh5VnXeIqNW7DqTvzpRzoEGADxri3xIUc9nwAAAABJRU5ErkJggg==";

  string constant FEET_FOOTWEAR___BEARFOOT =
    "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAZQTFRF////AAAAVcLTfgAAAAF0Uk5TAEDm2GYAAAAdSURBVHja7MGBAAAAAMOg+VPf4ARVAQAAAHwTYAAQQAABpAJfkQAAAABJRU5ErkJggg==";

  function getAsset(uint256 headNum) external pure returns (string memory) {
    if (headNum == 0) {
      return FEET_FEET___GOLD_PANDA;
    } else if (headNum == 1) {
      return FEET_FEET___SMALL_PANDA;
    } else if (headNum == 2) {
      return FEET_FEET___SMALL;
    } else if (headNum == 3) {
      return FEET_FOOTWEAR___BEARFOOT;
    }
    return FEET_FEET___GOLD_PANDA;
  }
}