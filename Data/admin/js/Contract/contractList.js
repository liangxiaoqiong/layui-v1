/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-04-18.
 */
'use strict';
var vm = new Vue({
  el: '#app',
  components: {
    'contract-index-search': COMPONENT.CONTRACT_INDEX_SEARCH,
    'pagination-layui': COMPONENT.PAGINATION_LAYUI_COMPONENT
  },
  data: function () {
    return {
      contractData: {},
      dataTotal: 0,
      query: {
        page: 1,
        limit: 20,
        status: '',
        start_time_min: '',
        start_time_max: '',
        end_time_min: '',
        end_time_max: '',
        room_info: '',
        customer_name: '',
        customer_mobile: '',
        lessor_id: '',
        is_intermediary: '',
        merchant_name: '',
        label_id: '',
        garden_child_id: '',
      },
      meta: {
        total_num: '',
        need_deal_num: '',
        end_num: '',
        active_num: '',
        eviction_num: '',
      },
      sundryData: {}
    }
  },
  mounted: function () {
    this.getSundryData()
    this.getData();
  },
  methods: {
    /**
     * 获取杂项数据
     */
    getSundryData: function () {
      var self = this
      AppUtil.ajaxRequest({
        url: APP + '/getSundryData'
      }).then(function (result) {
        self.sundryData = result.data
      }).catch(function (result) {

      })
    },

    getData: function (current) {
      var self = this;
      if (typeof current !== 'undefined') {
        if (typeof current.page !== 'undefined') {
          self.query.page = current.page;
        }
        if (typeof current.limit !== 'undefined') {
          self.query.limit = current.limit;
        }
      }
      self.contractData = {}
      self.dataTotal = 0
      AppUtil.ajaxRequest({
        url: APP + '/Contract/index',
        data: self.query,
        type: 'get',
      }).then(function (result) {
        self.contractData = result.data;
        self.dataTotal = result.data.total;
        self.meta = result.data.meta ? result.data.meta : self.meta
        self.$refs.pagination.resetPage(self.dataTotal)
      })
    },
    layerShow: function (state, title, contract_id) {
      publicObj.layerShow(state, title, APP + '/ContractPrint/contract_id/' + contract_id);
    },
  }
})
