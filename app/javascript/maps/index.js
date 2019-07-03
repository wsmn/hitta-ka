import handleMapBox from './map';

document.addEventListener('turbolinks:load', () => {
  handleMapBox.initialize();
});
document.addEventListener('turbolinks:before-cache', () => {
});
