var Comment = {
  init: function() {
    $('form.new_comment').on('ajax:success', this.clearTextArea);
    $('form.new_comment').on('ajax:success', this.addCommentCount);
    
    $('.comments').on('click', 'a.icon-remove', this.confirmDelete);
    $('.comments').on('ajax:success', 'a.icon-remove', this.deleteComment);
    $('.comments').on('ajax:success', 'a.icon-remove', this.subtractCommentCount);
  },

  confirmDelete: function() {
    if (!confirm("Are you sure you want to delete this comment?")) return false;
  },

  clearTextArea: function() {
    $('textarea#comment_content').val("");
  },

  deleteComment: function() {
    $(this).parent().parent().parent('.commentBlock').hide('slow');
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
