'use strict'

const utils = require('utility')

module.exports = {
  formatCent(num) {
    return (num / 100).toFixed(2)
  },

  getFromProfit(num, ratio = 20) {
    return num * ratio / 100
  },

  stringify(json) {
    return JSON.stringify(json)
  },

  YYYYMMDD(date) {
    return utils.YYYYMMDD(date)
  },

}
