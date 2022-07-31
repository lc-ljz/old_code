<template>
    <!-- 组件结构 -->
    <div class="demo">
        <h2>学生姓名：{{name}}</h2>
        <h2>年龄：{{age}}</h2>
    </div>
</template>

<script>
    // 组件交互
    export default {
        name:"Student",
        data(){
            return {
                name:"刘九洲",
                age:22,
             }
        }
    }

    // export default school  //默认暴露

</script>

<!-- <style>
    /* 组件样式 */
    .demo{
        background-color:orange;
    }
</style> -->

