/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-04-20.
 */
'use strict';
var ue = {};
var vm = new Vue({
  el:'#app',
  data:function () {
    return{
			menuData: {
				parent_id: 0
			} ,
		}
  },
  mounted:function () {
		this.getData();
		/*设置选中*/
		layui.use(['form','upload','layer','element'],function(){
		var form = layui.form()
			 ,jq = layui.jquery
				 ,element = layui.element();
			form.render('select','selectParent'); 
		});//全局样式 
  }, 
 
  methods:{
		getData:function(){  
			var self = this;
			if (menu_id<=0){
				return false
			}
			AppUtil.ajaxRequest({
				url: APP + '/Wx/wxMenuInfo',
				data: {menu_id : menu_id},
				type: 'POST',     
			}).then(function (result) {
				if(result.data) {
					self.menuData = result.data;	
				}

			})    
		} ,
		cancel:function(){
			publicObj.layerFrameClose();
		}, 
		saveData:function(){
			var self = this;
			var data = self.menuData;
			data.tab_id = 3;
			data.type = 1;  
			console.log(data); 
			AppUtil.ajaxRequest({             
				url: APP + '/Wx/editWxConfig',
				data: data,       
				type: 'POST',
			}).then(function (result) {
				publicObj.layerMsg('编辑菜单成功',1);
				parent.vm.getData();
				publicObj.layerFrameClose();
			})    

		},
  },	
     
  filters: {
	  /**时间过滤器*/ 
	  formatDate: function (value) {
		return publicObj.formatDate(new Date(value * 1000));
	  }
  },	     
})
   