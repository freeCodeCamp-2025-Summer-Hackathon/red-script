<template>
  <form class="w-full max-w-md flex flex-col gap-4 px-10">
    <!-- Name -->
    <input
      type="text"
      placeholder="Full name"
      class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
    />
    <!-- Email -->
    <input
      name="email"
      type="email"
      placeholder="Email"
      class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
    />
    <!-- Password -->
    <input
      name="password"
      type="password"
      placeholder="Password"
      class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
    />
    <!-- Buttons -->
    <div class="flex gap-4 mt-2">
      <button
        type="button"
        class="flex-1 border border-blue-500 text-blue-500 rounded-full py-2 font-medium hover:bg-blue-50 transition"
        @click="$emit('toggleForm')"
      >
        Back to Sign In
      </button>
      <button
        type="submit"
        class="flex-1 bg-green-600 text-white rounded-full py-2 font-medium hover:bg-green-700 transition"
      >
        Register
      </button>
    </div>
  </form>
</template>
<script setup></script>
