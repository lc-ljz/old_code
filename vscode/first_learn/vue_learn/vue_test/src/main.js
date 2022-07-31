/*
  该文件是整个项目的入口文件
*/
//引入vue (没有模板解析器,vue中不能有template)
import Vue from 'vue'
//引入APP组件，它是所有组件的父组件
import App from './App.vue'
//引入插件
// import plugins from './plugins'

// //使用插件
// Vue.use(plugins)
//关闭vue的生产提示
Vue.config.productionTip = false

//全局混入（混合）
// import {mixin} from './mixin'
// Vue.mixin(mixin)


//创建vue实例对象
new Vue({
  render: h => h(App), // 创建元素;render:渲染;一个函数,h为函数参数，也是一个函数
}).$mount('#app')
