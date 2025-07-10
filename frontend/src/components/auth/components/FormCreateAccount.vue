<template>
  <form class="w-full max-w-md flex flex-col p-10 gap-4">

    <fieldset class="rounded-md">
      <legend class="text-sm font-medium text-gray-700 mb-4">
        Profile Details
      </legend>
      <div class="flex flex-col gap-4">

        <input
          name="name"
          type="text"
          placeholder="Full name"
          required
          aria-label="enter full name"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
   
        <input
          name="username"
          type="text"
          placeholder="Username"
          required
          aria-label="create username"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />

        <input
          name="email"
          type="email"
          placeholder="Email"
          required
          aria-label="create email"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          name="password"
          type="password"
          placeholder="Password"
          required
          aria-label="create password"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </fieldset>


    <fieldset class="rounded-md">
      <div class="flex items-center justify-between mb-4">
        <legend class="text-sm font-medium text-gray-700">Location</legend>
        <button
          type="button"
          class="text-xs text-blue-600 hover:text-blue-800 underline"
          @click="getCurrentLocation"
          aria-label="Click here to use current location from browser"
        >
          Use Current Location
        </button>
      </div>
      <div class="flex flex-col gap-4">
        <input
          name="city"
          type="text"
          placeholder="City"
          required
          aria-label="Enter city"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          name="state"
          type="text"
          placeholder="State"
          required
          aria-label="Enter  state"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          name="country"
          type="text"
          placeholder="Country"
          required
          aria-label="Enter country"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <input
          name="zip"
          type="text"
          placeholder="ZIP"
          required
          aria-label="Enter zip"
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </fieldset>

    <div class="flex gap-4 mt-2">
      <button
        type="button"
        class="flex-1 border border-blue-500 text-blue-500 rounded-full py-2 font-medium hover:bg-blue-50 transition"
        @click="$emit('toggleForm')"
        aria-label="go back to sign in button"
      >
        Back to Sign In
      </button>
      <button
        class="flex-1 bg-green-600 text-white rounded-full py-2 font-medium hover:bg-green-700 transition"
        aria-label="create account button"
      >
        Register
      </button>
    </div>
  </form>
</template>
<script setup lang="ts">
const getCurrentLocation = () => {};
</script>
