var Comment = {
  init: function() {
    $('form.new_comment').on('ajax:success', this.appendComment);
    $('form.new_comment').on('ajax:success', this.clearTextArea);
    
    $('.comments').on('click', 'a.icon-remove', this.confirmDelete);
    $('.comments').on('ajax:success', 'a.icon-remove', this.deleteComment);

    // $('form.new_comment').on('ajax:error', this.showErrors);
  },
    
  appendComment: function(event, data) {
    $('li#comment_errors').hide();
    $('ul.comments').append('<li>' + data.comment.content + '</li>');
    $('ul.comments').append('Posted by: ' + data.user.name);                         
  },

  // showErrors: function(xhr, data, status) {
  //   if (data.statusText == "Unauthorized") return window.location = data.responseText
  //     $('ul.comments').before("<li id='comment_errors'>" + data.responseText + "</li>");
  // },

  confirmDelete: function() {
    if (!confirm("Are you sure you want to delete this comment?")) return false;
  },

  clearTextArea: function() {
    $('textarea#comment_content').val("");
  },

  deleteComment: function() {
    $(this).parent('li').hide('slow');
  }
}

$(document).ready(function() {
  Comment.init();
});
