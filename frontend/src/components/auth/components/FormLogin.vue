<template>
  <form class="w-full max-w-md flex flex-col gap-4 p-10">
    <!-- Username -->
    <div class="relative">
      <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
        <svg
          viewBox="0 0 16 16"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          stroke="#000000"
          width="20"
          height="20"
        >
          <g id="SVGRepo_bgCarrier" stroke-width="1"></g>
          <g
            id="SVGRepo_tracerCarrier"
            stroke-linecap="round"
            stroke-linejoin="round"
          ></g>
          <g id="SVGRepo_iconCarrier">
            <path
              d="M8 7C9.65685 7 11 5.65685 11 4C11 2.34315 9.65685 1 8 1C6.34315 1 5 2.34315 5 4C5 5.65685 6.34315 7 8 7Z"
              fill="none"
              stroke="#000000"
              stroke-width="1.25"
            ></path>
            <path
              d="M14 12C14 10.3431 12.6569 9 11 9H5C3.34315 9 2 10.3431 2 12V15H14V12Z"
              fill="none"
              stroke="#000000"
              stroke-width="1.25"
            ></path>
          </g>
        </svg>
      </span>
      <input
        name="username"
        type="text"
        placeholder="Username or email"
        class="pl-10 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
    </div>
    <!-- Password -->
    <div class="relative">
      <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
        <svg
          viewBox="0 0 24 24"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          class="w-5 h-5"
        >
          <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
          <g
            id="SVGRepo_tracerCarrier"
            stroke-linecap="round"
            stroke-linejoin="round"
          ></g>
          <g id="SVGRepo_iconCarrier">
            <path
              d="M7 10.0288C7.47142 10 8.05259 10 8.8 10H15.2C15.9474 10 16.5286 10 17 10.0288M7 10.0288C6.41168 10.0647 5.99429 10.1455 5.63803 10.327C5.07354 10.6146 4.6146 11.0735 4.32698 11.638C4 12.2798 4 13.1198 4 14.8V16.2C4 17.8802 4 18.7202 4.32698 19.362C4.6146 19.9265 5.07354 20.3854 5.63803 20.673C6.27976 21 7.11984 21 8.8 21H15.2C16.8802 21 17.7202 21 18.362 20.673C18.9265 20.3854 19.3854 19.9265 19.673 19.362C20 18.7202 20 17.8802 20 16.2V14.8C20 13.1198 20 12.2798 19.673 11.638C19.3854 11.0735 18.9265 10.6146 18.362 10.327C18.0057 10.1455 17.5883 10.0647 17 10.0288M7 10.0288V8C7 5.23858 9.23858 3 12 3C14.7614 3 17 5.23858 17 8V10.0288"
              stroke="#000000"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            ></path>
          </g>
        </svg>
      </span>
      <input
        name="password"
        type="password"
        placeholder="Password"
        class="pl-10 pr-3 py-2 w-full rounded-md bg-gray-100 focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
    </div>
    <!-- Buttons -->
    <div class="flex gap-4 mt-2">
      <button
        type="button"
        class="flex-1 border border-blue-500 text-blue-500 rounded-full py-2 font-medium hover:bg-blue-50 transition"
        @click="$emit('toggleForm')"
      >
        Create account
      </button>
      <button
        type="submit"
        class="flex-1 bg-blue-600 text-white rounded-full py-2 font-medium hover:bg-blue-700 transition"
      >
        Sign In
      </button>
    </div>
  </form>
</template>
<script setup></script>
