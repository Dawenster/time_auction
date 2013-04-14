var Comment = {
  init: function() {
    $('form.new_comment').on('ajax:success', this.appendComment);
    $('form.new_comment').on('ajax:success', this.clearTextArea);
    $('form.new_comment').on('ajax:success', this.addCommentCount);
    
    $('.comments').on('click', 'a.icon-remove', this.confirmDelete);
    $('.comments').on('ajax:success', 'a.icon-remove', this.deleteComment);
    $('.comments').on('ajax:success', 'a.icon-remove', this.subtractCommentCount);

    $('form.new_comment').on('ajax:error', this.showErrors);
  },
    
  appendComment: function(event, data) {
    $('li#comment_errors').hide();
    $(this).siblings("ul").prepend('<div class="posted_by">Posted by: ' + data.user.name + '</div>');
    $(this).siblings("ul").prepend('<li class="comment">' + data.comment.content + '</li>'); //Can add deleteIcon in the future
  },

  showErrors: function(xhr, data, status) {
    if (data.statusText == "Unauthorized") return window.location = data.responseText
      $('ul.comments').before("<li id='comment_errors'>" + data.responseText + "</li>");
  },

  confirmDelete: function() {
    if (!confirm("Are you sure you want to delete this comment?")) return false;
  },

  clearTextArea: function() {
    $('textarea#comment_content').val("");
  },

  deleteComment: function() {
    $(this).parent().parent('li').hide('slow');
  },

  addCommentCount: function() {
    newVal = parseInt($('#commentCount').text());
    $('#commentCount').text(newVal + 1);
  },

  subtractCommentCount: function() {
    newVal = parseInt($('#commentCount').text());
    $('#commentCount').text(newVal - 1);
  }
}

$(document).ready(function() {
  Comment.init();
});
