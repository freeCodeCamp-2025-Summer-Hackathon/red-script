<template>
  <div class="min-h-screen flex flex-col bg-[#232323]">
    <div class="flex flex-1">
      <!-- Left side -->
      <div class="w-1/2 flex flex-col justify-center items-end bg-white pr-8">
        <span class="text-3xl font-bold mb-4">SkillSwap</span>
        <h1 class="text-5xl font-bold mb-2">
          {{ isSignIn ? "Sign In" : "Create Account" }}
        </h1>
        <p class="text-lg text-black mb-2">
          {{
            isSignIn
              ? "Enter your username and password"
              : "Sign up to start swapping skills"
          }}
        </p>
      </div>

      <!-- Right side -->
      <div
        class="w-1/2 flex flex-col justify-center items-center bg-white shadow-[-2px_0_8px_0_rgba(0,0,0,0.2)]"
      >
        <FormLogin v-if="isSignIn" @toggleForm="isSignIn = false" />
        <FormCreateAccount v-else @toggleForm="isSignIn = true" />
      </div>
    </div>
  </div>
  <Footer />
</template>

<script setup>
import { ref } from "vue";
import FormLogin from "../components/auth/components/FormLogin.vue";
import Footer from "../components/layout/Footer.vue";
import FormCreateAccount from "../components/auth/components/FormCreateAccount.vue";

const isSignIn = ref(true);
</script>
