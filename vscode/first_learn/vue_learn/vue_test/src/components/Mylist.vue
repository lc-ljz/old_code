<template>
    <div>
        <li>
            <label>
                <input type="checkbox">
                <span>XXXXX</span>
            </label>
            <button class="btn btn-danger" style="display: none;">删除</button>
        </li>
        <li>
            <label>
                <input type="checkbox">
                <span>yyyyy</span>
            </label>
            <button class="btn btn-danger" style="display: none;">删除</button>
        </li>


        <Myitem></Myitem>
    </div>
</template>

<script>

    import Myitem from './Myitem.vue'
    export default {
        name:"Mylist",
        components:{Myitem},
    }
</script>

<style lang="css">
    
</style>