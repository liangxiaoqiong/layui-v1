/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-04-23.
 */
'use strict';
var vm = new Vue({
  el:'#app',
  data:function () {
    return {
		tabId : 1,
		config:{}
	}
  },
  mounted:function () {
    this.getData();
  },
  methods:{

	getData:function(){
		var self = this;
		AppUtil.ajaxRequest({
		  url: APP + '/Wx/index',
		  data: self.query,
		  type: 'POST',
		}).then(function (result) {

			self.config = result.data;
		})
	},
	changeTab:function(tabId){
		this.tabId = tabId;
	},
	saveData : function(tabId){
		var data = {};
		data.tab_id = tabId;
		if(tabId == 1){
			data.appid = this.config.appid;
			data.appsecret = this.config.appsecret;
			data.js_path = this.config.js_path;
		}else if(tabId == 2){
			data.mchid = this.config.mchid;
			data.key = this.config.key;
			data.sslcert_path = this.config.sslcert_path;
			data.sslkey_path = this.config.sslkey_path;
		}else if(tabId == 4){
			data.reply_msg = this.config.reply_msg;
		}
		AppUtil.ajaxRequest({
			url: APP + '/Wx/editWxConfig',
			data: data,
			type: 'POST',
		}).then(function (result) {
			 publicObj.layerMsg('保存成功！',1);
		})
	},
	createMenu : function(){
		AppUtil.ajaxRequest({
		  url: APP + '/Wx/createWxMenu',
		  type: 'POST',
		}).then(function (result) {
			publicObj.layerMsg('生成菜单成功',1);
		})
	},
	delMenu : function(menu_id){
		var self = this;
		layer.confirm('是否确认删除菜单', {title: '删除菜单', skin: 'layer-confirm'}, function (index) {
			var data = {};
			data.menu_id = menu_id;
			data.tab_id = 3
			data.type = 2;
			AppUtil.ajaxRequest({
				url: APP + '/Wx/editWxConfig',
				data: data,
				type: 'POST',
			}).then(function (result) {
				publicObj.layerMsg('删除菜单成功',1);
				self.getData();
				layer.close(index)
			})
		})
	},
	layerShow: function(menu_id){
		if(menu_id > 0 ){
			var title = '编辑菜单';
		}else{
			var title = '新增菜单';
		}
		publicObj.layerShow(2,title,APP + '/Wx/wxMenuInfo/menu_id/'+menu_id);
	},

    /**基本设置 start*/
    /*显示api接口弹框*/
    apiInterfaceLayer:function () {
      layer.alert($('.api-interface-layer'),{type:1,title:'对接接口信息',skin:'layer-confirm',btn:['关闭'],area:['60%','']});
    },
    /**基本设置 end*/

    /**菜单设置 start*/
    /*点击删除微信菜单*/
    wxMenuDel:function () {
      layer.confirm('',{title:'确定删除菜单？',skin:'layer-confirm'},function (index) {
        publicObj.layerMsg('删除成功',1);
      })
    },
    /**菜单设置 end*/
		/**
		 * 点击复制文字
		 * */
		copyText: function (event) {
			var el = event.currentTarget;
			var text = $(el).parent('dd').find('.copy-text').text();
			var id = $(el).parent('dd').find('.copy-text').attr('id');
			publicObj.copyContent(text,id);
		},
		uploadTip: function () {
			console.log('2')
			layer.tips('<div style="color: #666666;">· 1.在微信公众号》公众号设置》功能设置》打开 JS接口安全域名/设置，点击下载文件； <br>· 2.将文件上传至此后上传，再将店铺链接放在 微信JS接口安全域名里保存。</div>', '#upload-tip', {
				tips: [1, '#fff'],
				time: 4000
			});
		}
  },

})

layui.use(['upload','layer','element'],function(){
	var form = layui.form(),
	jq = layui.jquery ,
	element = layui.element();
	var loading;
	layui.upload({
		url: APP + "/Public/upload"
		,elem:'#js_path'
		,before: function(input){
			var data={'rootPath':'./','sfile': '/','autoSub_tip': -1 ,'saveName_tip' : -1};
			extra_data(input,data);
		    loading = layer.load(2, {
			shade: [0.2,'#000']
		  });
		}
		,success: function(res,input){
			vm.config.js_path = res.info[0].savepath + res.info[0].savename;
			layer.close(loading);
			publicObj.layerMsg('上传成功！', 1);
		}
    });

	layui.upload({
		url: APP + "/Public/upload"
		,elem:'#sslcert_path'
		,before: function(input){
			var data={'rootPath':'./Include/Library/Vendor/wxpaylib/','sfile': '/Pay/mall'+mall_id,'autoSub_tip': -1 ,'saveName_tip' : -1};
			extra_data(input,data);
		    loading = layer.load(2, {
			shade: [0.2,'#000']
		  });
		}
		,success: function(res,input){
			vm.config.sslcert_path = res.info[0].savepath + res.info[0].savename;
			layer.close(loading);
			publicObj.layerMsg('上传成功！', 1);
		}
    });

	layui.upload({
		url: APP + "/Public/upload"
		,elem:'#sslkey_path'
		,before: function(input){
			var data={'rootPath':'./Include/Library/Vendor/wxpaylib/','sfile': '/Pay/mall'+mall_id,'autoSub_tip': -1 ,'saveName_tip' : -1};
			extra_data(input,data);
		    loading = layer.load(2, {
			shade: [0.2,'#000']
		  });
		}
		,success: function(res,input){
			vm.config.sslkey_path = res.info[0].savepath + res.info[0].savename;
			layer.close(loading);
			publicObj.layerMsg('上传成功！', 1);
		}
    });

});

function extra_data(input,data){
	var item=[];
	$.each(data,function(k,v){
		item.push('<input type="hidden" name="'+k+'" value="'+v+'">');
	})
	$(input).after(item.join(''));
}
