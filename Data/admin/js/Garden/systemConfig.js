/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-03-27.
 */
'use strict';
var vm = new Vue({
  el: '#app',
  components: {
    'area-code-phone': COMPONENT.AREA_CODE_PHONE_COMPONENT,
    'service-receipt-layer': COMPONENT.SERVICE_RECEIPT_LAYER,
    'electric-receipt-layer': COMPONENT.ELECTRIC_RECEIPT_LAYER,
  },
  data: function () {
    return {
      sundryData: {},
      showCollectionAccount: false,
      loadCompleted: false,
      tabId: 1, //顶部tab切换
      timeNum: 3,
      textNum: 10,
      configData: {
        contract_remind_time: '', // 合同到期前N天提醒
        service_ctrl: 0,
        service_name: '',
        maintain_ctrl: 0,
        maintain_name: '',
        pipeline_number_rule: 0, // 是否自定义合同编号规则
        pipeline_number_prefix: '', // 合同编号规则前缀
        pipeline_number_suffix: '', // 合同编号规则位数
        custom_payment_list: [],//自定义收款方式数组
        server_official_union_account_id: 0,
        server_coop_union_account_id: 0,
        wx_pay_account_id: 0,
        electric_official_union_account_id: 0,
        electric_coop_union_account_id: 0,
      },
      timeList: [],
      editContractSn: {} // 编辑合同编号规则
    }
  },
  computed: {
    contractSn: function () {
      if ((typeof this.configData.pipeline_number_prefix === "undefined" || this.configData.pipeline_number_prefix === '')
        || (typeof this.configData.pipeline_number_suffix === "undefined" || this.configData.pipeline_number_suffix === '' || this.configData.pipeline_number_suffix == 0)) {
        return 0
      } else {
        return this.configData.pipeline_number_prefix + '' + publicObj.padNum(1, +this.configData.pipeline_number_suffix)
      }
    }
  },
  mounted: function () {
    for (var i = 1; i <= this.timeNum; i++) {
      this.$set(this.configData, 'time_ctrl_' + i, 0)
      this.$set(this.configData, 'time_name_' + i, '')
    }
    for (var i = 1; i <= this.textNum; i++) {
      this.$set(this.configData, 'text_ctrl_' + i, 0)
      this.$set(this.configData, 'text_name_' + i, '')
    }
    var timeList = []
    for (var i = 0; i < 24; i++) {
      var time = publicObj.padNum(i, 2)
      timeList.push('' + time + ':00')
    }
    this.timeList = timeList
    this.getSundryData();
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
    getData: function () {
      var self = this;
      AppUtil.ajaxRequest({
        url: '/admin.php?c=Garden&a=systemConfigInfo',
        type: 'POST',
      }).then(function (result) {
        result.data.custom_payment_list = [{name: '减免费用', isEdit: 1}]//自定义收款方式数组
        self.configData = result.data;
        self.loadCompleted = true
        layer.closeAll()
      })
    },
    changeTab: function (tid) {
      if (typeof tid !== 'undefined') {
        this.tabId = tid
      }
    },
    saveData: function () {
      var self = this;
      AppUtil.ajaxRequest({
        url: '/admin.php?c=Garden&a=editSystemConfigInfo',
        data: self.configData,
        type: 'POST',
      }).then(function (result) {
        publicObj.layerMsg('系统设置成功', 1);
        self.getData();
      })

    },

    // 设置合同编号
    setContractSnRule: function () {
      var self = this
      layer.confirm($('#set-contract-sn'), {
        type: 1,
        title: '设置合同编号规则',
        skin: 'layer-confirm'
      }, function (index) {
        self.saveData()
      })
    },
    /*合同编号位数 数值验证*/
    contractSnNumValid: function (event) {
      var self = this;
      var el = event.currentTarget;
      self.$nextTick(function () {
        if (+self.configData.pipeline_number_suffix <= 0) {
          self.configData.pipeline_number_suffix = 1
        }
        self.configData.pipeline_number_suffix = publicObj.numInt(el);
      })
    },
    setQrCodeLayer: function () {
      this.showCollectionAccount = true;
      publicObj.layerShow(1,'设置服务方收款码','#qrCode-layer');
    },
    setElectricQrCodeLayer: function () {
      this.showCollectionAccount = true;
      publicObj.layerShow(1,'设置电费收款方','#electricQrCode-layer');
    },
    /**region 自定义收款方式*/
    //新增收款方式
    addCustomPayType: function () {
      this.configData.custom_payment_list.push({name: '', isEdit: 0})
    },
    delCustomPayType: function (index) {
      this.configData.custom_payment_list.splice(index, 1)
    }
    /**endregion 自定义收款方式*/
  }
})
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#qrcodeImg'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.qr_code_img = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#qrcodeImg2'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.qr_code_img_2 = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#electricqrcodeImg'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.electric_qr_code_img = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#electricqrcodeImg2'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.electric_qr_code_img_2 = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
