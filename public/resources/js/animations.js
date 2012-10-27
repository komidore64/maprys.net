function switch_to(content_id) {
  if (open_pane == null) {
    open(content_id);
  } else if (open_pane == content_id) {
    return
  } else {
    close(open_pane, function() { open(content_id); });
  }
  open_pane = content_id;
}

function close_all() {
  $("#" + open_pane).hide('blind', { direction: 'vertical' }, 1000);
  open_pane = null;
}

function open(content_id) {
  $("#" + content_id).show('blind', { direction: 'vertical' }, 1000);
}

function close(content_id, callback) {
  $("#" + content_id).hide('blind', { direction: 'vertical' }, 1000, callback);
}

