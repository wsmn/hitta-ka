let msg, unsaved;
msg = "Changes you made may not be saved.";
unsaved = false;

document.addEventListener('turbolinks:load', function() {
  msg = document.querySelector("body").dataset.confirmUnsaved;
  unsaved = false;
  var formFields = document.querySelectorAll('form[role="check-modified"]:not(data-remote) input');

  Array.from(formFields).forEach(field => {
    field.addEventListener('change', function() {
      return unsaved = true;
    });
  })

  var forms = document.querySelectorAll('form[role="check-modified"]');

  Array.from(forms).forEach(form => {
    form.addEventListener('submit', function() {
      unsaved = false;
    });
  })
})


window.addEventListener('beforeunload', function() {
  if (unsaved) {
    return msg;
  }
});

document.addEventListener('turbolinks:before-visit', function(evenet) {
  if (unsaved && !confirm(msg)) {
    return event.preventDefault();
  }
});
