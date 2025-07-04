<template>
  <form class="w-full max-w-md flex flex-col p-10 gap-4">
    <!-- Profile Details -->
    <fieldset class="rounded-md">
      <legend class="text-sm font-medium text-gray-700 mb-4">
        Profile Details
      </legend>
      <div class="flex flex-col gap-4">
        <!-- Name -->
        <input
          type="text"
          placeholder="Full name"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- Username -->
        <input
          type="text"
          placeholder="Username"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- Email -->
        <input
          name="email"
          type="email"
          placeholder="Email"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- Password -->
        <input
          name="password"
          type="password"
          placeholder="Password"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </fieldset>

    <!-- Location -->
    <fieldset class="rounded-md">
      <div class="flex items-center justify-between mb-4">
        <legend class="text-sm font-medium text-gray-700">Location</legend>
        <button
          type="button"
          class="text-xs text-blue-600 hover:text-blue-800 underline"
          @click="getCurrentLocation"
        >
          Use Current Location
        </button>
      </div>
      <div class="flex flex-col gap-4">
        <!-- City -->
        <input
          type="text"
          placeholder="City"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- State -->
        <input
          type="text"
          placeholder="State"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- Country -->
        <input
          type="text"
          placeholder="Country"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <!-- ZIP -->
        <input
          type="text"
          placeholder="ZIP"
          required
          class="pl-4 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
    </fieldset>

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
<script setup>
const getCurrentLocation = () => {};
</script>
