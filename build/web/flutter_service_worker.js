'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "0555c4c7b58454c2664e321e27c637de",
"/": "0555c4c7b58454c2664e321e27c637de",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"assets/FontManifest.json": "c3179e5121214440cf87cff9e13fd283",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.bin.json": "5a5c840e98a4c031b5e7c91460053fa0",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/learncards.webp": "c03ed6d7f51420703bc2cb997bd5120b",
"assets/assets/images/Screenshot_2023-12-25_at_20.25.06-removebg-preview.png": "873c0e422b6bf5b8124320f9ec1963c5",
"assets/assets/images/addImage@2x.png": "e684bd8b00aac765414b257df5f74fd9",
"assets/assets/images/allTasksComplete@2x.png": "e311b1a710f43a55e9a412de26328e4f",
"assets/assets/images/Screenshot_2023-12-30_at_21.15.48.png": "5e471265e7b41e48c7672b69a371b8d5",
"assets/assets/images/logocaio.png": "d866376d72aad28d7fd9e04d6b569349",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/learning.webp": "4e334cafb5c9c8bd9ae458fbc825e43d",
"assets/assets/images/Screenshot_2023-06-29_at_11.16.13.png": "616feea815d8919fd76696821b68cecb",
"assets/assets/images/illi_1@2x.png": "030793fc1a20cd5f6b39c6d5d85ee2e1",
"assets/assets/images/video.png": "c58ea9fed8b1a17e017078e153393be3",
"assets/assets/images/red.png": "0648853892f9177a0fb94d5f0346d85d",
"assets/assets/images/Screenshot_2023-12-31_at_15.43.12-removebg-preview.png": "4a85051f2069a994d1d9758d0921eccf",
"assets/assets/images/dg0865_Chief_AI_Officer_Taylor_Jordan_Leads_AI_strategy_and_imp_3be63b10-fc84-4fb8-815c-db58d2530086.png": "9ff58ebbcd57bdf0aa267000983b4f22",
"assets/assets/images/app_launcher_icon.webp": "1a12042c6c6a0c3310e3ba362aac2776",
"assets/assets/images/Untitled_6.png": "c41d55e37cfaf493db766cba9feed2c0",
"assets/assets/images/error_image.png": "ca3a1f0ee2b1ca13ac66f13784d069a0",
"assets/assets/images/add.png": "a5d490eaca87e6b9aa0dc895823743a9",
"assets/assets/images/illi_2@2x.png": "b8fbe66f8ca7579c11b257b255cd9233",
"assets/assets/images/UpSkilller__1_-removebg-preview.png": "5a8de231496dbdf97c2c311c509f1495",
"assets/assets/images/LIVE.jpeg": "7e6c97bf735c9af899a39ca3130f83ac",
"assets/assets/images/Screenshot_2023-12-30_at_21.15.34.png": "db5e5e6b6fd54776f80e1817b5a2afd4",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Gotham_Bold.otf": "722c5f898bbca8b2eb3fce0287688326",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Gotham_Medium.otf": "e19c20e966bde501f94e41cd0322dbe8",
"assets/assets/fonts/Lexend%2520Deca-SemiBold.ttf": "4e35c5c5270efa6aed1b719e6708ac24",
"assets/assets/fonts/Gotham_Black_Regular.ttf": "8faba3db5e37f5f5e3bb9e10cb6a74aa",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/lf20_7fwvvesa.json": "f1faef1270a19df9a0cd0c7c71f92bbd",
"assets/assets/lottie_animations/Animation_-_1703108950357.json": "06f693ad197c74c5dcfa9fbda92a9d9c",
"assets/assets/lottie_animations/lf20_jvkRrK.json": "e7d8f81c7ee3212c12585e0ae3777a0d",
"assets/assets/lottie_animations/Animation_-_1704729888777.json": "9bedb51f788ca7952a6aa0f367ceb5a8",
"assets/AssetManifest.bin": "4637b64aa6f6c5ec222ed114ac0e2e18",
"assets/NOTICES": "64973e9609a0085eb7cca75b195ddec3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f25e8e701660fb45e2a81ff3f43c6d5c",
"assets/AssetManifest.json": "b0c2304552202ab578e2a7665842ee90",
"version.json": "0bf8d642c869b92749262207dc504f48",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/app_launcher_icon.webp": "1a12042c6c6a0c3310e3ba362aac2776",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "5c6fa8995828c47f5252e2ecddf7e1d2",
"Screenshot_2023-12-31_at_15.43.12-removebg-preview.png": "4a85051f2069a994d1d9758d0921eccf",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "90d13ff504612ceef5d0ef7e97a70065"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
