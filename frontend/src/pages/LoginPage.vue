<template>
  <div class="min-h-screen flex flex-col">
    <div class="flex flex-1 flex-col lg:flex-row">
      <!-- Left side -->
      <div
        class="w-full lg:w-1/2 flex flex-col justify-center items-center lg:items-end bg-white lg:pr-8 pt-8 lg:py-0"
      >
        <span class="text-3xl font-bold mb-4">SkillSwap</span>
        <h1 class="text-5xl font-bold mb-2 text-center lg:text-left">
          {{ isSignIn ? "Sign In" : "Create Account" }}
        </h1>
        <p class="text-lg text-black mb-2 text-center lg:text-left max-w-md">
          {{
            isSignIn
              ? "Enter your username and password"
              : "Sign up to start swapping skills"
          }}
        </p>
      </div>

      <!-- Right side -->
      <div
        class="w-full lg:w-1/2 flex flex-col justify-center items-center bg-white shadow-none lg:shadow-[-2px_0_2px_0_rgba(0,0,0,0.2)] pb-8 lg:py-0"
      >
        <FormLogin v-if="isSignIn" @toggleForm="isSignIn = false" @loginSubmitted="emitLoginSubmitted" />
        <FormCreateAccount v-else @toggleForm="isSignIn = true" @registrationSubmitted="emitRegistrationSubmitted" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import FormLogin from "../components/auth/components/FormLogin.vue";
import FormCreateAccount from "../components/auth/components/FormCreateAccount.vue";

const emit = defineEmits(['registrationSubmitted','loginSubmitted'])
const emitRegistrationSubmitted = (registrationData: Object) => {
  emit("registrationSubmitted", registrationData)
};

const emitLoginSubmitted = (loginData: Object) => {
  emit("loginSubmitted", loginData)
};

const isSignIn = ref(true);
</script>
