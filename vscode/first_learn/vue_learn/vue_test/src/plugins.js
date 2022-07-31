
//插件
export default {
    install(Vue){  //参数为Vue
        console.log('@@install')

        //全局过滤器
        Vue.filter('myslice',function(value){
            return value.slice(0,4)
        })

        //全局指令
        // Vue.directive(id, [definition])

        //定义混入
        // Vue.mixin({
        //     data(){
        //         return {
        //             x:100
        //         }
        //     }
        // })
    }
}