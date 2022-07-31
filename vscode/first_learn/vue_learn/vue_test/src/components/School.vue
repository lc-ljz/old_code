<template>
    <!-- 组件结构 -->
    <div class="demo">
        <h2 @click="showname">学校名称：{{name}}</h2>
        <h2>学校地址：{{address}}</h2>
    </div>
</template>

<script>
    //引入一个mixin
    import {mixin} from '../mixin'

    // 组件交互
    export default {
        name:"School",
        data(){
            return {
                name:"济南大学",
                address:"山东",
            }
        },
       mixins:[mixin]
    }

    // export default school  //默认暴露

</script>

<style scoped>
    /* 组件样式 */
    .demo{
        background-color:blue;
    }
</style>

<!-- <style lang="less">
    .demo{
        background-color: pink;
        .qwe{
            font-size: 40px;
        }
    }
</style> -->