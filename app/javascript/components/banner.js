import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Voyagez le coeur léger . . ."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
