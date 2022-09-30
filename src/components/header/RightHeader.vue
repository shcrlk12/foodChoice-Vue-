<template lang="">
    <div id="header-right-container">
        <MyButton @click="loginBtnClick" v-bind:isNormal="true" myButtonName="로그인" v-bind:class="{'show': !user.isLogin, 'hidden': user.isLogin}"></MyButton>
        <!-- <div v-bind:class="{'show': user.isLogin, 'hidden': !user.isLogin}">환영합니다!</div> -->
        <MyButton @click="logoutBtnClick" v-bind:isNormal="true" myButtonName="로그아웃" v-bind:class="{'show': user.isLogin, 'hidden': !user.isLogin}"></MyButton>
        <LoginModal v-on:exitClick="exitClick" v-bind:isVisable="isVisable" @loginSuccess="loginSuccess"></LoginModal>
    </div>
</template>
<script>
import MyButton from '../button/MyButton.vue'
import LoginModal from '../items/LoginModal.vue'

export default {
    data(){
        return{
            isVisable:false
        }
    },
    props:['user'],
    methods:{
        loginBtnClick(){
            console.log('test')
            this.isVisable= true;
        },
        logoutBtnClick(){
            window.location.href='./logout'
            setTimeout
        },
        exitClick(){
            this.isVisable = false;
        },
        loginSuccess(){
            this.$emit('loginSuccess')
        }
    },
    components:{
        MyButton,
        LoginModal
    }
}
</script>
<style lang="scss">
#header-right-container{
    display: flex;
    flex: 0 0 100px;
    padding-left: 10px;
}
</style>