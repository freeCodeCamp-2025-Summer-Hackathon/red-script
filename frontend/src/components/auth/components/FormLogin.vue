<template>
  <form class="w-full max-w-md flex flex-col gap-4 p-10" @submit.prevent="onSubmit">
    <!-- Username -->
    <div class="relative">
      <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
        <img :src="userIcon" class="w-4.5 h-4.5" />
      </span>
      <input
        name="email"
        v-model="email"
        type="text"
        placeholder="Email"
        class="pl-10 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        aria-label="login username or email"
      />
    </div>
    <!-- Password -->
    <div class="relative">
      <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
        <img :src="passwordIcon" class="w-5 h-5" />
      </span>
      <input
        name="password"
        v-model="password"
        type="password"
        placeholder="Password"
        class="pl-10 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        aria-label="login password"
      />
    </div>
    <div class="flex gap-4 mt-2">
      <button
        type="button"
        class="flex-1 border border-blue-500 text-blue-500 rounded-full py-2 font-medium hover:bg-blue-50 transition"
        @click="$emit('toggleForm')"
        aria-label="go to create account page"
      >
        Create account
      </button>
      <button
        class="flex-1 bg-blue-600 text-white rounded-full py-2 font-medium hover:bg-blue-700 transition"
        aria-label="sign in button"
      >
        Sign In
      </button>
    </div>
  </form>
</template>
<script setup lang="ts">
import {ref} from 'vue';
import userIcon from '../../../assets/user-icon.svg'
import passwordIcon from '../../../assets/lock.svg'

const email=ref('')
const password=ref('')
const emit = defineEmits(['toggleForm','loginSubmitted'])

const onSubmit = () => {
  const loginData = {
  email: email.value,
  password: password.value,
  // password: hash(password.value)
  };
  emit('loginSubmitted', loginData)
}
</script>
