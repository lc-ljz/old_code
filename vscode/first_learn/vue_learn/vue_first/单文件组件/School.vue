<template>
    <!-- 组件结构 -->
    <div class="demo">
        <h2>学校名称：{{name}}</h2>
        <h2>学校地址：{{address}}</h2>
        <button @click="showName">点我提示</button>
    </div>
</template>

<script>
    // 组件交互
    export default {
        name:"School",
        data(){
            return {
                name:"济南大学",
                address:"山东",
             }
        },
        methods: {
            showName(){
                alert(this.name)
            }
        },
    }

    // export default school  //默认暴露

</script>

<style>
    /* 组件样式 */
    .demo{
        background-color:orange;
    }
</style>

