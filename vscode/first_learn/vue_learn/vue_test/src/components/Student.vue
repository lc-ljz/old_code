<template>
    <!-- 组件结构 -->
    <div class="demo">
        <h2 class='title'>你好</h2>
        <h2>{{msg}}</h2>
        <h2 @click="showname">学生姓名：{{name}}</h2>
        <h2>年龄：{{age+1}}</h2>
        <h2>性别：{{sex}}</h2>
    </div>
</template>

<script>

    //引入一个mixin
    import {mixin} from '../mixin'

    // 组件交互
    export default {
        name:"Student",
        data(){
            return {
                msg:"Hello Word!",
                myage:this.age
             }
        },
        mixins:[mixin],


        //简单声明接受(多)
        // props:['name','age','sex'] 

        //接收的同时对数据进行类型限制
        // props:{
        //     name:String,
        //     age:Number,
        //     sex:String
        // }

        //这些数据 尽量 不允许修改,比date中更先进入vc
        //接收的同时对数据：进行类型限制 + 默认值的指定 + 必要性的限制
        props:{
            name:{
                type:String,  //类型限制
                required:true //name是必要的
            },
            age:{
                type:Number,  //类型限制
                default:99 //默认值
            },
            sex:{
                type:String,  //类型限制
                required:true //sex是必要的
            }
        }
    }

    // export default school  //默认暴露

</script>

<style>
    /* 组件样式 */
    .demo{
        background-color:orange;
    }
</style>

